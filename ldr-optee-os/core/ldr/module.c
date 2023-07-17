/**
 * linux: /kernel/module.c
 * 
 * For now, we only consider 32-bit ELF for ARMv7
 * 
 * 
*/

#include <compiler.h>
#include <inttypes.h>
#include <malloc.h>
#include <mm/core_mmu.h>
#include <mm/tee_pager.h>
#include <mm/tee_mm.h>
#include <stdio.h>
#include <string.h>
#include <string_ext.h>
#include <tee_internal_api_extensions.h>
#include <types_ext.h>
#include <kernel/spinlock.h>
#include <kernel/cache_helpers.h>

#include <ldr/ldr.h>
#include <ldr/state_var.h>
#include <ldr/ldr_dac.h>
#include <ldr/ldr_gate.h>

#include "module.h"
#include "bug.h"

#define elf_check_arch(x) ((x)->e_machine == EM_ARM)

#ifndef ARCH_SHF_SMALL
#define ARCH_SHF_SMALL 0
#endif

#if defined(ARM64)
#define BITS_PER_LONG 64
#else
#define BITS_PER_LONG 32
#endif

#define __ALIGN_MASK(x, mask)	(((x) + (mask)) & ~(mask))
#define __ALIGN(x, a)		__ALIGN_MASK(x, (typeof(x))(a) - 1)
#define ALIGN(x, a)		__ALIGN((x), (a))
#define ALIGN_DOWN(x, a)	__ALIGN((x) - ((a) - 1), (a))

# define debug_align(x) ALIGN(x, SMALL_PAGE_SIZE)

#define INIT_OFFSET_MASK (1UL << (BITS_PER_LONG-1))

extern struct sym_queue core_sym_queue;

struct load_info {
	const char *name;
	Elf_Ehdr *hdr;
	unsigned long len;
	Elf_Shdr *sechdrs;
	char *secstrings, *strtab;
	unsigned long symoffs, stroffs;
	bool sig_ok; // reseved for signature checking (TODO)
#ifdef CONFIG_KALLSYMS
	unsigned long mod_kallsyms_init_off;
#endif
	struct {
		unsigned int sym, str, mod, vers, info, pcpu;
	} index;
};

struct find_symbol_arg {
	/* Input */
	const char *name;
	bool gplok;
	bool warn;

	/* Output */
	struct module *owner;
	const int *crc;
	const struct core_symbol *sym;
};

static void free_copy(struct load_info *info) {
	free((void *)info->hdr);
}

/* Sanity checks against invalid binaries, wrong arch, weird elf version. */
static int elf_header_check(struct load_info *info)
{
	if (info->len < sizeof(*(info->hdr)))
		return TEE_ERROR_ITEM_NOT_FOUND;

	if (memcmp(info->hdr->e_ident, ELFMAG, SELFMAG) != 0
	    || info->hdr->e_type != ET_REL
	    || !elf_check_arch(info->hdr)
	    || info->hdr->e_shentsize != sizeof(Elf_Shdr))
		return TEE_ERROR_ITEM_NOT_FOUND;

	if (info->hdr->e_shoff >= info->len
	    || (info->hdr->e_shnum * sizeof(Elf_Shdr) >
		info->len - info->hdr->e_shoff))
		return TEE_ERROR_ITEM_NOT_FOUND;

	return 0;
}

int module_sig_check(struct load_info *info, int flags) {
	/**
	 * For now, we just allow every single module in, which
	 * is really bad BTW.
	 * 
	 * TODO: check module signature
	 *       We need some module authentication policies.
	*/
	return 0;
}

/**
 * Here, we design ldr version of the original linux IS_ERR().
 * The original IS_ERR() checks whether the mod pointer value
 * lies in a legal region.
 * 
 * TODO: a more sophisticated way to check the module's legality
*/
static int ptr_san(struct module *mod) {
	// For now, we just let every module pass, which is really bad.

	return 0; // success
}

/**
 * Find a module section: 0 means not found.
 * 
 * @ret: the index inside the section header table of the section 
 * 	with the name @param name. 
*/
static unsigned int 
find_sec(const struct load_info *info, const char *name) {
	unsigned int i;

	for (i = 1; i < info->hdr->e_shnum; i++) {
		Elf_Shdr *shdr = &info->sechdrs[i];
		/* Alloc bit cleared means "ignore it." */
		if ((shdr->sh_flags & SHF_ALLOC)
		    && strcmp(info->secstrings + shdr->sh_name, name) == 0)
			return i;
	}
	return 0;
}

static void *section_objs(const struct load_info *info,
			  const char *name,
			  size_t object_size,
			  unsigned int *num)
{
	unsigned int sec = find_sec(info, name);

	/* Section 0 has sh_addr 0 and sh_size 0. */
	*num = info->sechdrs[sec].sh_size / object_size;
	return (void *)info->sechdrs[sec].sh_addr;
}

/* Parse tag=value strings from .modinfo section */
static char *next_string(char *string, unsigned long *secsize) {
	/* Skip non-zero chars */
	while (string[0]) {
		string++;
		if ((*secsize)-- <= 1)
			return NULL;
	}

	/* Skip any zero padding. */
	while (!string[0]) {
		string++;
		if ((*secsize)-- <= 1)
			return NULL;
	}
	return string;
}

/**
 * Find an item of module information according to @param tag.
 * ".modinfo" is a string block will many "key=value" strings
 * about the module.
 * 
 * @ret: the info string. 
*/
static char *get_modinfo(struct load_info *info, const char *tag) {
	char *p;
	unsigned int taglen = strlen(tag);
	Elf_Shdr *infosec = &info->sechdrs[info->index.info];
	unsigned long size = infosec->sh_size;

	// thanks to rewrite_section_headers()
	for (p = (char *)infosec->sh_addr; p; p = next_string(p, &size)) {
		if (strncmp(p, tag, taglen) == 0 && p[taglen] == '=')
			return p + taglen + 1;
	}
	return NULL;
}

