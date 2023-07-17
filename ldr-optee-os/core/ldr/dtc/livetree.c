/* SPDX-License-Identifier: GPL-2.0-or-later */
/**
 * (C) Copyright David Gibson <dwg@au1.ibm.com>, IBM Corporation.  2005.
 * 
*/

#include "dtc.h"
#include "dtc_util.h"

struct property *build_property(char *name, struct data *val)
{
	struct property *new = xmalloc(sizeof(*new));

	memset(new, 0, sizeof(*new));

	new->name = name;
	new->val = *val;
	new->srcpos = NULL;

	return new;
}

void add_property(struct node *node, struct property *prop)
{
	struct property **p;

	prop->next = NULL;

	p = &node->proplist;
	while (*p)
		p = &((*p)->next);

	*p = prop;
}

void add_child(struct node *parent, struct node *child)
{
	struct node **p;

	child->next_sibling = NULL;
	child->parent = parent;

	p = &parent->children;
	while (*p)
		p = &((*p)->next_sibling);

	*p = child;
}

struct property *reverse_properties(struct property *first)
{
	struct property *p = first;
	struct property *head = NULL;
	struct property *next;

	while (p) {
		next = p->next;
		p->next = head;
		head = p;
		p = next;
	}
	return head;
}

struct node *build_node(struct property *proplist, struct node *children)
{
	struct node *new = xmalloc(sizeof(*new));
	struct node *child;

	memset(new, 0, sizeof(*new));

	new->proplist = reverse_properties(proplist);
	new->children = children;
	new->srcpos = NULL;

	for_each_child(new, child) {
		child->parent = new;
	}

	return new;
}

struct reserve_info *build_reserve_entry(uint64_t address, uint64_t size)
{
	struct reserve_info *new = xmalloc(sizeof(*new));

	memset(new, 0, sizeof(*new));

	new->address = address;
	new->size = size;

	return new;
}

struct reserve_info *add_reserve_entry(struct reserve_info *list,
				      struct reserve_info *new)
{
	struct reserve_info *last;

	new->next = NULL;

	if (! list)
		return new;

	for (last = list; last->next; last = last->next)
		;

	last->next = new;

	return list;
}

struct dt_info *build_dt_info(unsigned int dtsflags,
			      struct reserve_info *reservelist,
			      struct node *tree, uint32_t boot_cpuid_phys)
{
	struct dt_info *dti;

	dti = xmalloc(sizeof(*dti));
	dti->dtsflags = dtsflags;
	dti->reservelist = reservelist;
	dti->dt = tree;
	dti->boot_cpuid_phys = boot_cpuid_phys;

	return dti;
}