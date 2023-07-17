/* SPDX-License-Identifier: BSD-2-Clause */
/**
 * 
*/

#include <initcall.h>
#include <inttypes.h>
#include <kernel/panic.h>
#include <kernel/spinlock.h>
#include <ldr/cobject.h>
#include <malloc.h>
#include <printk.h>
#include <stdarg.h>
#include <stdio.h>
#include <string.h>
#include <tee_api_types.h>
#include <trace.h>
#include <utee_defines.h>
#include <util.h>

/* top-level core set */
static struct cset sanctuary = {};

struct cset *get_sanc(void) {
	return &sanctuary;
}

static void cobj_cset_join(struct cobject *cobj) {
	if (cobj->cset == NULL)
		return;

	cset_get(cobj->cset);
	cpu_spin_lock(&cobj->cset->spin_lock);
	TAILQ_INSERT_TAIL(&cobj->cset->cobj_list_head, cobj, entry);
	cpu_spin_unlock(&cobj->cset->spin_lock);
}

static void cobj_cset_leave(struct cobject *cobj) {
	if (cobj->cset == NULL)
		return;

	cpu_spin_lock(&cobj->cset->spin_lock);
	TAILQ_REMOVE(&cobj->cset->cobj_list_head, cobj, entry);
	cpu_spin_unlock(&cobj->cset->spin_lock);
	cset_put(cobj->cset);
}

static inline void cobject_init_internal(struct cobject *cobj) {
	refcount_set(&cobj->cref, 1); /* self reference */
	cobj->state_initialized = true;
}

void cobject_init(struct cobject *cobj, struct cobj_type *ctype) {
	const char *err_str;

	if (cobj == NULL) {
		err_str = "invalid cobject ptr!";
		goto error;
	}

	if (ctype == NULL) {
		err_str = "invalid ctype ptr!";
		goto error;
	}

	if (cobj->state_initialized) {
		err_str = "cobject already initialized!";
		goto error;
	}

	/* initialize cobject */
	cobj->ctype = ctype;
	cobject_init_internal(cobj);

	return;

error:
	EMSG("core object (%p): %s", cobj, err_str);
	panic();
}

static int cobject_set_name_vargs(struct cobject *cobj, const char *fmt,
				  va_list vargs) {
	char *buf;
	size_t boffs = 0;
	int res;

	/* to make the str buffer persistent, allocate it on the heap */
	buf = malloc(COBJ_NAME_LEN_MAX);
	if (buf == NULL) 
		return TEE_ERROR_OUT_OF_MEMORY;

	res = vsnprintk(buf, COBJ_NAME_LEN_MAX, fmt, vargs);
	if (res > 0)
		boffs += res;
	else
		return TEE_ERROR_SHORT_BUFFER;
	
	if (boffs >= (COBJ_NAME_LEN_MAX - 1))
		boffs = COBJ_NAME_LEN_MAX - 2;
	buf[boffs + 1] = '\0';

	/* set cobj->name using the prepared buffer */
	cobj->name = buf;

	return TEE_SUCCESS;
}

int cobject_set_name(struct cobject *cobj, const char *fmt, ...)
{
	va_list vargs;
	int retval;

	va_start(vargs, fmt);
	retval = cobject_set_name_vargs(cobj, fmt, vargs);
	va_end(vargs);

	return retval;
}

/**
 * cobject_add_internal - main function to construct cobject hierarchy
 * @cobj:	the cobject to add
*/
static int cobject_add_internal(struct cobject *cobj) {
	struct cobject *parent;

	if (cobj == NULL) {
		return TEE_ERROR_BAD_PARAMETERS;
	}

	if (cobject_name(cobj) == NULL || cobj->name[0] == '\0') {
		EMSG("core object: (%p): attempted to be registered with empty"
		     " name!", cobj);
		return TEE_ERROR_BAD_PARAMETERS;
	}

	/* get parent first if set */
	parent = cobject_get(cobj->parent);

	/* join cset if set */
	if (cobj->cset) {
		/* use cset as parent if there are none */
		if (cobj->parent == NULL)
			parent = cobject_get(&cobj->cset->cobj);
	} else { /* santuary will take this orphan */
		if (sanctuary.cobj.state_initialized != true) {
			EMSG("cobject: top-level cset not initialized!");
			panic();
		}
		
		if (cobj->parent == NULL)
			parent = cobject_get(&sanctuary.cobj);
		cobj->cset = &sanctuary;
	}

	cobj_cset_join(cobj);
	cobj->parent = parent;

	return TEE_SUCCESS;
}