static int rewrite_section_headers(struct load_info *info, int flags) {
	unsigned int i;

	/* This should always be true, but let's be sure. */
	info->sechdrs[0].sh_addr = 0;

	/**
	 * Rewrite the sh_addr field of each section header to the 
	 * current kernel virtual address of each section. Thus,
	 * following references to each section can be direct,
	 * 
	 * (struct Elf_Shdr *)(sh->sh_addr)
	 * 
	 * and not offset involved, as follows,
	 * 
	 * (struct Elf_Shdr *)(sh->sh_offset + (void *)hdr)
	 * 
	*/
	for (i = 1; i < info->hdr->e_shnum; i++) {
		Elf_Shdr *shdr = &info->sechdrs[i];
		if (shdr->sh_type != SHT_NOBITS
		    && info->len < shdr->sh_offset + shdr->sh_size) {
			EMSG("Module len %lu truncated\n", info->len);
			return TEE_ERROR_ITEM_NOT_FOUND;
		}

		/** 
		 * Mark all sections sh_addr with their address in the
		 * temporary image. The original sh_addr stores the offset
		 * of the section from the beginning of the .ko ELF file.
		*/
		shdr->sh_addr = (size_t)info->hdr + shdr->sh_offset;

		/**
		 * For now, all ldr modules stays inside TEE and will not
		 * be unloaded.
		*/
		if (strstarts(info->secstrings+shdr->sh_name, ".exit"))
			shdr->sh_flags &= ~(unsigned long)SHF_ALLOC;
	}

	/* Track but don't keep modinfo and version sections. */
	if (flags & MODULE_INIT_IGNORE_MODVERSIONS)
		info->index.vers = 0; /* Pretend no __versions section! */
	else
		info->index.vers = find_sec(info, "__versions");
	/**
	 * Only sections with SHF_ALLOC bit set can be found by find_sec().
	 * Once the "__versions" section is found, the SHF_ALLOC bit is cleared
	 * indicating that this section has be used and should not be used
	 * for other purposes.
	*/
	info->sechdrs[info->index.vers].sh_flags &= ~(unsigned long)SHF_ALLOC;

	info->index.info = find_sec(info, ".modinfo");
	if (!info->index.info)
		info->name = "(missing .modinfo section)";
	else
		info->name = get_modinfo(info, "name");
	// mark ".modinfo" as should_not_be_used_later
	info->sechdrs[info->index.info].sh_flags &= ~(unsigned long)SHF_ALLOC;

	return 0;
}

/*
 * Set up our basic convenience variables (pointers to section headers,
 * search for module section index etc), and do some basic section
 * verification.
 *
 * Return the temporary module pointer (we'll replace it with the final
 * one when we move the module sections around).
 */
static struct module *
setup_load_info(struct load_info *info, int flags) {
	unsigned int i;
	int err;
	struct module *mod;
	unsigned char *elf;

	/** 
	 * Find address of .ko section header table and section strings and
	 * store them inside the corresponding fields inside struct load_info 
	 * for quick reference. 
	*/
	elf = info->hdr; // cast is necessay for pointer mathmatic ops
	info->sechdrs = (void *)(elf + info->hdr->e_shoff);
	info->secstrings = (void *)(elf
		+ info->sechdrs[info->hdr->e_shstrndx].sh_offset);
	DMSG("Found sechdrs and shstr.");

	err = rewrite_section_headers(info, flags);
	if (err) {
		EMSG("ERROR: rewrite_section_headers() fails.");
		return err;
	}

#ifdef LDR_DEBUG_LOAD_MODULE
	DMSG("SUCCESS: rewrite_section_headers");
#endif

	/* Find internal symbols and strings. */
	for (i = 1; i < info->hdr->e_shnum; i++) {
		if (info->sechdrs[i].sh_type == SHT_SYMTAB) {
			info->index.sym = i;
			// locate the strtab corresponding to the sym section
			info->index.str = info->sechdrs[i].sh_link;
			info->strtab = (char *)info->hdr
				+ info->sechdrs[info->index.str].sh_offset;
			break;
		}
	}

	info->index.mod = find_sec(info, ".gnu.linkonce.this_module");
	if (!info->index.mod) {
		EMSG("%s: No module found in object\n",
			info->name ?: "(missing .modinfo name field)");
		return TEE_ERROR_ITEM_NOT_FOUND;
	}
	/* This is temporary: point mod into copy of data. */
	mod = (void *)info->sechdrs[info->index.mod].sh_addr;

	/*
	 * If we didn't load the .modinfo 'name' field, fall back to
	 * on-disk struct mod 'name' field.
	 */
	if (!info->name)
		info->name = mod->name;

	if (info->index.sym == 0) {
		EMSG("%s: module has no symbols (stripped?)\n", info->name);
		return TEE_ERROR_ITEM_NOT_FOUND;
	}

	return mod;
}

/* module_blacklist is a comma-separated list of module names */
static char *module_blacklist = NULL;
static bool blacklisted(const char *module_name) {
	const char *p;
	size_t len;

	if (!module_blacklist)
		return false;

	for (p = module_blacklist; *p; p += len) {
		len = strcspn(p, ",");
		if (strlen(module_name) == len && !memcmp(module_name, p, len))
			return true;
		if (p[len] == ',')
			len++;
	}
	return false;
}

/* Update size with this section: return offset. */
static long get_offset(struct module *mod, unsigned int *size,
		       Elf_Shdr *sechdr, unsigned int section)
{
	long ret;

	ret = ALIGN(*size, sechdr->sh_addralign ?: 1);
	*size = ret + sechdr->sh_size;
	return ret;
}

/* Lay out the SHF_ALLOC sections in a way not dissimilar to how ld
   might -- code, read-only data, read-write data, small data.  Tally
   sizes, and place the offsets into sh_entsize fields: high bit means it
   belongs in init. */
