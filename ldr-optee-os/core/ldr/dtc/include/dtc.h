/* SPDX-License-Identifier: GPL-2.0-or-later */
/**
 * (C) Copyright David Gibson <dwg@au1.ibm.com>, IBM Corporation.  2005. 
 * 
*/

#ifndef DTC_H
#define DTC_H

#include <ctype.h>
#include <libfdt_env.h>		/* have to be included before <fdt.h> */
#include <fdt.h>
#include <inttypes.h>
#include <utee_defines.h>

#define DEFAULT_FDT_VERSION	17

#define PHANDLE_LEGACY	0x1
#define PHANDLE_EPAPR	0x2
#define PHANDLE_BOTH	0x3

typedef uint32_t cell_t;

static inline bool phandle_is_valid(cell_t phandle)
{
	return phandle != 0 && phandle != ~0U;
}

static inline uint16_t dtb_ld16(const void *p)
{
	const uint8_t *bp = (const uint8_t *)p;

	return ((uint16_t)bp[0] << 8)
		| bp[1];
}

static inline uint32_t dtb_ld32(const void *p)
{
	const uint8_t *bp = (const uint8_t *)p;

	return ((uint32_t)bp[0] << 24)
		| ((uint32_t)bp[1] << 16)
		| ((uint32_t)bp[2] << 8)
		| bp[3];
}

static inline uint64_t dtb_ld64(const void *p)
{
	const uint8_t *bp = (const uint8_t *)p;

	return ((uint64_t)bp[0] << 56)
		| ((uint64_t)bp[1] << 48)
		| ((uint64_t)bp[2] << 40)
		| ((uint64_t)bp[3] << 32)
		| ((uint64_t)bp[4] << 24)
		| ((uint64_t)bp[5] << 16)
		| ((uint64_t)bp[6] << 8)
		| bp[7];
}

#define streq(a, b)	(strcmp((a), (b)) == 0)
#define strprefixeq(a, n, b)	(strlen(b) == (n) && (memcmp(a, b, n) == 0))
static inline bool strends(const char *str, const char *suffix)
{
	unsigned int len, suffix_len;

	len = strlen(str);
	suffix_len = strlen(suffix);
	if (len < suffix_len)
		return false;
	return streq(str + len - suffix_len, suffix);
}

#define ALIGN(x, a)	(((x) + (a) - 1) & ~((a) - 1))

/* Data blobs */
enum markertype {
	TYPE_NONE,
	REF_PHANDLE,
	REF_PATH,
	LABEL,
	TYPE_UINT8,
	TYPE_UINT16,
	TYPE_UINT32,
	TYPE_UINT64,
	TYPE_STRING,
};

static inline bool is_type_marker(enum markertype type)
{
	return type >= TYPE_UINT8;
}

extern const char *markername(enum markertype markertype);

struct  marker {
	enum markertype type;
	unsigned int offset;
	char *ref;
	struct marker *next;
};

struct data {
	unsigned int len;
	unsigned char *val;
	struct marker *markers;
};

#define for_each_marker(m) \
	for (; (m); (m) = (m)->next)
#define for_each_marker_of_type(m, t) \
	for_each_marker(m) \
		if ((m)->type == (t))

static inline struct marker *next_type_marker(struct marker *m)
{
	for_each_marker(m)
		if (is_type_marker(m->type))
			break;
	return m;
}

static inline size_t type_marker_length(struct marker *m)
{
	struct marker *next = next_type_marker(m->next);

	if (next)
		return next->offset - m->offset;
	return 0;
}

struct data *data_grow_for(struct data *d, unsigned int xlen);

/* DT constraints */

#define MAX_PROPNAME_LEN	31
#define MAX_NODENAME_LEN	31

/* Live trees */
struct label {
	bool deleted;
	char *label;
	struct label *next;
};

struct bus_type {
	const char *name;
};

struct property {
	bool deleted;
	char *name;
	struct data val;

	struct property *next;

	struct label *labels;
	struct srcpos *srcpos;
};

struct node {
	bool deleted;
	char *name;
	struct property *proplist;
	struct node *children;

	struct node *parent;
	struct node *next_sibling;

	char *fullpath;
	int basenamelen;

	cell_t phandle;
	int addr_cells, size_cells;

	struct label *labels;
	const struct bus_type *bus;
	struct srcpos *srcpos;

	bool omit_if_unused, is_referenced;
};

#define for_each_label_withdel(l0, l) \
	for ((l) = (l0); (l); (l) = (l)->next)

#define for_each_label(l0, l) \
	for_each_label_withdel(l0, l) \
		if (!(l)->deleted)

#define for_each_property_withdel(n, p) \
	for ((p) = (n)->proplist; (p); (p) = (p)->next)

#define for_each_property(n, p) \
	for_each_property_withdel(n, p) \
		if (!(p)->deleted)

#define for_each_child_withdel(n, c) \
	for ((c) = (n)->children; (c); (c) = (c)->next_sibling)

#define for_each_child(n, c) \
	for_each_child_withdel(n, c) \
		if (!(c)->deleted)

struct property *build_property(char *name, struct data *val);
struct property *reverse_properties(struct property *first);

struct node *build_node(struct property *proplist, struct node *children);

void add_property(struct node *node, struct property *prop);
void add_child(struct node *parent, struct node *child);

/* Boot info (tree plus memreserve information */

struct reserve_info {
	uint64_t address, size;

	struct reserve_info *next;

	struct label *labels;
};

struct reserve_info *build_reserve_entry(uint64_t start, uint64_t len);
struct reserve_info *add_reserve_entry(struct reserve_info *list,
				       struct reserve_info *new);

struct dt_info {
	unsigned int dtsflags;
	struct reserve_info *reservelist;
	uint32_t boot_cpuid_phys;
	struct node *dt;	/* the device tree */
	const char *outname;	/* filename being written to, "-" for stdout */
};

/* DTS version flags definitions */
#define DTSF_V1		0x0001	/* /dts-v1/ */
#define DTSF_PLUGIN	0x0002	/* /plugin/ */

struct dt_info *build_dt_info(unsigned int dtsflags,
			      struct reserve_info *reservelist,
			      struct node *tree, uint32_t boot_cpuid_phys);

struct dt_info *dt_from_blob(struct fdt_header *fdt_arg);

/* Tree source */

void dt_to_source(struct dt_info *dti);

#endif /* DTC_H */