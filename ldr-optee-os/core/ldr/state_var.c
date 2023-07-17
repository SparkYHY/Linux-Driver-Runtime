/* SPDX-License-Identifier: BSD-2-Clause */
/**
 * This source file implements the interpreter to generate the bitmap
 * for the state variable of a certain SW driver and provides several
 * utility functions for bitmap resolution.
 * 
 * 
*/

#include <arm32.h>
#include <compiler.h>
#include <stdio.h>
#include <trace.h>
#include <kernel/misc.h>
#include <kernel/pseudo_ta.h>
#include <kernel/thread.h>
#include <malloc.h>
#include <mm/tee_pager.h>
#include <mm/tee_mm.h>
#include <printk.h>
#include <string.h>
#include <string_ext.h>
#include <trace.h>
#include <kernel/spinlock.h>
#include <kernel/export.h>
#include <ldr/ldr.h>
#include <optee_rpc_cmd.h>

#include <ldr/state_var.h>
#include <ldr/ldr_dac.h>

struct se_sec_item *cur_drv_se_sec_array = NULL;
uint32_t cur_drv_se_sec_array_size = 0;

struct state_var *ldr_alloc_sv(struct ldr_driver_info *drv, uint32_t size,
			       uint32_t *se_sec, uint32_t se_sec_size) {
	/* alignment checking */
	if (se_sec_size % 4 != 0 || size % 4 != 0) {
		EMSG("Illegal alignment.");
		return TEE_ERROR_BAD_PARAMETERS;
	}

	struct state_var *sv;
	struct se_sec_item *array;
	struct se_sec_item *item;
	uint32_t se_sec_item_num;

	se_sec_item_num = se_sec_size / sizeof(struct se_sec_item);
	array = (struct se_sec_item *)se_sec;

	#ifdef LDR_STATE_VAR_DEBUG
	DMSG("secure element array size: %d", se_sec_item_num);
	#endif

	sv = malloc(sizeof(struct state_var));
	if (sv == NULL) {
		goto sv_alloc_fail;
	}

	sv->drv = drv;
	sv->drv_sv = drv->sv;
	sv->size = size;

	/**
	 * Basic bitmap algorithm:
	 * 1. bitmap is of the same size with the state variable,
	 *    thus resulting bit-to-bit mapping
	 * 2. a '&&' operation on the bitmap and the SW state variable
	 *    will result in a legal SW state variable
	 * 3. the bitmap is initialized with all bits set.
	 * 4. for the security-sensitive fields, their corresponding bits 
	 *    are cleared so that their contents will not be copied to NW SV
	*/
	sv->bitmap = malloc(sv->size);
	if (sv->bitmap == NULL) {
		goto bitmap_alloc_fail;
	}
	/* set bitmap content */
	memset(sv->bitmap, 0xFF, sv->size);

	/* scan the secure element section array and populate bitmap */
	for (int i = 0; i < se_sec_item_num; i++) {
		item = array + i;
		memset(sv->bitmap + item->offset, 0x00, item->size);

		#ifdef LDR_STATE_VAR_DEBUG
		DMSG("#%d, offset: %d, size: %d", i, item->offset, item->size);
		#endif
	}

	return sv;

bitmap_alloc_fail:
	free(sv);
sv_alloc_fail:
	return NULL;
}

/**
 * NW<-SW Linux subsystem call redirection
 * secure element bitmap state: secure->0, other->1
 * 
 * nw_sv <- sw_sv & bitmap
*/
static void _sv_shadow(unsigned char *sw_sv, unsigned char *nw_sv, 
		       unsigned char *bitmap, uint32_t size) {
	#ifdef LDR_STATE_VAR_DEBUG
	DMSG("sw_sv: 0x%08x, nw_sv: 0x%08x, bitmap: 0x%08x, size: %d",
	      sw_sv, nw_sv, bitmap, size);
	show_va_desc(nw_sv);	
	show_dacr();
	#endif
	for (int i = 0; i < size; i++) {
		nw_sv[i] = sw_sv[i] & bitmap[i];
	}
}