static void layout_sections(struct module *mod, struct load_info *info)
{
	static unsigned long const masks[][2] = {
		/* NOTE: all executable code must be the first section
		 * in this array; otherwise modify the text_size
		 * finder in the two loops below */
		{ SHF_EXECINSTR | SHF_ALLOC, ARCH_SHF_SMALL },
		{ SHF_ALLOC, SHF_WRITE | ARCH_SHF_SMALL },
		{ SHF_RO_AFTER_INIT | SHF_ALLOC, ARCH_SHF_SMALL },
		{ SHF_WRITE | SHF_ALLOC, ARCH_SHF_SMALL },
		{ ARCH_SHF_SMALL | SHF_ALLOC, 0 }
	};
	unsigned int m, i;

	for (i = 0; i < info->hdr->e_shnum; i++)
		info->sechdrs[i].sh_entsize = ~0UL;

	DMSG("Core section allocation order:\n");
	for (m = 0; m < ARRAY_SIZE(masks); ++m) {
		for (i = 0; i < info->hdr->e_shnum; ++i) {
			Elf_Shdr *s = &info->sechdrs[i];
			const char *sname = info->secstrings + s->sh_name;

			if ((s->sh_flags & masks[m][0]) != masks[m][0]
			    || (s->sh_flags & masks[m][1])
			    || s->sh_entsize != ~0UL
			    || strstarts(sname, ".init"))
				continue;
			s->sh_entsize = get_offset(mod, &mod->core_layout.size, s, i);
		}
		switch (m) {
		case 0: /* executable */
			mod->core_layout.size = debug_align(mod->core_layout.size);
			mod->core_layout.text_size = mod->core_layout.size;
			break;
		case 1: /* RO: text and ro-data */
			mod->core_layout.size = debug_align(mod->core_layout.size);
			mod->core_layout.ro_size = mod->core_layout.size;
			break;
		case 2: /* RO after init */
			mod->core_layout.size = debug_align(mod->core_layout.size);
			mod->core_layout.ro_after_init_size = mod->core_layout.size;
			break;
		case 4: /* whole core */
			mod->core_layout.size = debug_align(mod->core_layout.size);
			break;
		}
	}

	DMSG("Init section allocation order:\n");
	for (m = 0; m < ARRAY_SIZE(masks); ++m) {
		for (i = 0; i < info->hdr->e_shnum; ++i) {
			Elf_Shdr *s = &info->sechdrs[i];
			const char *sname = info->secstrings + s->sh_name;

			if ((s->sh_flags & masks[m][0]) != masks[m][0]
			    || (s->sh_flags & masks[m][1])
			    || s->sh_entsize != ~0UL
			    || !strstarts(sname, ".init"))
				continue;
			s->sh_entsize = (get_offset(mod, &mod->init_layout.size, s, i)
					 | INIT_OFFSET_MASK);
			DMSG("\t%s\n", sname);
		}
		switch (m) {
		case 0: /* executable */
			mod->init_layout.size = debug_align(mod->init_layout.size);
			mod->init_layout.text_size = mod->init_layout.size;
			break;
		case 1: /* RO: text and ro-data */
			mod->init_layout.size = debug_align(mod->init_layout.size);
			mod->init_layout.ro_size = mod->init_layout.size;
			break;
		case 2:
			/*
			 * RO after init doesn't apply to init_layout (only
			 * core_layout), so it just takes the value of ro_size.
			 */
			mod->init_layout.ro_after_init_size = mod->init_layout.ro_size;
			break;
		case 4: /* whole init */
			mod->init_layout.size = debug_align(mod->init_layout.size);
			break;
		}
	}
}

static bool is_core_symbol(const Elf_Sym *src, const Elf_Shdr *sechdrs,
			unsigned int shnum, unsigned int pcpundx)
{
	const Elf_Shdr *sec;

	if (src->st_shndx == SHN_UNDEF
	    || src->st_shndx >= shnum
	    || !src->st_name)
		return false;

#ifdef CONFIG_KALLSYMS_ALL
	if (src->st_shndx == pcpundx)
		return true;
#endif

	sec = sechdrs + src->st_shndx;
	if (!(sec->sh_flags & SHF_ALLOC)
#ifndef CONFIG_KALLSYMS_ALL
	    || !(sec->sh_flags & SHF_EXECINSTR)
#endif
	    || (sec->sh_entsize & INIT_OFFSET_MASK))
		return false;

	return true;
}

/*
 * We only allocate and copy the strings needed by the parts of symtab
 * we keep.  This is simple, but has the effect of making multiple
 * copies of duplicates.  We could be more sophisticated, see
 * linux-kernel thread starting with
 * <73defb5e4bca04a6431392cc341112b1@localhost>.
 */
static void layout_symtab(struct module *mod, struct load_info *info)
{
	Elf_Shdr *symsect = info->sechdrs + info->index.sym;
	Elf_Shdr *strsect = info->sechdrs + info->index.str;
	const Elf_Sym *src;
	unsigned int i, nsrc, ndst, strtab_size = 0;

	/* Put symbol section at end of init part of module. */
	symsect->sh_flags |= SHF_ALLOC;
	symsect->sh_entsize = get_offset(mod, &mod->init_layout.size, symsect,
					 info->index.sym) | INIT_OFFSET_MASK;
	DMSG("\t%s\n", info->secstrings + symsect->sh_name);

	src = (void *)info->hdr + symsect->sh_offset;
	nsrc = symsect->sh_size / sizeof(*src);

	/* Compute total space required for the core symbols' strtab. */
	for (ndst = i = 0; i < nsrc; i++) {
		if (i == 0 
			// || is_livepatch_module(mod) 
			|| is_core_symbol(src+i, info->sechdrs, info->hdr->e_shnum,
				   info->index.pcpu)) {
			strtab_size += strlen(&info->strtab[src[i].st_name])+1;
			ndst++;
		}
	}

	/* Append room for core symbols at end of core part. */
	info->symoffs = ALIGN(mod->core_layout.size, symsect->sh_addralign ?: 1);
	info->stroffs = mod->core_layout.size = info->symoffs + ndst * sizeof(Elf_Sym);
	mod->core_layout.size += strtab_size;
	mod->core_layout.size = debug_align(mod->core_layout.size);

	/* Put string table section at end of init part of module. */
	strsect->sh_flags |= SHF_ALLOC;
	strsect->sh_entsize = get_offset(mod, &mod->init_layout.size, strsect,
					 info->index.str) | INIT_OFFSET_MASK;
	DMSG("\t%s\n", info->secstrings + strsect->sh_name);

	/* We'll tack temporary mod_kallsyms on the end. */
	mod->init_layout.size = ALIGN(mod->init_layout.size,
				      __alignof__(struct mod_kallsyms));
	info->mod_kallsyms_init_off = mod->init_layout.size;
	mod->init_layout.size += sizeof(struct mod_kallsyms);
	mod->init_layout.size = debug_align(mod->init_layout.size);
}

