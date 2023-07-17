/* SPDX-License-Identifier: BSD-2-Clause */
/**
 * core list header file: generic OPTEE core list.
 * 
 * 
*/

#ifndef CLIST_H
#define CLIST_H

#include <inttypes.h>
#include <kernel/refcount.h>
#include <stdbool.h>
#include <sys/queue.h>
#include <utee_defines.h>
#include <util.h>

struct clist_node {
	void			*n_clist; /* never access directly */
	TAILQ_ENTRY(clist_node)	n_entry;
	struct refcount		n_ref;
};

inline bool is_clist_node_attached(struct clist_node *node) {
	return (node->n_clist != NULL);
}

TAILQ_HEAD(clist_head, clist_node);

struct clist {
	unsigned int 		l_spinlock;
	struct clist_head	l_head;
	void			(*get)(struct clist_node *);
	void			(*put)(struct clist_node *);
};

inline bool is_clist_empty(struct clist *clist) {
	return TAILQ_EMPTY(&clist->l_head);
}

inline struct clist_node *clist_head(struct clist *clist) {
	return TAILQ_FIRST(&clist->l_head);
}

void clist_init(struct clist *clist,
		void (*get)(struct clist_node *),
		void (*put)(struct clist_node *));

void clist_add_tail(struct clist_node *node, struct clist *clist);
void clist_add_head(struct clist_node *node, struct clist *clist);
void clist_add_after(struct clist_node *node, struct clist_node *pos);
void clist_add_before(struct clist_node *node, struct clist_node *pos);

void clist_put(struct clist_node *node);

struct clist_iter {
	struct clist		*i_clist;
	struct clist_node	*i_cur;
};

void clist_iter_init(struct clist *clist, struct clist_iter *i);
void clist_iter_init_node(struct clist *clist, struct clist_iter *i,
			  struct clist_node *node);
void clist_iter_exit(struct clist_iter *i);

struct clist_node *clist_prev(struct clist_iter *i);
struct clist_node *clist_next(struct clist_iter *i);

#endif /* CLIST_H */