/**
 * linux: /include/linux/module.h
 * 
 * For now, ldr only considers 32-bit ELF for ARMv7
 * 
 * 
*/
#ifndef _MODULE_H_
#define _MODULE_H_

#include <elf32.h>
#include <elf_common.h>

#include <kernel/export.h>
#include "ldr_err.h"
#include "opcodes.h"
#include "types.h"

typedef int (*drv_init)(void);

/**
 * Linux kernel CONFIG_s for imx-linux 4.14.98
*/
#define CONFIG_SYSFS			1
#define CONFIG_GENERIC_BUG		1
#define CONFIG_KALLSYMS			1
#define CONFIG_SMP			1
#define CONFIG_MODULE_UNLOAD		1

#define CONFIG_MODULES_TREE_LOOKUP	1

#define CONFIG_ARM_UNWIND		1

/* debug switches */
#define LDR_DEBUG_SYMBOL_SUBSYSTEM	1

// #define LDR_DEBUG			1
#ifdef LDR_DEBUG
#define LDR_DEBUG_STRUCT_MODULE_INFO	1
#define LDR_DEBUG_NW_MODULE_READ	1
#define LDR_DEBUG_LOAD_MODULE		1
#define LDR_DEBUG_SYM_RESOLUTION	1
#define LDR_DEBUG_RELOCATION		1
#endif

/**
 * Flags for sys_finit_module. 
*/
#define MODULE_INIT_IGNORE_MODVERSIONS	1
#define MODULE_INIT_IGNORE_VERMAGIC	2

typedef Elf32_Addr Elf_Addr;
typedef Elf32_Half Elf_Half;
typedef Elf32_Off Elf_Off;
typedef Elf32_Sword Elf_Sword;
typedef Elf32_Word Elf_Word;
typedef Elf32_Lword Elf_Lword;
typedef Elf32_Hashelt Elf_Hashelt;
typedef Elf32_Size Elf_Size;
typedef Elf32_Ssize Elf_Ssize;
typedef Elf32_Ehdr Elf_Ehdr;
typedef Elf32_Shdr Elf_Shdr;
typedef Elf32_Phdr Elf_Phdr;
typedef Elf32_Dyn Elf_Dyn;
typedef Elf32_Rel Elf_Rel;
typedef Elf32_Rela Elf_Rela;
typedef Elf32_Move Elf_Move;
typedef Elf32_Cap Elf_Cap;
typedef Elf32_Sym Elf_Sym;
typedef Elf32_Verdef Elf_Verdef;
typedef Elf32_Verdaux Elf_Verdaux;
typedef Elf32_Verneed Elf_Verneed;
typedef Elf32_Vernaux Elf_Vernaux;
typedef Elf32_Syminfo Elf_Syminfo;

#define ELF_ST_BIND(x)		((x) >> 4)
#define ELF_ST_TYPE(x)		(((unsigned int) x) & 0xf)
#define ELF32_ST_BIND(x)	ELF_ST_BIND(x)
#define ELF32_ST_TYPE(x)	ELF_ST_TYPE(x)
#define ELF64_ST_BIND(x)	ELF_ST_BIND(x)
#define ELF64_ST_TYPE(x)	ELF_ST_TYPE(x)

#define MODULE_NAME_LEN (64 - sizeof(long))
#define KSYM_NAME_LEN 128

/**
 * cache alignment is needed because the core_layout and init_layout
 * are cache aligned, which influence the final module struct image
 * inside the .ko elf.
 * 
 * The cache alignment is concerned when SMP is considered, which is 
 * the case for our current .ko elf.
*/
#define L1_CACHE_BYTES 64
#define SMP_CACHE_BYTES L1_CACHE_BYTES
#ifndef ____cacheline_aligned
#define ____cacheline_aligned __attribute__((__aligned__(SMP_CACHE_BYTES)))
#endif

#define __module_layout_align ____cacheline_aligned

struct mod_kallsyms {
	Elf_Sym *symtab;
	unsigned int num_symtab;
	char *strtab;
};

enum module_state {
	MODULE_STATE_LIVE,	/* Normal state. */
	MODULE_STATE_COMING,	/* Full formed, running module_init. */
	MODULE_STATE_GOING,	/* Going away. */
	MODULE_STATE_UNFORMED,	/* Still setting it up. */
};

struct module_layout {
	/* The actual code + data. */
	void *base;
	/* Total size. */
	unsigned int size;
	/* The size of the executable code.  */
	unsigned int text_size;
	/* Size of RO section of the module (text+rodata) */
	unsigned int ro_size;
	/* Size of RO after init section */
	unsigned int ro_after_init_size;

#ifdef CONFIG_MODULES_TREE_LOOKUP
	// struct mod_tree_node mtn; /* replace */
	unsigned char mtn[28];
#endif
};

/**
 * 'struct core_symbol' is just OPTEE version of Linux 
 * 'struct kernel_symbol'. Both can be casted inter-changebly.
 * Here we want to adhere to the original Linux naming scheme.
*/
typedef struct {
    unsigned long value;
    const char *name;
} kernel_symbol;

#define PLT_ENT_STRIDE		L1_CACHE_BYTES
#define PLT_ENT_COUNT		(PLT_ENT_STRIDE / sizeof(uint32_t))
#define PLT_ENT_SIZE		(sizeof(struct plt_entries) / PLT_ENT_COUNT)