/**
 * The module will be put inside the corresponding IED.
*/
void *module_alloc(unsigned long size, int ied_num)
{
	void *ptr = ldr_malloc_ied(size, ied_num);
	DMSG("addr: 0x%08x.", ptr);

	return ptr;
}

static int move_module(struct module *mod, struct load_info *info,
		       int ied_num)
{
	int i;
	void *ptr;

	/* Do the allocs. */
	ptr = module_alloc(mod->core_layout.size, ied_num);
	if (!ptr) {
		EMSG("ERROR: module core memory allocation fails.");
		return -ENOMEM;
	}

	memset(ptr, 0, mod->core_layout.size);
	mod->core_layout.base = ptr;

	if (mod->init_layout.size) {
		ptr = module_alloc(mod->init_layout.size, ied_num);
		if (!ptr) {
			EMSG("ERROR: module init memory allocation fails.");
			return -ENOMEM;
		}

		memset(ptr, 0, mod->init_layout.size);
		mod->init_layout.base = ptr;
	} else
		mod->init_layout.base = NULL;

	/* Transfer each section which specifies SHF_ALLOC */
	DMSG("final section addresses:\n");
	for (i = 0; i < info->hdr->e_shnum; i++) {
		void *dest;
		Elf_Shdr *shdr = &info->sechdrs[i];

		if (!(shdr->sh_flags & SHF_ALLOC))
			continue;

		if (shdr->sh_entsize & INIT_OFFSET_MASK)
			dest = mod->init_layout.base
				+ (shdr->sh_entsize & ~INIT_OFFSET_MASK);
		else
			dest = mod->core_layout.base + shdr->sh_entsize;

		if (shdr->sh_type != SHT_NOBITS) {
			uint32_t exceptions = thread_mask_exceptions(THREAD_EXCP_ALL);
			memcpy(dest, (void *)shdr->sh_addr, shdr->sh_size);
			thread_set_exceptions(exceptions);
		}
		/* Update sh_addr to point to copy in image. */
		shdr->sh_addr = (unsigned long)dest;
		// DMSG("\t0x%lx %s\n",
		// 	(long)shdr->sh_addr, info->secstrings + shdr->sh_name);
	}

	return 0;
}

static struct module *
layout_and_allocate(struct load_info *info, int flags, int ied_num) {
	/* Module within temporary copy. */
	struct module *mod;
	unsigned int ndx;
	int err;

	mod = setup_load_info(info, flags);
	if (ptr_san(mod)) {
		EMSG("ERROR: invalid embedded module inside .ko.");
		return NULL;
	}
#ifdef LDR_DEBUG_LOAD_MODULE
	DMSG("SUCCESS: setup_load_info");
#endif

	if (blacklisted(info->name)){
		EMSG("ERROR: module is blacklisted.");
		return -EPERM;
	}

	/*
	 * Mark ro_after_init section with SHF_RO_AFTER_INIT so that
	 * layout_sections() can put it in the right place.
	 * Note: ro_after_init sections also have SHF_{WRITE,ALLOC} set.
	 */
	ndx = find_sec(info, ".data..ro_after_init");
	if (ndx)
		info->sechdrs[ndx].sh_flags |= SHF_RO_AFTER_INIT;

	/* Determine total sizes, and put offsets in sh_entsize.  For now
	   this is done generically; there doesn't appear to be any
	   special cases for the architectures. */
	layout_sections(mod, info);
#ifdef LDR_DEBUG_LOAD_MODULE
	DMSG("SUCCESS: layout_sections");
#endif
	layout_symtab(mod, info);
#ifdef LDR_DEBUG_LOAD_MODULE
	DMSG("SUCCESS: layout_symtab");
#endif

	/* Allocate and move to the final place */
	err = move_module(mod, info, ied_num);
	if (err) {
		EMSG("ERROR: module move fails.");
		return err;
	}
#ifdef LDR_DEBUG_LOAD_MODULE
	DMSG("SUCCESS: move_module");
#endif

	/* Module has been copied to its final place now: return it. */
	mod = (void *)info->sechdrs[info->index.mod].sh_addr;

	return mod;
}

/**
 * ldr specific version for symbol finding
*/
uint32_t res_sym_lock;
uint32_t res_sym_lock_flag;
unsigned char tmp_str[30];

const struct core_symbol *find_symbol(const char *name) {
	struct core_symbol_node *csym_node;
	struct core_symbol *sym = NULL;
	uint32_t len;

	res_sym_lock_flag = cpu_spin_lock_xsave(&res_sym_lock);
	TAILQ_FOREACH(csym_node, &core_sym_queue, link) {
		if (strcmp(csym_node->sym.name, name) == 0) {
			sym = &csym_node->sym;
			break;
		}
	}
	cpu_spin_unlock_xrestore(&res_sym_lock, res_sym_lock_flag);

	if (sym == NULL) {
		EMSG("ERROR: Failed to find symbol %s\n", name);
	}

	return sym;
}