/**
 * NW->SW Linux subsystem call return
 * secure element bitmap state: secure->0, other->1
 * 
 * synchronize non-secure elements
 * clear nw_sv
 * 
 * When clean is set, the strongest security policy is enforced that is the
 * whole normal world state variable gets wipped out right after the return
 * to the secure world. However, for cases where the normal driver is needed 
 * by other NW LKMs, the clean flag is clear so that the non-secure elements
 * can be used by the normal world driver. Anyway, the secure elements never
 * get leaked to the normal world.
*/
static void _sv_sync(unsigned char *sw_sv, unsigned char *nw_sv, 
		     unsigned char *bitmap, uint32_t size, int clean) {
	/* sync non-sec elements */
	for (int i = 0; i < size; i++) {
		sw_sv[i] = (bitmap[i] == 0x00) ? sw_sv[i] : nw_sv[i];
	}

	/* clear normal world state var */
	if (clean) {
		memset(nw_sv, 0x00, size);
	}
}

static void _sv_init_sync(unsigned char *sw_sv, unsigned char *nw_sv, 
			  unsigned char *bitmap, uint32_t size) {
	/* clear nw sv secure elements */
	for (int i = 0; i < size; i++) {
		nw_sv[i] = nw_sv[i] & bitmap[i];
	}
}

TEE_Result sv_shadow(struct ldr_driver_info *drv_info) {
	_sv_shadow(drv_info->sv, drv_info->state_var->nw_sv,
		drv_info->state_var->bitmap, drv_info->state_var->size);

	#ifdef LDR_STATE_VAR_DEBUG
	DMSG("_sv_shadow() success.");
	#endif

	return TEE_SUCCESS;
}

TEE_Result sv_shadow_id(uint32_t drv_id) {
	struct ldr_driver_info *drv_info = ldr_get_driver_info(drv_id);
	if (drv_info == NULL) {
		return TEE_ERROR_BAD_PARAMETERS;
	}

	#ifdef LDR_STATE_VAR_DEBUG
	DMSG("drv_id: %d, drv_info addr: 0x%08x", drv_id, drv_info);
	#endif

	return sv_shadow(drv_info);
}

TEE_Result sv_sync(struct ldr_driver_info *drv_info, int clean) {
	_sv_sync(drv_info->sv, drv_info->state_var->nw_sv,
		drv_info->state_var->bitmap, drv_info->state_var->size,
		clean);

	return TEE_SUCCESS;
}

TEE_Result sv_sync_id(uint32_t drv_id, int clean) {
	struct ldr_driver_info *drv_info = ldr_get_driver_info(drv_id);
	if (drv_info == NULL) {
		return TEE_ERROR_BAD_PARAMETERS;
	}

	return sv_sync(drv_info, clean);
}

TEE_Result sv_init_sync(struct ldr_driver_info *drv_info) {
	_sv_init_sync(drv_info->sv, drv_info->state_var->nw_sv,
		drv_info->state_var->bitmap, drv_info->state_var->size);

	return TEE_SUCCESS;
}

static int within_range(struct ldr_driver_info *drv_info, uint32_t arg) {
	if ((uint32_t)(drv_info->sv) < arg && 
	    (uint32_t)(drv_info->sv) + drv_info->state_var->size > arg) {
		return 1;
	}

	return 0;	
}

uint32_t rpc_get_arg(uint32_t drv_id, uint32_t arg) {
	struct ldr_driver_info *drv_info = ldr_get_driver_info(drv_id);
	if (drv_info == NULL) {
		return TEE_ERROR_BAD_PARAMETERS;
	}

	#ifdef LDR_STATE_VAR_DEBUG
	DMSG("drv_id: %d, drv_info addr: 0x%08x", drv_id, drv_info);
	#endif

	if (within_range(drv_info, arg)) {
		return (arg - (uint32_t)(drv_info->sv));
	}

	return arg;
}