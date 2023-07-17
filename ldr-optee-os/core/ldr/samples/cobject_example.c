/* SPDX-License-Identifier: BSD-2-Clause */
/**
 * core object header file: generic OPTEE core object infrastructure.
 * 
 * 
*/

#include <initcall.h>
#include <inttypes.h>
#include <kernel/panic.h>
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

static struct cobject example_parent;
static struct cobject *example_cobj;

static void example_cobj_release(struct cobject *cobj) {
	DMSG("cobject: (%p): %-20s", cobj, __func__);
	free(cobj);
}

static void example_cobj_print(struct cobject *cobj) {
	IMSG("cobject: '%-20s' (%p): %s: parent: '%s', set: '%s'",
	    cobject_name(cobj), cobj, __func__,
	    cobj->parent ? cobject_name(cobj->parent) : "<null>",
	    cobj->cset ? cobject_name(&cobj->cset->cobj) : "<null>");
}

static struct cobj_type example_cobj_ctype = {
	.release	= example_cobj_release,
	.print		= example_cobj_print,
};

static TEE_Result cobject_example_init(void) {
	int retval;
	struct cset *sanc = get_sanc();
	struct cobject *c;

	/* initialize example_parent */
	cobject_init(&example_parent, &example_cobj_ctype);
	retval = cobject_add(&example_parent, NULL, "example_parent");

	if (retval != TEE_SUCCESS) 
		return retval;

	/* dynamically create a cobject */
	example_cobj = cobject_create_and_add("cobject_example", &example_parent);
	if (example_cobj == NULL)
		return TEE_ERROR_OUT_OF_MEMORY;
	
	if (example_cobj->parent
	    && example_cobj->parent->ctype->print) {
		example_cobj->parent->ctype->print(example_cobj->parent);
	}

	example_cobj->ctype->print(example_cobj);

	/* print out santuary cset */
	sanc->cobj.ctype->print(&sanc->cobj);
	TAILQ_FOREACH(c, &sanc->cobj_list_head, entry) {
		if (c->ctype->print)
			c->ctype->print(c);
	}

	return TEE_SUCCESS;
}
/* success, uncomment to enable test */
// ldr_init_late(cobject_example_init);