vaddr_t find_sym_addr(const char *func_name) {
	struct core_symbol *sym = NULL;

	sym = find_symbol(func_name);

	if (sym != NULL) {
		return sym->value;
	} else {
		EMSG("ERROR: No function named %s.", func_name);
	}

	return 0;
}

/* Resolve a symbol for this module.  I.e. if we find one, record usage. */
static const struct core_symbol *resolve_symbol(struct module *mod,
						const struct load_info *info,
						const char *name,
						char ownername[])
{
	struct module *owner;
	const struct core_symbol *sym;
	const int *crc;
	int err;

	sym = find_symbol(name);
	if (!sym) {
		EMSG("ERROR: find_symbol() fails");
		return NULL;
	}

	return sym;
}

/* Change all symbols so that st_value encodes the pointer directly. */
static int simplify_symbols(struct module *mod, const struct load_info *info)
{
	Elf_Shdr *symsec = &info->sechdrs[info->index.sym];
	Elf_Sym *sym = (void *)symsec->sh_addr;
	unsigned long secbase;
	unsigned int i;
	int ret = 0;
	const struct core_symbol *csym;
	char owner[MODULE_NAME_LEN];

	for (i = 1; i < symsec->sh_size / sizeof(Elf_Sym); i++) {
		const char *name = info->strtab + sym[i].st_name;

		switch (sym[i].st_shndx) {
		case SHN_COMMON:
			/* Ignore common symbols */
			if (!strncmp(name, "__gnu_lto", 9))
				break;
			#ifdef LDR_DEBUG_SYM_RESOLUTION
			DMSG("Common symbol: %s\n", name);
			#endif

			/* We compiled with -fno-common.  These are not
			   supposed to happen.  */			
			DMSG("%s: please compile with -fno-common\n",
			       mod->name);
			ret = TEE_ERROR_ITEM_NOT_FOUND;
			break;

		case SHN_ABS:
			/* Don't need to do anything */
			break;

		case SHN_UNDEF:
			csym = resolve_symbol(mod, info, name, owner);
			/* Ok if resolved.*/
			if (csym) {
				sym[i].st_value = csym->value;
				#ifdef LDR_DEBUG_SYM_RESOLUTION
				DMSG("UND     value: %p, sym: %s", sym[i].st_value, name);
				#endif
				break;
			}

			EMSG("Unknown symbol %s\n", name);
			if (!csym) {
				return -ENOENT;
			}
			break;

		default:
			secbase = info->sechdrs[sym[i].st_shndx].sh_addr;
			sym[i].st_value += secbase;
			break;
		}
	}

	return ret;
}

static bool is_tee_symbol(const char *name) {
	const struct core_symbol *sym;

	sym = find_symbol(name);
	if (!sym) {
		EMSG("ERROR: find_symbol() fails");
		return NULL;
	}

	if (sym->id == 0) {
		return true;
	}

	return false;
}

int
apply_relocate(Elf32_Shdr *sechdrs, const char *strtab, unsigned int symindex,
	       unsigned int relindex, struct module *module)
{
	Elf32_Shdr *symsec = sechdrs + symindex;
	// dst is the section before src
	Elf32_Shdr *relsec = sechdrs + relindex;
	Elf32_Shdr *dstsec = sechdrs + relsec->sh_info;
	Elf32_Rel *rel = (void *)relsec->sh_addr;
	unsigned int i;

	for (i = 0; i < relsec->sh_size / sizeof(Elf32_Rel); i++, rel++) {
		unsigned long loc;
		Elf32_Sym *sym;
		const char *symname;
		volatile int offset;
		uint tmp;
		volatile uint symvalue_tmp;

		// r_info: relocation type and symbol index (offset)
		offset = ELF32_R_SYM(rel->r_info);
		if (offset < 0 
			|| offset > (symsec->sh_size / sizeof(Elf32_Sym))) {
			EMSG("%s: section %u reloc %u: bad relocation sym offset\n",
				module->name, relindex, i);
			return TEE_ERROR_BAD_PARAMETERS;
		}

		sym = ((Elf32_Sym *)symsec->sh_addr) + offset;
		symname = strtab + sym->st_name;

		if (rel->r_offset < 0 || 
		    rel->r_offset > dstsec->sh_size - sizeof(uint)) {
			EMSG("%s: section %u reloc %u sym '%s': out of bounds "
				   "relocation, offset %d size %u\n",
			       module->name, relindex, i, symname,
			       rel->r_offset, dstsec->sh_size);
			return TEE_ERROR_ITEM_NOT_FOUND;
		}

		loc = dstsec->sh_addr + rel->r_offset;

		switch (ELF32_R_TYPE(rel->r_info)) {
		case R_ARM_NONE:
			/* ignore */
			break;

		case R_ARM_ABS32:
		case R_ARM_TARGET1:
			*(uint *)loc += sym->st_value;
			break;

		case R_ARM_PC24:
		case R_ARM_CALL:
		case R_ARM_JUMP24:
			if (sym->st_value & 3) {
				EMSG("%s: section %u reloc %u sym '%s': unsupported "
					   "interworking call (ARM -> Thumb)\n",
				       module->name, relindex, i, symname);
				return TEE_ERROR_BAD_PARAMETERS;
			}

			/* ldr gate hook for tee funtions */
			if (sym->st_shndx == SHN_UNDEF &&
			    is_tee_symbol(symname)) {
				add_hook_map_entry(cur_hook_info,
						loc, sym->st_value);
				symvalue_tmp = ldr_gate_hook;
				// DMSG("use ldr gate hook, loc: %p, value:%p, sym:%s", 
				//      loc, symvalue_tmp, symname);
				if (strcmp(symname, "ldr_fiq_callback") == 0) {
					/* skip ldr_fiq_callback */
					symvalue_tmp = sym->st_value;
				}
			} else { /* driver symbols are directly linked */
				symvalue_tmp = sym->st_value;
				// DMSG("drv function,      loc: %p, value:%p, sym:%s",
				//      loc, symvalue_tmp, symname);
			}

			offset = __mem_to_opcode_arm(*(uint *)loc);
			offset = (offset & 0x00ffffff) << 2;
			if (offset & 0x02000000)
				offset -= 0x04000000;

			offset += symvalue_tmp - loc;

			if (offset <= (int)0xfe000000 ||
			    offset >= (int)0x02000000) {
				EMSG("%s: section %u reloc %u sym '%s': relocation %u "
					   "out of range (%#lx -> %#x)\n",
				       module->name, relindex, i, symname,
				       ELF32_R_TYPE(rel->r_info), loc,
				       symvalue_tmp);
				return TEE_ERROR_GENERIC;
			}

			offset >>= 2;
			offset &= 0x00ffffff;

			*(uint *)loc &= __opcode_to_mem_arm(0xff000000);
			*(uint *)loc |= __opcode_to_mem_arm(offset);
			break;

		case R_ARM_V4BX:
			/* Preserve Rm and the condition code. Alter
			 * other bits to re-code instruction as
			 * MOV PC,Rm.
			 */
			*(uint *)loc &= __opcode_to_mem_arm(0xf000000f);
			*(uint *)loc |= __opcode_to_mem_arm(0x01a0f000);
			break;

		case R_ARM_PREL31:
			offset = (*(int *)loc << 1) >> 1; /* sign extend */
			offset += sym->st_value - loc;
			if (offset >= 0x40000000 || offset < -0x40000000) {
				EMSG("%s: section %u reloc %u sym '%s': relocation %u "
					   "out of range (%#lx -> %#x)\n",
				       module->name, relindex, i, symname,
				       ELF32_R_TYPE(rel->r_info), loc,
				       sym->st_value);
				return TEE_ERROR_ITEM_NOT_FOUND;
			}
			*(uint *)loc &= 0x80000000;
			*(uint *)loc |= offset & 0x7fffffff;
			break;

		case R_ARM_MOVW_ABS_NC:
		case R_ARM_MOVT_ABS:
			offset = tmp = __mem_to_opcode_arm(*(uint *)loc);
			offset = ((offset & 0xf0000) >> 4) | (offset & 0xfff);
			offset = (offset ^ 0x8000) - 0x8000;

			offset += sym->st_value;
			if (ELF32_R_TYPE(rel->r_info) == R_ARM_MOVT_ABS)
				offset >>= 16;

			tmp &= 0xfff0f000;
			tmp |= ((offset & 0xf000) << 4) |
				(offset & 0x0fff);

			*(uint *)loc = __opcode_to_mem_arm(tmp);
			break;

		default:
			EMSG("%s: unknown relocation: %u\n",
			       module->name, ELF32_R_TYPE(rel->r_info));
			return TEE_ERROR_ITEM_NOT_FOUND;
		}
	}
	return TEE_SUCCESS;
}

