/* SPDX-License-Identifier: GPL-2.0-or-later */
/**
 * (C) Copyright David Gibson <dwg@au1.ibm.com>, IBM Corporation.  2005.
 * 
*/

#include <assert.h>
#include <libfdt.h>
#include <string.h>
#include <trace.h>

#include "dtc.h"
#include "dtc_util.h"

#define FTF_FULLPATH	0x1
#define FTF_VARALIGN	0x2
#define FTF_NAMEPROPS	0x4
#define FTF_BOOTCPUID	0x8
#define FTF_STRTABSIZE	0x10
#define FTF_STRUCTSIZE	0x20
#define FTF_NOPS	0x40

struct inbuf {
	char *base, *limit, *ptr;
};

static void inbuf_init(struct inbuf *inb, void *base, void *limit)
{
	inb->base = base;
	inb->limit = limit;
	inb->ptr = inb->base;
}

static void flat_read_chunk(struct inbuf *inb, void *p, int len)
{
	if ((inb->ptr + len) > inb->limit) {
		die("Premature end of data parsing flat device tree\n");
	}

	memcpy(p, inb->ptr, len);

	inb->ptr += len;
}

static uint32_t flat_read_word(struct inbuf *inb)
{
	fdt32_t val;

	assert(((inb->ptr - inb->base) % sizeof(val)) == 0);

	flat_read_chunk(inb, &val, sizeof(val));

	return fdt32_to_cpu(val);
}

static void flat_realign(struct inbuf *inb, int align)
{
	int off = inb->ptr - inb->base;

	inb->ptr = inb->base + ALIGN(off, align);
	if (inb->ptr > inb->limit) {
		die("Premature end of data parsing flat device tree\n");		
	}
}

static char *flat_read_string(struct inbuf *inb)
{
	int len = 0;
	const char *p = inb->ptr;
	char *str;

	do {
		if (p >= inb->limit) {
			die("Premature end of data parsing flat device tree\n");			
		}
		len++;
	} while ((*p++) != '\0');

	str = strdup(inb->ptr);

	inb->ptr += len;

	flat_realign(inb, sizeof(uint32_t));

	return str;
}

static struct data *flat_read_data(struct inbuf *inb, int len)
{
	struct data *d = xmalloc(sizeof(*d));
	/**
	 * Originally, empty_data with all .members = 0 or NULL. Thus, it is
	 * the right thing to initialize all the members that way.
	*/
	d->len = 0;
	d->val = NULL;
	d->markers = NULL;

	if (len == 0)
		return d;

	/* len is the new lenth */
	d = data_grow_for(d, len);
	d->len = len;

	flat_read_chunk(inb, d->val, len);

	flat_realign(inb, sizeof(uint32_t));

	return d;
}

static char *flat_read_stringtable(struct inbuf *inb, int offset)
{
	const char *p;

	p = inb->base + offset;
	while (1) {
		if (p >= inb->limit || p < inb->base) {
			die("String offset %d overruns string table\n",
			    offset);			    
		}

		if (*p == '\0')
			break;

		p++;
	}

	return strdup(inb->base + offset);
}

static struct property *flat_read_property(struct inbuf *dtbuf,
					   struct inbuf *strbuf, int flags)
{
	uint32_t proplen, stroff;
	char *name;
	struct data *val;

	proplen = flat_read_word(dtbuf);
	stroff = flat_read_word(dtbuf);

	name = flat_read_stringtable(strbuf, stroff);

	if ((flags & FTF_VARALIGN) && (proplen >= 8))
		flat_realign(dtbuf, 8);

	val = flat_read_data(dtbuf, proplen);

	return build_property(name, val);
}

static struct reserve_info *flat_read_mem_reserve(struct inbuf *inb)
{
	struct reserve_info *reservelist = NULL;
	struct reserve_info *new;
	struct fdt_reserve_entry re;

	/*
	 * Each entry is a pair of u64 (addr, size) values for 4 cell_t's.
	 * List terminates at an entry with size equal to zero.
	 *
	 * First pass, count entries.
	 */
	while (1) {
		uint64_t address, size;

		flat_read_chunk(inb, &re, sizeof(re));
		address  = fdt64_to_cpu(re.address);
		size = fdt64_to_cpu(re.size);
		if (size == 0)
			break;

		new = build_reserve_entry(address, size);
		reservelist = add_reserve_entry(reservelist, new);
	}

	return reservelist;
}

static char *nodename_from_path(const char *ppath, const char *cpath)
{
	int plen;

	plen = strlen(ppath);

	if (!strstarts(cpath, ppath)) {
		die("Path \"%s\" is not valid as a child of \"%s\"\n",
		    cpath, ppath);
	}

	/* root node is a special case */
	if (!streq(ppath, "/"))
		plen++;

	return strdup(cpath + plen);
}

