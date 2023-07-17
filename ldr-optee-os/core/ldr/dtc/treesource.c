/* SPDX-License-Identifier: GPL-2.0-or-later */
/**
 * (C) Copyright David Gibson <dwg@au1.ibm.com>, IBM Corporation.  2005.
 * 
*/

#include <assert.h>
#include <string.h>
#include <trace.h>

#include "dtc.h"

struct dt_info *parser_output;
bool treesource_error;

static void write_prefix(int level)
{
	int i;

	for (i = 0; i < level; i++)
		printk((const char *)"\t");
}

static bool isstring(char c)
{
	return (isprint((unsigned char)c)
		|| (c == '\0')
		|| strchr("\a\b\t\n\v\f\r", c));
}

static void write_propval_string(const char *s, size_t len)
{
	const char *end = s + len - 1;

	if (!len)
		return;

	assert(*end == '\0');

	printk("\"");
	while (s < end) {
		char c = *s++;
		switch (c) {
		case '\a':
			printk("\\a");
			break;
		case '\b':
			printk("\\b");
			break;
		case '\t':
			printk("\\t");
			break;
		case '\n':
			printk("\\n");
			break;
		case '\v':
			printk("\\v");
			break;
		case '\f':
			printk("\\f");
			break;
		case '\r':
			printk("\\r");
			break;
		case '\\':
			printk("\\\\");
			break;
		case '\"':
			printk("\\\"");
			break;
		case '\0':
			printk("\\0");
			break;
		default:
			if (isprint((unsigned char)c))
				printk("%c", c);
			else
				printk("\\x%02"PRIx8, c);
		}
	}
	printk("\"");
}

static void write_propval_int(const char *p, size_t len, size_t width)
{
	const char *end = p + len;
	assert(len % width == 0);

	for (; p < end; p += width) {
		switch (width) {
		case 1:
			printk("%02"PRIx8, *(const uint8_t*)p);
			break;
		case 2:
			printk("0x%02"PRIx16, dtb_ld16(p));
			break;
		case 4:
			printk("0x%02"PRIx32, dtb_ld32(p));
			break;
		case 8:
			printk("0x%02"PRIx64, dtb_ld64(p));
			break;
		}
		if (p + width < end)
			printk((const char *)" ");
	}
}

static const char *delim_start[] = {
	[TYPE_UINT8] = "[",
	[TYPE_UINT16] = "/bits/ 16 <",
	[TYPE_UINT32] = "<",
	[TYPE_UINT64] = "/bits/ 64 <",
	[TYPE_STRING] = "",
};
static const char *delim_end[] = {
	[TYPE_UINT8] = "]",
	[TYPE_UINT16] = ">",
	[TYPE_UINT32] = ">",
	[TYPE_UINT64] = ">",
	[TYPE_STRING] = "",
};

static enum markertype guess_value_type(struct property *prop)
{
	int len = prop->val.len;
	const char *p = prop->val.val;
	struct marker *m = prop->val.markers;
	int nnotstring = 0, nnul = 0;
	int nnotstringlbl = 0, nnotcelllbl = 0;
	int i;

	for (i = 0; i < len; i++) {
		if (! isstring(p[i]))
			nnotstring++;
		if (p[i] == '\0')
			nnul++;
	}

	for_each_marker_of_type(m, LABEL) {
		if ((m->offset > 0) && (prop->val.val[m->offset - 1] != '\0'))
			nnotstringlbl++;
		if ((m->offset % sizeof(cell_t)) != 0)
			nnotcelllbl++;
	}

	if ((p[len-1] == '\0') && (nnotstring == 0) && (nnul <= (len-nnul))
	    && (nnotstringlbl == 0)) {
		return TYPE_STRING;
	} else if (((len % sizeof(cell_t)) == 0) && (nnotcelllbl == 0)) {
		return TYPE_UINT32;
	}

	return TYPE_UINT8;
}

static void write_propval(struct property *prop)
{
	size_t len = prop->val.len;
	struct marker *m = prop->val.markers;
	struct marker dummy_marker;
	enum markertype emit_type = TYPE_NONE;

	if (len == 0) {
		printk(";");
		printk("\n");
		return;
	}

	printk(" =");

	if (!next_type_marker(m)) {
		/* data type information missing, need to guess */
		dummy_marker.type = guess_value_type(prop);
		dummy_marker.next = prop->val.markers;
		dummy_marker.offset = 0;
		dummy_marker.ref = NULL;
		m = &dummy_marker;
	}

	for_each_marker(m) {
		size_t chunk_len = (m->next ? m->next->offset : len) - m->offset;
		size_t data_len = type_marker_length(m) ? : len - m->offset;
		const char *p = &prop->val.val[m->offset];
		struct marker *m_phandle;

		if (is_type_marker(m->type)) {
			emit_type = m->type;
			printk(" %s", delim_start[emit_type]);
		} else if (m->type == LABEL)
			printk(" %s:", m->ref);

		if (emit_type == TYPE_NONE || chunk_len == 0)
			continue;

		switch(emit_type) {
		case TYPE_UINT16:
			write_propval_int(p, chunk_len, 2);
			break;
		case TYPE_UINT32:
			m_phandle = prop->val.markers;
			for_each_marker_of_type(m_phandle, REF_PHANDLE)
				if (m->offset == m_phandle->offset)
					break;

			if (m_phandle) {
				if (m_phandle->ref[0] == '/')
					printk("&{%s}", m_phandle->ref);
				else
					printk("&%s", m_phandle->ref);
				if (chunk_len > 4) {
					printk((const char *)" ");
					write_propval_int(p + 4, chunk_len - 4, 4);
				}
			} else {
				write_propval_int(p, chunk_len, 4);
			}
			break;
		case TYPE_UINT64:
			write_propval_int(p, chunk_len, 8);
			break;
		case TYPE_STRING:
			write_propval_string(p, chunk_len);
			break;
		default:
			write_propval_int(p, chunk_len, 1);
		}

		if (chunk_len == data_len) {
			size_t pos = m->offset + chunk_len;
			printk(pos == len ? "%s" : "%s,",
			        delim_end[emit_type] ? : "");
			emit_type = TYPE_NONE;
		}
	}
	printk(";");
	printk("\n");
}

static void write_tree_source_node(struct node *tree, int level)
{
	struct property *prop;
	struct node *child;
	struct label *l;

	write_prefix(level);
	for_each_label(tree->labels, l)
		printk("%s: ", l->label);
	if (tree->name && (*tree->name))
		printk("%s {", tree->name);
	else
		printk("/ {");

	printk("\n");

	for_each_property(tree, prop) {
		write_prefix(level+1);
		for_each_label(prop->labels, l)
			printk("%s: ", l->label);
		printk("%s", prop->name);
		write_propval(prop);
	}
	for_each_child(tree, child) {
		printk("\n");
		write_tree_source_node(child, level+1);
	}
	write_prefix(level);
	printk("};");

	printk("\n");
}

void dt_to_source(struct dt_info *dti)
{
	struct reserve_info *re;

	printk("/dts-v1/;\n\n");

	for (re = dti->reservelist; re; re = re->next) {
		struct label *l;

		for_each_label(re->labels, l)
			printk("%s: ", l->label);
		printk("/memreserve/\t0x%016llx 0x%016llx;\n",
			(unsigned long long)re->address,
			(unsigned long long)re->size);
	}

	write_tree_source_node(dti->dt, 0);
}