static int apply_relocations(struct module *mod, const struct load_info *info)
{
	unsigned int i;
	int err = 0;

	cur_hook_info = alloc_hook_info();

	/* Now do relocations. */
	for (i = 1; i < info->hdr->e_shnum; i++) {
		unsigned int infosec = info->sechdrs[i].sh_info;

		/* Not a valid relocation section? */
		if (infosec >= info->hdr->e_shnum)
			continue;

		/* Don't bother with non-allocated sections */
		if (!(info->sechdrs[infosec].sh_flags & SHF_ALLOC))
			continue;

		if (info->sechdrs[i].sh_type == SHT_REL)
			err = apply_relocate(info->sechdrs, info->strtab,
					     info->index.sym, i, mod);
		else if (info->sechdrs[i].sh_type == SHT_RELA) {
			EMSG("ERROR: ARM32 should not use RELA.");
			return TEE_ERROR_ITEM_NOT_FOUND;
		}

		if (err < 0)
			break;
	}
	return err;
}

static char elf_type(const Elf_Sym *sym, const struct load_info *info)
{
	const Elf_Shdr *sechdrs = info->sechdrs;

	if (ELF_ST_BIND(sym->st_info) == STB_WEAK) {
		if (ELF_ST_TYPE(sym->st_info) == STT_OBJECT)
			return 'v';
		else
			return 'w';
	}
	if (sym->st_shndx == SHN_UNDEF)
		return 'U';
	if (sym->st_shndx == SHN_ABS || sym->st_shndx == info->index.pcpu)
		return 'a';
	if (sym->st_shndx >= SHN_LORESERVE)
		return '?';
	if (sechdrs[sym->st_shndx].sh_flags & SHF_EXECINSTR)
		return 't';
	if (sechdrs[sym->st_shndx].sh_flags & SHF_ALLOC
	    && sechdrs[sym->st_shndx].sh_type != SHT_NOBITS) {
		if (!(sechdrs[sym->st_shndx].sh_flags & SHF_WRITE))
			return 'r';
		else if (sechdrs[sym->st_shndx].sh_flags & ARCH_SHF_SMALL)
			return 'g';
		else
			return 'd';
	}
	if (sechdrs[sym->st_shndx].sh_type == SHT_NOBITS) {
		if (sechdrs[sym->st_shndx].sh_flags & ARCH_SHF_SMALL)
			return 's';
		else
			return 'b';
	}
	if (strstarts(info->secstrings + sechdrs[sym->st_shndx].sh_name,
		      ".debug")) {
		return 'n';
	}
	return '?';
}

/*
 * We use the full symtab and strtab which layout_symtab arranged to
 * be appended to the init section.  Later we switch to the cut-down
 * core-only ones.
 */
