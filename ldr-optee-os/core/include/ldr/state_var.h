/* SPDX-License-Identifier: BSD-2-Clause */
/**
 * state variable definition.
 * 
 * 
*/

#ifndef LDR_STATE_VAR
#define LDR_STATE_VAR

#include <inttypes.h>
#include <trace.h>
#include <utee_defines.h>

#include "ldr.h"

struct se_sec_item {
	unsigned int offset;
	unsigned int size;
};

struct state_var {
	struct ldr_driver_info *drv;
	uint32_t size;
	unsigned char *drv_sv;	/* sw state var 		*/
	unsigned char *nw_sv;	/* nw state var (mapped)	*/
	unsigned char *bitmap;
};

// #define LDR_STATE_VAR_DEBUG

extern struct se_sec_item *cur_drv_se_sec_array;
extern uint32_t cur_drv_se_sec_array_size;

/**
 * Parameter arrangements:
 * @drv:	ldr driver info struct
 * @size:	size of the driver state variable
 * @se_sec:	secure element section
 * @se_sec_size:secure element section size
*/
struct state_var *ldr_alloc_sv(struct ldr_driver_info *drv, uint32_t size,
			       uint32_t *se_sec, uint32_t se_sec_size);

/**
 * Get the secure element section array for the driver LKM
 * currently being loaded.
*/
inline struct se_sec_item *get_current_se_sec_array(void) {
	if (cur_drv_se_sec_array != NULL)
		return cur_drv_se_sec_array;
	else {
		EMSG("No drv secure element section set.");
		return NULL;
	}
}

/**
 * Record the secure element section array for the driver LKM
 * currently being loaded (during module loading phase).
 * 
 * Note that if the currently loaded driver has no security-
 * sensitive fields, meaning that it has no ".sec_ele" section,
 * it can invoke this function with a NULL pointer.
*/
inline void set_current_se_sec_array(uint32_t *array) {
	cur_drv_se_sec_array = (struct se_sec_item *)array;
}

/**
 * Get the secure element section array size for the driver LKM
 * currently being loaded.
*/
inline uint32_t get_current_se_sec_array_size(void) {
	return cur_drv_se_sec_array_size;
}

/**
 * Record the secure element section array size for the driver LKM
 * currently being loaded (during module loading phase).
 * 
 * Note that the validity is enforced through the array pointer.
*/
inline void set_current_se_sec_array_size(uint32_t size) {
	cur_drv_se_sec_array_size = size;
}

/**
 * shadow the secure world state variable secure elements and 
 * prepare normal world state variable for the on-going Linux subsystem
 * function redirection
 * 
 * @drv_info:	target driver
*/
TEE_Result sv_shadow(struct ldr_driver_info *drv_info);
TEE_Result sv_shadow_id(uint32_t drv_id);

/**
 * clean the normal world state variable secure elements on subsystem
 * call return
 * 
 * @drv_info:	target driver
 * @clean:	if set, the normal sv will be cleaned on return
*/
TEE_Result sv_sync(struct ldr_driver_info *drv_info, int clean);
TEE_Result sv_sync_id(uint32_t drv_id, int clean);
/**
 * clean the normal world state variable's secure elements during
 * driver initalization
*/
TEE_Result sv_init_sync(struct ldr_driver_info *drv_info);

/**
 * utility function to get an argument (ptr to sv element or not) for
 * a redirected linux subsystem call
*/
uint32_t rpc_get_arg(uint32_t drv_id, uint32_t arg);

#endif /* LDR_STATE_VAR */