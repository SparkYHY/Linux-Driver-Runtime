/* SPDX-License-Identifier: BSD-2-Clause */
/**
 * This source files implements synchronous core list.
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

static struct clist *cnode_clist(struct clist_node *node) {
	return node->n_clist;
}

static void cnode_set_clist(struct clist_node *node, struct clist *clist) {
	node->n_clist = clist;
}

void clist_init(struct clist *clist,
		void (*get)(struct clist_node *),
		void (*put)(struct clist_node *)) {
	/* initialize clist head */
	clist->l_head.tqh_first = NULL;
	clist->l_head.tqh_last = &(clist->l_head).tqh_first;

	clist->get = get;
	clist->put = put;
}

static void clist_node_init(struct clist *clist, struct clist_node *node) {
	refcount_set(&node->n_ref, 1); /* self reference */
	cnode_set_clist(node, clist);
	if (clist->get)
		clist->get(node);
}

void clist_add_tail(struct clist_node *node, struct clist *clist) {
	clist_node_init(clist, node);

	cpu_spin_lock(&clist->l_spinlock);
	TAILQ_INSERT_TAIL(&clist->l_head, node, n_entry);
	cpu_spin_unlock(&clist->l_spinlock);
}

void clist_add_head(struct clist_node *node, struct clist *clist) {
	clist_node_init(clist, node);

	cpu_spin_lock(&clist->l_spinlock);
	TAILQ_INSERT_HEAD(&clist->l_head, node, n_entry);
	cpu_spin_unlock(&clist->l_spinlock);
}

void clist_add_after(struct clist_node *node, struct clist_node *pos) {
	struct clist *clist = cnode_clist(pos);

	clist_node_init(clist, node);
	cpu_spin_lock(&clist->l_spinlock);
	TAILQ_INSERT_AFTER(&clist->l_head, pos, node, n_entry);
	cpu_spin_unlock(&clist->l_spinlock);
}

void clist_add_before(struct clist_node *node, struct clist_node *pos) {
	struct clist *clist = cnode_clist(pos);

	clist_node_init(clist, node);
	cpu_spin_lock(&clist->l_spinlock);
	TAILQ_INSERT_BEFORE(pos, node, n_entry);
	cpu_spin_unlock(&clist->l_spinlock);
}

static void clist_put_internal(struct clist_node *node) {
	struct clist *clist = cnode_clist(node);

	cpu_spin_lock(&clist->l_spinlock);

	/* delete the node from clist if refcount reaches 0 */
	if (refcount_val(&node->n_ref) == 0
	    || refcount_dec(&node->n_ref) == true) {
		TAILQ_REMOVE(&clist->l_head, node, n_entry);
		cnode_set_clist(node, NULL);
	}

	cpu_spin_unlock(&clist->l_spinlock);

	if (clist->put)
		clist->put(node);
}

void clist_put(struct clist_node *node) {
	clist_put_internal(node);
}

void clist_iter_init_node(struct clist *clist, struct clist_iter *i,
			  struct clist_node *node) {
	i->i_clist = clist;
	i->i_cur = NULL;
	if (node && refcount_val(&node->n_ref) != 0) {
		refcount_inc(&node->n_ref);
		i->i_cur = node;
	}
}

void clist_iter_init(struct clist *clist, struct clist_iter *i) {
	clist_iter_init_node(clist, i, NULL);
}

void clist_iter_exit(struct clist_iter *i) {
	if (i->i_cur) {
		clist_put_internal(i->i_cur);
		i->i_cur = NULL;
	}
}

struct clist_node *clist_prev(struct clist_iter *i) {
	struct clist_node *last = i->i_cur;
	struct clist_node *prev;

	cpu_spin_lock(&i->i_clist->l_spinlock);
	if (last) {
		prev = TAILQ_PREV(last, clist_head, n_entry);
		refcount_dec(&last->n_ref);
	} else { /* last elem */
		prev = TAILQ_LAST(&i->i_clist->l_head, clist_head);
	}

	/* empty clist or no further node*/
	if (prev == NULL) {
		goto out;
	}

	refcount_inc(&prev->n_ref);

out:
	i->i_cur = prev;
	cpu_spin_unlock(&i->i_clist->l_spinlock);

	if (last && i->i_clist->put)
		i->i_clist->put(last);
	return i->i_cur;
}

struct clist_node *clist_next(struct clist_iter *i) {
	struct clist_node *last = i->i_cur;
	struct clist_node *next;

	cpu_spin_lock(&i->i_clist->l_spinlock);
	if (last) {
		next = TAILQ_NEXT(last, n_entry);
		refcount_dec(&last->n_ref);
	} else { /* first elem */
		next = TAILQ_FIRST(&i->i_clist->l_head);
	}

	/* empty clist or no further node*/
	if (next == NULL) {
		goto out;
	}

	refcount_inc(&next->n_ref);

out:
	i->i_cur = next;
	cpu_spin_unlock(&i->i_clist->l_spinlock);

	if (last && i->i_clist->put)
		i->i_clist->put(last);
	return i->i_cur;
}