static void add_kallsyms(struct module *mod, const struct load_info *info)
{
	unsigned int i, ndst;
	const Elf_Sym *src;
	Elf_Sym *dst;
	char *s;
	Elf_Shdr *symsec = &info->sechdrs[info->index.sym];

	/* Set up to point into init section. */
	mod->kallsyms = mod->init_layout.base + info->mod_kallsyms_init_off;

	mod->kallsyms->symtab = (void *)symsec->sh_addr;
	mod->kallsyms->num_symtab = symsec->sh_size / sizeof(Elf_Sym);
	/* Make sure we get permanent strtab: don't use info->strtab. */
	mod->kallsyms->strtab = (void *)info->sechdrs[info->index.str].sh_addr;

	/* Set types up while we still have access to sections. */
	for (i = 0; i < mod->kallsyms->num_symtab; i++)
		mod->kallsyms->symtab[i].st_info
			= elf_type(&mod->kallsyms->symtab[i], info);

	/* Now populate the cut down core kallsyms for after init. */
	mod->core_kallsyms.symtab = dst = mod->core_layout.base + info->symoffs;
	mod->core_kallsyms.strtab = s = mod->core_layout.base + info->stroffs;
	src = mod->kallsyms->symtab;
	for (ndst = i = 0; i < mod->kallsyms->num_symtab; i++) {
		if (i == 0 
		    || is_core_symbol(src+i, info->sechdrs, info->hdr->e_shnum,
				      info->index.pcpu)) {
			dst[ndst] = src[i];
			dst[ndst++].st_name = s - mod->core_kallsyms.strtab;
			s += strlcpy(s, &mod->kallsyms->strtab[src[i].st_name],
				     KSYM_NAME_LEN) + 1;
		}
	}
	mod->core_kallsyms.num_symtab = ndst;
}

struct mod_unwind_map {
	const Elf_Shdr *unw_sec;
	const Elf_Shdr *txt_sec;
};

static const Elf_Shdr *find_mod_section(const Elf32_Ehdr *hdr,
	const Elf_Shdr *sechdrs, const char *name)
{
	const Elf_Shdr *s, *se;
	const char *secstrs = (void *)hdr + sechdrs[hdr->e_shstrndx].sh_offset;

	for (s = sechdrs, se = sechdrs + hdr->e_shnum; s < se; s++)
		if (strcmp(name, secstrs + s->sh_name) == 0)
			return s;

	return NULL;
}

int module_finalize(const Elf32_Ehdr *hdr, const Elf_Shdr *sechdrs,
		    struct module *mod)
{
	const Elf_Shdr *s = NULL;
#ifdef CONFIG_ARM_UNWIND
	const char *secstrs = (void *)hdr + sechdrs[hdr->e_shstrndx].sh_offset;
	const Elf_Shdr *sechdrs_end = sechdrs + hdr->e_shnum;
	struct mod_unwind_map maps[ARM_SEC_MAX];
	int i;

	memset(maps, 0, sizeof(maps));

	for (s = sechdrs; s < sechdrs_end; s++) {
		const char *secname = secstrs + s->sh_name;

		if (!(s->sh_flags & SHF_ALLOC))
			continue;

		if (strcmp(".ARM.exidx.init.text", secname) == 0)
			maps[ARM_SEC_INIT].unw_sec = s;
		else if (strcmp(".ARM.exidx", secname) == 0)
			maps[ARM_SEC_CORE].unw_sec = s;
		else if (strcmp(".ARM.exidx.exit.text", secname) == 0)
			maps[ARM_SEC_EXIT].unw_sec = s;
		else if (strcmp(".ARM.exidx.text.unlikely", secname) == 0)
			maps[ARM_SEC_UNLIKELY].unw_sec = s;
		else if (strcmp(".ARM.exidx.text.hot", secname) == 0)
			maps[ARM_SEC_HOT].unw_sec = s;
		else if (strcmp(".init.text", secname) == 0)
			maps[ARM_SEC_INIT].txt_sec = s;
		else if (strcmp(".text", secname) == 0)
			maps[ARM_SEC_CORE].txt_sec = s;
		else if (strcmp(".exit.text", secname) == 0)
			maps[ARM_SEC_EXIT].txt_sec = s;
		else if (strcmp(".text.unlikely", secname) == 0)
			maps[ARM_SEC_UNLIKELY].txt_sec = s;
		else if (strcmp(".text.hot", secname) == 0)
			maps[ARM_SEC_HOT].txt_sec = s;
	}

#endif

	return 0;
}

static int post_relocation(struct module *mod, const struct load_info *info)
{
	/* Setup kallsyms-specific fields. */
	add_kallsyms(mod, info);

	/* Arch-specific module finalizing. */
	return module_finalize(info->hdr, info->sechdrs, mod);
}

static int find_module_sections(struct module *mod, struct load_info *info)
{
	mod->syms = section_objs(info, "__ksymtab",
				 sizeof(*mod->syms), &mod->num_syms);

	return 0;
}

struct linux_symbol {
	unsigned long value;
	const char *name;
};

static int add_export_symbols(struct module *mod, 
			      struct load_info *info,
			      int id) {
	struct linux_symbol *s;

	if (mod->syms == NULL || mod->num_syms < 1) {
		return 0;
	}

	for (s = mod->syms; s < mod->syms + mod->num_syms; s++) {
		struct core_symbol_node *sym_node = 
			calloc(1, sizeof(*sym_node));

		if (!sym_node) {
			EMSG("Error: sym_node allocation fails.");
			return TEE_ERROR_OUT_OF_MEMORY;
		}

		sym_node->sym.value = s->value;
		sym_node->sym.name = s->name;
		sym_node->sym.id = id;

		DMSG("EXPORT SYM name: %s, value: 0x%08x.", 
			sym_node->sym.name, sym_node->sym.value);
		
		TAILQ_INSERT_TAIL(&core_sym_queue, sym_node, link);
	}

	return 0;
}

static Elf_Shdr *
get_secure_element_section(struct module *mod, struct load_info *info) {
	unsigned int sec = find_sec(info, ".sec_ele");

	if (sec == 0) { /* this driver has no secure elements */
		return NULL;
	}

	return &(info->sechdrs[sec]);
}