static struct node *unflatten_tree(struct inbuf *dtbuf,
				   struct inbuf *strbuf,
				   const char *parent_flatname, int flags)
{
	struct node *node;
	char *flatname;
	uint32_t val;

	node = build_node(NULL, NULL);

	flatname = flat_read_string(dtbuf);

	if (flags & FTF_FULLPATH)
		node->name = nodename_from_path(parent_flatname, flatname);
	else
		node->name = flatname;

	do {
		struct property *prop;
		struct node *child;

		val = flat_read_word(dtbuf);
		switch (val) {
		case FDT_PROP:
			if (node->children)
				EMSG("Warning: Flat tree input has "
					"subnodes preceding a property.\n");
			prop = flat_read_property(dtbuf, strbuf, flags);
			add_property(node, prop);
			break;

		case FDT_BEGIN_NODE:
			child = unflatten_tree(dtbuf, strbuf, flatname, flags);
			add_child(node, child);
			break;

		case FDT_END_NODE:
			break;

		case FDT_END:
			die("Premature FDT_END in device tree blob\n");
			break;

		case FDT_NOP:
			if (!(flags & FTF_NOPS))
				EMSG("Warning: NOP tag found in flat tree"
					" version <16\n");

			/* Ignore */
			break;

		default:
			die("Invalid opcode word %08x in device tree blob\n",
			    val);
		}
	} while (val != FDT_END_NODE);

	if (node->name != flatname) {
		free(flatname);
	}

	return node;
}

struct dt_info *dt_from_blob(struct fdt_header *fdt_arg)
{
	uint32_t magic, totalsize, version, size_dt, boot_cpuid_phys;
	uint32_t off_dt, off_str, off_mem_rsvmap;
	char *blob;
	struct fdt_header *fdt;
	struct inbuf dtbuf, strbuf;
	struct inbuf memresvbuf;
	struct reserve_info *reservelist;
	struct node *tree;
	uint32_t val;
	int flags = 0;

        /* verify passed fdt ptr */
	if (fdt_arg == NULL) {
                die("Error: NULL fdt.");
        }

	fdt = fdt_arg; /* formal dtb struct for quick field reference */
	blob = (char *)fdt_arg; /* char ptr for convenient ptr operations */
        magic = fdt_magic(fdt);

        /* check dtb magic code */
        if (magic != FDT_MAGIC) {
		die("Error: Invalid DTB, bad magic.");
		
        }

        totalsize = fdt_totalsize(fdt);
	off_dt = fdt_off_dt_struct(fdt);
	off_str = fdt_off_dt_strings(fdt);
	off_mem_rsvmap = fdt_off_mem_rsvmap(fdt);
	version = fdt_version(fdt);
	boot_cpuid_phys = fdt_boot_cpuid_phys(fdt);

	/* check fdt_struct fields */
	if (off_mem_rsvmap >= totalsize) {
		die("Mem Reserve structure offset exceeds total size\n");		
	}

	if (off_dt >= totalsize) {
		die("DT structure offset exceeds total size\n");		
	}

	if (off_str > totalsize) {
		die("String table offset exceeds total size\n");		
	}

	if (version >= 3) {
		uint32_t size_str = fdt_size_dt_strings(fdt);
		if ((off_str+size_str < off_str) || (off_str+size_str > totalsize)) {
			die("String table extends past total size\n");
			
		}
		inbuf_init(&strbuf, blob + off_str, blob + off_str + size_str);
	} else {
		die("DTB version too old.");		
	}

	if (version >= 17) {
		size_dt = fdt_size_dt_struct(fdt);
		if ((off_dt+size_dt < off_dt) || (off_dt+size_dt > totalsize)) {
			die("Structure block extends past total size\n");			
		}
	} else {
		die("current fdt version: %d, \
		    LDR requires: fdt version >= 17", version);
	}

	inbuf_init(&memresvbuf, blob + off_mem_rsvmap, blob + totalsize);
	inbuf_init(&dtbuf, blob + off_dt, blob + totalsize);

	reservelist = flat_read_mem_reserve(&memresvbuf);

	val = flat_read_word(&dtbuf);

	/* check the very beginning node */
	if (val != FDT_BEGIN_NODE) {
		die("Device tree blob doesn't begin with FDT_BEGIN_NODE\
			 (begins with 0x%08x)\n", val);		
	}

	tree = unflatten_tree(&dtbuf, &strbuf, "", flags);

	/* check the ending node */
	val = flat_read_word(&dtbuf);
	if (val != FDT_END) {
		die("Device tree blob doesn't end with FDT_END\n");		
	}

	return build_dt_info(DTSF_V1, reservelist, tree, boot_cpuid_phys);
}