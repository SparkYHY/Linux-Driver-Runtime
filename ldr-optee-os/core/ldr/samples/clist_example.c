/* SPDX-License-Identifier: BSD-2-Clause */
/**
 * core list example and test source file
 * 
 * 
*/

#include <initcall.h>
#include <inttypes.h>
#include <kernel/panic.h>
#include <kernel/spinlock.h>
#include <ldr/clist.h>
#include <malloc.h>
#include <printk.h>
#include <stdarg.h>
#include <stdio.h>
#include <string.h>
#include <tee_api_types.h>
#include <trace.h>
#include <utee_defines.h>
#include <util.h>

/**
 * Note that clist and clist_node are meant to be aggregated into some 
 * meaningful struct. These structs themselves are for list structure 
 * maintainance, therefore, without any semantics.
 */
struct clist_example {
	unsigned int spin_lock; /* need our own lock, not the one 
				 * belonging to the embedding clist */
	char *name;
	struct clist clist;
	void (*print)(struct clist *clist);
};

struct cnode_example {
	int id;
	struct clist_node node;
	int get_count;
	int put_count;
};

static void example_get(struct clist_node* n) {
	struct cnode_example *node =
		container_of(n, struct cnode_example, node);

	node->get_count++;
}

static void example_put(struct clist_node* n) {
	struct cnode_example *node =
		container_of(n, struct cnode_example, node);

	node->put_count++;
}

/* print out info of all clist nodes */
static void example_clist_print(struct clist *clist) {
	struct clist_example *clist_example = 
		container_of(clist, struct clist_example, clist);
	struct cnode_example *n;
	struct clist_node *node;
	struct clist_iter i;
	const char *name;

	if (clist_example->name)
		name = clist_example->name;
	else
		name = "<null>";

	cpu_spin_lock(&clist_example->spin_lock);
	if (is_clist_empty(&clist_example->clist)) {
		cpu_spin_unlock(&clist_example->spin_lock);
		IMSG("clist: %s: empty list.", name);
		IMSG("\n");
		return;
	}

	clist_iter_init(clist, &i);
	IMSG("clist: %s", name);

	node = clist_next(&i);
	while (node) {
		n = container_of(i.i_cur, struct cnode_example, node);
		IMSG("%s: node %d, get#: %d, put#: %d",
		      "example node", n->id, n->get_count, n->put_count);
		node = clist_next(&i);
	}

	IMSG("\n");
	cpu_spin_unlock(&clist_example->spin_lock);
	clist_iter_exit(&i);
}

struct clist_example clist_example;

struct cnode_example foo;
struct cnode_example bar;
struct cnode_example baz;
struct cnode_example quk;
struct cnode_example zoo;

static int id = 0;

static void example_clist_init(struct clist_example *list,
			       const char *name) {
	/* NULL name ptr is legal */
	if (name == NULL)
		list->name = NULL;
	else {
		list->name = malloc(strlen(name));
		if (list->name == NULL)
			panic();
		
		strcpy(list->name, name);
	}
	list->print = example_clist_print;

	clist_init(&list->clist, example_get, example_put);
}

static void example_cnode_init(struct cnode_example *node) {
	node->id = id++;
}

static TEE_Result clist_example_init(void) {
	example_clist_init(&clist_example, "example clist");

	example_cnode_init(&foo);
	example_cnode_init(&bar);
	example_cnode_init(&baz);
	example_cnode_init(&quk);
	example_cnode_init(&zoo);

	clist_example.print(&clist_example.clist);

	clist_add_head(&foo.node, &clist_example.clist);

	clist_example.print(&clist_example.clist);

	clist_add_head(&bar.node, &clist_example.clist);

	clist_example.print(&clist_example.clist);

	clist_add_tail(&baz.node, &clist_example.clist);

	clist_example.print(&clist_example.clist);

	clist_add_before(&quk.node, &baz.node);

	clist_example.print(&clist_example.clist);

	clist_add_after(&zoo.node, &quk.node);

	clist_example.print(&clist_example.clist);

	return TEE_SUCCESS;
}
/* success, uncomment to enable test */
// ldr_init_late(clist_example_init);