/* Allocate and load the module: note that size of section 0 is always
   zero, and we rely on this for optional sections. */
static int 
load_module(struct load_info *info, const char *args, int flags, int ied_num) {
	struct module *mod;
	long err;
	char *after_dashes;
	unsigned long start, init_start, end;
	struct ldr_driver_info * drv_info;

	err = module_sig_check(info, flags);
	if (err) {
		EMSG("ERROR: Illegal module detected.");
		goto free_copy;
	}

	err = elf_header_check(info);
	if (err) {
		EMSG("Error: .ko ELF header check fails.");
		goto free_copy;
	}
#ifdef LDR_DEBUG_LOAD_MODULE
	DMSG("SUCCESS: elf_header_check");
	// print some ELF meta data
	uint32_t shstrndx = info->hdr->e_shstrndx;
	uint32_t shnum = info->hdr->e_shnum;
	uint32_t shoff = info->hdr->e_shoff;
	unsigned char *elf = info->hdr;

	DMSG(".ko elf address: %p", elf);
	Elf_Shdr *shrs = elf + shoff;
	DMSG("section header offset : 0x%08x", shoff);
	DMSG("section header address: %p", shrs);
	char *shstr = (char *)(elf + shrs[shstrndx].sh_offset);
	DMSG("section header string address: %p", shstr);

	for (int i = 1; i < shnum; i++) {
		DMSG("[%02d] %s", i, shstr + shrs[i].sh_name);
	}
#endif

	mod = layout_and_allocate(info, flags, ied_num);
	if (!mod) {
		EMSG("ERROR: mod layout_and_allocate fails.");
		goto free_copy;
	}

	/* find __ksymtab section */
	err = find_module_sections(mod, info);
	if (err) {
		EMSG("Error: find_module_sections() fails.");
		goto free_copy;
	}

	/* Fix up syms, so that st_value is a pointer to location. */
	err = simplify_symbols(mod, info);
	if (err < 0)
		goto free_modinfo;

	err = apply_relocations(mod, info);
	if (err < 0)
		goto free_modinfo;

	err = post_relocation(mod, info);
	if (err < 0)
		goto free_modinfo;
#ifdef LDR_DEBUG_RELOCATION
	DMSG("SUCCESS: relocation");
#endif

	/* get secure element array if any */
	Elf32_Shdr *sec = NULL;
	sec = get_secure_element_section(mod, info);

	if (sec != NULL) { /* current driver has secure elements */
		set_current_se_sec_array((uint32_t *)sec->sh_addr);
		set_current_se_sec_array_size(sec->sh_size);

		#ifdef LDR_STATE_VAR_DEBUG
		dhex_dump(NULL, 0, 0, (void *)get_current_se_sec_array(), 
			get_current_se_sec_array_size());
		#endif
	} else {
		set_current_se_sec_array((uint32_t *)NULL);
		set_current_se_sec_array_size(0);
	}

	mod->state = MODULE_STATE_COMING;
	#ifdef LDR_GATE_DEBUG
	// print_hook_info(cur_hook_info);

	DMSG("driver core [%p, %p], init [%p, %p].",
	     mod->core_layout.base, 
	     mod->core_layout.base + mod->core_layout.size,
	     mod->init_layout.base, 
	     mod->init_layout.base + mod->init_layout.size);
	#endif

	/* CAUTION: we MUST clean cache before brute jump */
	icache_inv_all();
	dcache_op_all(DCACHE_OP_CLEAN_INV);

	if (mod->init != NULL) {
		invoke_drv_init(mod->init, get_cur_ied_num());
		// (mod->init)();
	} else {
		EMSG("ERROR: invalid module entry point %p.", mod->init);
		return TEE_ERROR_BAD_PARAMETERS;
	}

	/* attach hook info to the current driver */
	drv_info = ldr_get_driver_info(ldr_sw_get_cur_driver_id());
	if (drv_info == NULL){
		EMSG("ERROR: NULL driver info.");
		return TEE_ERROR_BAD_STATE;
	}
	drv_info->hook_info = cur_hook_info;

	/* save module info to ldr driver info */
	drv_info->mod = mod;

	/* add module exported symbols to global symbol list */
	err = add_export_symbols(mod, info, drv_info->id);
	if (err < 0)
		goto free_modinfo;

	return TEE_SUCCESS;

free_modinfo:
free_unload:
free_copy:
	free_copy(info);
	return err;
}

static int 
copy_module_from_shm(void *mod, unsigned long len, 
		     struct load_info *info, int ied_num) 
{
	int err;

	info->len = len;
	if (info->len < sizeof(*(info->hdr))) {
		EMSG("ERROR: Invalid LDR module size.");
		return TEE_ERROR_ITEM_NOT_FOUND;
	}

	info->hdr = ldr_malloc_ied(len, ied_num);
	if (info->hdr == NULL) {
		EMSG("ERROR: core mem allocation for LDR module fails.");
		return -ENOMEM;
	}

	uint32_t exceptions = thread_mask_exceptions(THREAD_EXCP_ALL);
	memcpy(info->hdr, mod, len);
	thread_set_exceptions(exceptions);

	return 0;
}

/**
 * For now, ldr does not support args passing from NW. The primary
 * aim of ldr is to create a runtime for original linux kernel driver
 * modules which generally accept no args.
*/
int init_module(void *mod, unsigned long len, int ied_num) {
	int err = 0;
	unsigned long start_time, end_time;
	struct load_info m_info = {};
	DMSG("init_module: mod=%p, len=0x%08x, ied: %d", mod, len, ied_num);

	/**
	 * The module .ko binary is now still inside the shared memory,
	 * we need to move it to the optee core memory.
	*/
	err = copy_module_from_shm(mod, len, &m_info, ied_num);
	if (err)
		return err;

#ifdef LDR_DEBUG_NW_MODULE_READ
	DMSG("SUCCESS: copy_module_from_shm");
#endif

	return load_module(&m_info, NULL, 0, ied_num);
}