static int cobject_add_vargs(struct cobject *cobj, struct cobject *parent,
			     const char *fmt, va_list vargs) {
	int retval;

	retval = cobject_set_name_vargs(cobj, fmt, vargs);
	if (retval != TEE_SUCCESS) {
		EMSG("cobject: can not set name properly!");
		return retval;
	}

	cobj->parent = parent;
	return cobject_add_internal(cobj);
}

/**
 * cobject_add - add a cobject into the cobject hierarchy
 * @cobj: 	the cobject to add
 * @parent: 	pointer to the parent of the cobject.
 * @fmt: 	format to name the cobject with.
 *
 * To add a cobject into the cobject hierarchy, take this metaphor:
 *   A cobj is borned (cobject_init) with its parent and family known in
 *   advance. If everything goes well, it will have parent and family.
 *   If parent is gone, the big family will take it. If the big family
 *   is gone, the tribe santuary will take it (cobject_add_internal).
 *   The principle here is a cobj has the right to live even though either
 *   the parent or the family is unknown (NULL parent or cset is legal).
 *   Before the cobj is taken by parent or family or tribe, it is given
 *   a proper name (cobject_set_name).
 *
 * If @parent is set, then the parent of the @cobj will be set to it.
 * If @parent is NULL, then the parent of the @cobj will be set to the
 * cobject associated with the kset assigned to this cobject.  If no kset
 * is assigned to the cobject, then the cobject will be located in the
 * santuary cset.
 */
int cobject_add(struct cobject *cobj, struct cobject *parent,
		const char *fmt, ...) {
	va_list args;
	int retval;

	if (cobj == NULL || cobj->state_initialized != true)
		return TEE_ERROR_BAD_PARAMETERS;

	va_start(args, fmt);
	retval = cobject_add_vargs(cobj, parent, fmt, args);
	va_end(args);

	return retval;
}

int cobject_init_and_add(struct cobject *cobj, struct cobj_type *ctype,
			 struct cobject *parent, const char *fmt, ...) {
	va_list args;
	int retval;

	cobject_init(cobj, ctype);

	va_start(args, fmt);
	retval = cobject_add_vargs(cobj, parent, fmt, args);
	va_end(args);

	return retval;
}

struct cobject *cobject_get(struct cobject *cobj) {
	const char *err_str;

	if (cobj) { /* a null cobj is legal */
		if (!cobj->state_initialized) {
			err_str = "cobject uninitialized!";
			goto error;
		}

		/* increment ref count */
		if (!refcount_inc(&cobj->cref)) {
			err_str = "cobject cref less than 0 or overflow!";
			goto error;
		}
	}

	return cobj;

error:
	EMSG("core object (%p): %s", cobj, err_str);
	panic();
}

static void cobject_cleanup(struct cobject *cobj) {
	struct cobj_type *t = cobj->ctype;
	const char *name = cobj->name;

	DMSG("cobject: '%-20s' (%p): %s, parent %p",
	     name, cobj, __func__, cobj->parent);

	if (t && !t->release) {
		DMSG("cobject: '%-20s' (%p): does not have a release() "
		    "function, it is broken and must be fixed",
		    name, cobj);
	}

	if (t && t->release) {
		DMSG("cobject: '%-20s' (%p): calling ktype release",
		    name, cobj);
		t->release(cobj);
	}
}

void cobject_put(struct cobject *cobj) {
	const char *err_str;

	if (cobj) { /* a null cobj is legal */
		if (!cobj->state_initialized) {
			err_str = "cobject uninitialized!";
			goto error;
		}

		if (refcount_val(&cobj->cref) == 0) {
			err_str = "cobject cref already 0, cannot be put again!";
			goto error;
		}

		/* decrement ref count */
		if (refcount_dec(&cobj->cref) == true)
			cobject_cleanup(cobj); /* called when ref reaches 0 */
	}

	return;

error:
	EMSG("core object (%p): %s", cobj, err_str);
	panic();
}

/* unlink core object from cset and its parent if there is */
void cobject_unlink(struct cobject *cobj) {
	cobj_cset_leave(cobj);
	cobject_put(cobj->parent);
	cobj->parent = NULL;
}