#define PLT_ENT_LDR		__opcode_to_mem_arm(0xe59ff000 | \
						    (PLT_ENT_STRIDE - 8))

struct plt_entries {
	uint32_t ldr[PLT_ENT_COUNT];
	uint32_t lit[PLT_ENT_COUNT];
};

#ifdef CONFIG_ARM_UNWIND
enum {
	ARM_SEC_INIT,
	ARM_SEC_DEVINIT,
	ARM_SEC_CORE,
	ARM_SEC_EXIT,
	ARM_SEC_DEVEXIT,
	ARM_SEC_HOT,
	ARM_SEC_UNLIKELY,
	ARM_SEC_MAX,
};
#endif

struct mod_arch_specific {
#ifdef CONFIG_ARM_UNWIND
	struct unwind_table *unwind[ARM_SEC_MAX];
#endif
};

struct module {
	enum module_state state;

	/* Member of list of modules */
	struct list_head list;

	/* Unique handle for this module */
	char name[MODULE_NAME_LEN];

	/**
	 * In OPTEE core, ldr does not need to maintain structures for
	 * sysfs. However, we need to reserve right space for the 
	 * following data structs if we want to parse the embedded 
	 * 'struct module' right.
	 * 
	 * TODO: First, for simplicity we can just record the right
	 *       size by writing a testing kernel module for this project.
	 *       The right size needs to be modified for a different
	 *       project (platform, kernel versions, etc).
	 * 
	 * TODO: Second, we need a project to extract these sizes from
	 *       Linux kernel sources automatically. The same project is
	 *       also used for automatic Linux configuration options
	 *       extraction.
	 */

	/* Sysfs stuff. */
	// struct module_kobject mkobj; /* replace */
	unsigned char mkobj[52];
	// struct module_attribute *modinfo_attrs; /* replace */
	unsigned char modinfo_attrs[4];
	// const char *version; /* replace */
	unsigned char version[4];
	// const char *srcversion; /* replace */
	unsigned char srcversion[4];
	// struct kobject *holders_dir; /* replace */
	unsigned char holders_dir[4];

	/* Exported symbols */
	const struct core_symbol *syms;
	const int *crcs;
	unsigned int num_syms;

	/**
	 * For now, ldr does not leverage kernel params.
	*/
	/* Kernel parameters. */
#ifdef CONFIG_SYSFS
	// struct mutex param_lock; /* replace */
	unsigned char param_lock[20];
#endif
	// struct kernel_param *kp; /* replace */
	unsigned char kp[4];
	// unsigned int num_kp; /* replace */
	unsigned char num_kp[4];

	/* GPL-only exported symbols. */
	unsigned int num_gpl_syms;
	const struct core_symbol *gpl_syms;
	const int *gpl_crcs;

	bool async_probe_requested;

	/* symbols that will be GPL-only in the near future. */
	const struct core_symbol *gpl_future_syms;
	const int *gpl_future_crcs;
	unsigned int num_gpl_future_syms;

	/* Exception table */
	unsigned int num_exentries;
	struct exception_table_entry *extable;

	/* Startup function. */
	int (*init)(void);

	/* Core layout: rbtree is accessed frequently, so keep together. */
	struct module_layout core_layout __module_layout_align;
	struct module_layout init_layout;

	/* Arch-specific module values */
	struct mod_arch_specific arch;

	unsigned long taints;	/* same bits as kernel:taint_flags */

#ifdef CONFIG_GENERIC_BUG
	/* Support for BUG */
	unsigned num_bugs;
	struct list_head bug_list;
	struct bug_entry *bug_table;
#endif

#ifdef CONFIG_KALLSYMS
	/* Protected by RCU and/or module_mutex: use rcu_dereference() */
	struct mod_kallsyms *kallsyms;
	struct mod_kallsyms core_kallsyms;

	/* Section attributes */
	struct module_sect_attrs *sect_attrs;

	/* Notes attributes */
	struct module_notes_attrs *notes_attrs;
#endif

	/* The command line arguments (may be mangled).  People like
	   keeping pointers to this stuff */
	char *args;

#ifdef CONFIG_SMP
	/* Per-cpu data. */
	// void __percpu *percpu;  /* replace */
	unsigned char percpu[4];
	// unsigned int percpu_size;  /* replace */
	unsigned char percpu_size[4];
#endif

	/**
	 * For now, ldr modules are not allowed to be unloaded.
	*/
#ifdef CONFIG_MODULE_UNLOAD
	/* What modules depend on me? */
	// struct list_head source_list; /* replace */
	unsigned char source_list[8];
	/* What modules do I depend on? */
	// struct list_head target_list; /* replace */
	unsigned char target_list[8];

	/* Destruction function. */
	// void (*exit)(void); /* replace */
	unsigned char exit[4];

	// atomic_t refcnt; /* replace */
	unsigned char refcnt[4];
#endif
} ____cacheline_aligned;

/**
 * Parameter arrangements:
 * @mod:	pointer to the module binary inside the shared memory
 * @len:	size of the module binary
 * @ied_num:	id for the module's ied
*/
int init_module(void *mod, unsigned long len, int ied_num);
void print_struct_module_info();

#endif