/* SPDX-License-Identifier: BSD-2-Clause */
/**
 * core object header file: generic OPTEE core object infrastructure.
 * 
 * 
*/

#ifndef COBJECT_H
#define COBJECT_H

#include <inttypes.h>
#include <kernel/refcount.h>
#include <stdbool.h>
#include <sys/queue.h>
#include <utee_defines.h>
#include <util.h>

#define COBJ_NAME_LEN_MAX	20

struct cobject {
	const char		*name;
	TAILQ_ENTRY(cobject)	entry;
	struct cobject		*parent;
	struct cset		*cset;
	struct cobj_type	*ctype;
	struct refcount		cref;

	bool state_initialized;
};

struct cobj_type {
	void (*release)(struct cobject *cobj);
	void (*print)(struct cobject *cobj);
};

/* All these functions will panic() if something is wrong. */
struct cset *get_sanc(void);
void cobject_init(struct cobject *cobj, struct cobj_type *ctype);
int cobject_set_name(struct cobject *cobj, const char *fmt, ...);
int cobject_add(struct cobject *cobj, struct cobject *parent,
		const char *fmt, ...);
int cobject_init_and_add(struct cobject *cobj, struct cobj_type *ctype,
			 struct cobject *parent, const char *fmt, ...);
struct cobject *cobject_get(struct cobject *cobj);
void cobject_put(struct cobject *cobj);
struct cobject *cobject_create(void);
struct cobject *cobject_create_and_add(const char *name,
				       struct cobject *parent);

static inline const char *cobject_name(const struct cobject *cobj) {
	return cobj->name;
}

TAILQ_HEAD(cobj_list_head, cobject);

struct cset {
	struct cobj_list_head 	cobj_list_head;
	unsigned int 		spin_lock;
	struct cobject 		cobj;
};

static inline struct cset *to_cset(struct cobject *cobj) {
	return cobj ? container_of(cobj, struct cset, cobj) : NULL;
}

static inline struct cset *cset_get(struct cset *cset) {
	return cset ? to_cset(cobject_get(&cset->cobj)) : NULL;
}

static inline void cset_put(struct cset *cset) {
	cobject_put(&cset->cobj);
}

void cset_init(struct cset *cset);
void cobject_unlink(struct cobject *cobj);
int cset_register(struct cset *cset);
void cset_unregister(struct cset *cset);
struct cobject *cset_find_obj(struct cset *cset, const char *cobj_name);
struct cset *cset_create_and_register(const char *name,
				      struct cobject *parent);

#endif /* COBJECT_H */