static void default_cobj_release(struct cobject *cobj) {
	DMSG("cobject: (%p): %s", cobj, __func__);
	free(cobj);
}

static void default_cobj_print(struct cobject *cobj) {
	IMSG("cobject: '%-20s' (%p): %s: parent: '%s', set: '%s'",
	    cobject_name(cobj), cobj, __func__,
	    cobj->parent ? cobject_name(cobj->parent) : "<null>",
	    cobj->cset ? cobject_name(&cobj->cset->cobj) : "<null>");
}

static struct cobj_type default_cobj_ctype = {
	.release	= default_cobj_release,
	.print		= default_cobj_print,
};

struct cobject *cobject_create(void) {
	struct cobject *cobj;

	cobj = malloc(sizeof(*cobj));
	if (cobj == NULL) {
		EMSG("cobject: creation fails1");
		return NULL;
	}

	cobject_init(cobj, &default_cobj_ctype);
	return cobj;
}

struct cobject *cobject_create_and_add(const char *name,
				       struct cobject *parent) {
	struct cobject *cobj;
	int retval;

	cobj = cobject_create();
	if (cobj == NULL)
		return NULL;

	retval = cobject_add(cobj, parent, name);
	if (retval != TEE_SUCCESS) {
		EMSG("cobject: %s error", __func__);
		cobject_put(cobj);
		cobj = NULL;
	}

	return cobj;
}

void cset_init(struct cset *cset) {
	cobject_init_internal(&cset->cobj);

	/* initialize cset cobject list head */
	cset->cobj_list_head.tqh_first = NULL;
	cset->cobj_list_head.tqh_last = &(cset->cobj_list_head).tqh_first;
}

/**
 * cset_register - initialize and add a cset.
 * @k: cset.
 */
int cset_register(struct cset *cset) {
	if (cset == NULL)
		return TEE_ERROR_BAD_PARAMETERS;

	cset_init(cset);
	return cobject_add_internal(&cset->cobj);
}

void cset_unregister(struct cset *cset) {
	if (cset == NULL)
		return;
	
	cobject_unlink(&cset->cobj); /* cset and parent */
	cobject_put(&cset->cobj); /* cobj itself */
}

struct cobject *cset_find_obj(struct cset *cset, const char *cobj_name) {
	struct cobject *c;
	struct cobject *ret = NULL; /* necessary, return null if not found */

	cpu_spin_lock(&cset->spin_lock);

	TAILQ_FOREACH(c, &cset->cobj_list_head, entry) {
		if (cobject_name(c) && !strcmp(cobject_name(c), cobj_name)) {
			ret = c;
			break;
		}
	}

	cpu_spin_unlock(&cset->spin_lock);
	return ret;
}

static void default_cset_release(struct cobject *cobj) {
	struct cset *cset = container_of(cobj, struct cset, cobj);
	DMSG("cobject: '%-20s' (%p): %s", cobject_name(cobj), cobj, __func__);
	free(cset);
}

static struct cobj_type default_cset_ctype = {
	.release	= default_cset_release,
	.print		= default_cobj_print,
};

static struct cset *cset_create(const char *name,
				struct cobject *parent) {
	struct cset *cset;
	int retval;

	cset = malloc(sizeof(*cset));
	if (cset == NULL)
		return NULL;

	retval = cobject_set_name(&cset->cobj, name);
	if (retval != TEE_SUCCESS) {
		free(cset);
		return NULL;
	}

	cset->cobj.parent = parent;
	cset->cobj.ctype = &default_cset_ctype;
	cset->cobj.cset = NULL;

	return cset;
}

struct cset *cset_create_and_register(const char *name,
				 struct cobject *parent) {
	struct cset *cset;
	int retval;

	cset = cset_create(name, parent);
	if (cset == NULL)
		return NULL;

	retval = cset_register(cset);
	if (retval != TEE_SUCCESS) {
		free(cset);
		return NULL;
	}

	return cset;
}

static struct cobj_type sanc_ctype = {
	.release	= NULL,
	.print		= default_cobj_print,
};

static TEE_Result ldr_cobject_init(void) {
	/* initialize sanctuary cset */
	sanctuary.cobj.ctype = &sanc_ctype;
	cset_init(&sanctuary);
	cobject_set_name(&sanctuary.cobj, "sanctuary");

	sanctuary.cobj.ctype->print(&sanctuary.cobj);

	return TEE_SUCCESS;
}
// ldr_init(ldr_cobject_init);