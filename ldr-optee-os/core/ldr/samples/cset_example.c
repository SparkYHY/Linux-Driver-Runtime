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

static struct cset *example_cset;
static struct cobject *foo_obj;
static struct cobject *bar_obj;
static struct cobject *baz_obj;

static TEE_Result cset_example_init(void) {
	int retval;
	struct cset *sanc = get_sanc();
	struct cobject *example_parent = NULL;
	struct cobject *c;

	example_parent = cset_find_obj(sanc, "example_parent");	
	example_cset = cset_create_and_register("example_cset", example_parent);
	if (example_cset == NULL)
		return TEE_ERROR_OUT_OF_MEMORY;
	
	foo_obj = cobject_create();
	if (foo_obj == NULL)
		return TEE_ERROR_OUT_OF_MEMORY;
	foo_obj->cset = example_cset;
	retval = cobject_add(foo_obj, NULL, "foo_cobj");
	if (retval != TEE_SUCCESS)
		return retval;
	
	bar_obj = cobject_create();
	if (bar_obj == NULL)
		return TEE_ERROR_OUT_OF_MEMORY;
	retval = cobject_add(bar_obj, foo_obj, "bar_cobj");
	if (retval != TEE_SUCCESS)
		return retval;
	
	baz_obj = cobject_create();
	if (baz_obj == NULL)
		return TEE_ERROR_OUT_OF_MEMORY;
	baz_obj->cset = example_cset;
	retval = cobject_add(baz_obj, bar_obj, "baz_cobj");
	if (retval != TEE_SUCCESS)
		return retval;

	/* print out santuary cset */
	sanc->cobj.ctype->print(&sanc->cobj);
	TAILQ_FOREACH(c, &sanc->cobj_list_head, entry) {
		if (c->ctype->print)
			c->ctype->print(c);
	}

	/* print out example_cset */
	example_cset->cobj.ctype->print(&example_cset->cobj);
	TAILQ_FOREACH(c, &example_cset->cobj_list_head, entry) {
		if (c->ctype->print)
			c->ctype->print(c);
	}

	return TEE_SUCCESS;
}
/* success, uncomment to enable test */
// ldr_init_late(cset_example_init);