/* SPDX-License-Identifier: BSD-2-Clause */
/**
 * The abbreviation "ldr" stands for "Linux Driver Runtime".
 * 
 * LDR provides a runtime environment for original Linux driver/kernel module
 * inside OPTEE. The aim of this project is to transparently reuse linux 
 * kernel modules/drivers without heavy re-engineering efforts.
 * 
 * 
*/

#include <arm.h>
#include <assert.h>
#include <compiler.h>
#include <config.h>
#include <console.h>
#include <initcall.h>
#include <inttypes.h>
#include <keep.h>
#include <kernel/boot.h>
#include <kernel/export.h>
#include <kernel/interrupt.h>
#include <kernel/linker.h>
#include <kernel/misc.h>
#include <kernel/panic.h>
#include <kernel/thread.h>
#include <libfdt.h>
#include <malloc.h>
#include <mm/core_memprot.h>
#include <mm/core_mmu.h>
#include <mm/tee_mm.h>
#include <mm/tee_mmu.h>
#include <mm/tee_pager.h>
#include <stdio.h>
#include <sys/queue.h>
#include <trace.h>
#include <utee_defines.h>
#include <optee_rpc_cmd.h>
// #include "dtc_util.h"
#include <drivers/imx_gpt.h>
#include <kernel/cache_helpers.h>

#include "module.h"

#include <ldr/ldr.h>		/* LDR */
#include <ldr/cobject.h>	/* LDR */
#include <ldr/ldr_dac.h>
#include <ldr/ldr_gate.h>

#ifdef CFG_LDR_DEBUG
#define LDR_DEBUG_FDT
#endif /* CFG_LDR_DEBUG */

/* core-level lock to serialize tee-service invocation and LFC */
uint32_t ldr_big_spinlock;

/* tail queue to hold all driver info */
struct ldr_driver_info_node {
	struct ldr_driver_info ldr_driver_info;
	TAILQ_ENTRY(ldr_driver_info_node) link;
};

TAILQ_HEAD(ldr_driver_info_queue, ldr_driver_info_node);

struct ldr_driver_info_queue ldr_driver_info_queue = 
	TAILQ_HEAD_INITIALIZER(ldr_driver_info_queue);

int ldr_check_fdt(vaddr_t fdt) {
	int version;
	
	/* For now, LDR only checks the fdt version. */
	version = fdt_version(fdt);
	if (version < 17) {
		EMSG("current fdt version: %d, " \
		    "LDR requires: fdt version >= 17", version);
		IMSG("Dumping FDT memory ... ");
		dhex_dump(NULL, 0, 0, (void *)fdt, 0x10);
		return TEE_ERROR_BAD_PARAMETERS;
	}

#ifdef LDR_DEBUG_FDT
	printk("fdt version %d\n", fdt_version(fdt));
	printk("dt struct size: %d\n", fdt_size_dt_struct(fdt));
#endif /* LDR_DEBUG_FDT */

	return TEE_SUCCESS;
}

int ldr_init_module(void *mod, unsigned long len) {
	unsigned long start_time, end_time;
	int ied_num;

	/* get an IED for the current module */
	ied_num = get_ied_num();
	set_cur_ied_num(ied_num);
	set_ldr_stacks(ied_num);

	init_module(mod, len, ied_num);

	return 0;
}

int ldr_sw_driver_register(uint32_t driver_id, dispatch disp, void *sv) {
	struct ldr_driver_info_node *ldr_driver_info_node = 
			calloc(1, sizeof(*ldr_driver_info_node));

	printk("registering driver %d.\n", driver_id);

	ldr_driver_info_node->ldr_driver_info.id = driver_id;
	ldr_driver_info_node->ldr_driver_info.disp = disp;
	ldr_driver_info_node->ldr_driver_info.sv = sv;

	/* fetch the IED num assigned for the current driver being loaded. */
	ldr_driver_info_node->ldr_driver_info.ied_num = get_cur_ied_num();

	TAILQ_INSERT_TAIL(&ldr_driver_info_queue, ldr_driver_info_node, link);

	ldr_sw_set_cur_driver_id(driver_id);

	printk("driver %d registered successfully.\n", 
		ldr_driver_info_node->ldr_driver_info.id);

	return 0;
}
TEE_EXPORT_SYMBOL(ldr_sw_driver_register);

struct ldr_driver_info *ldr_get_driver_info(uint32_t driver_id) {
	struct ldr_driver_info_node *driver_info_node;

	if(TAILQ_EMPTY(&ldr_driver_info_queue))
		return NULL;

	TAILQ_FOREACH(driver_info_node, &ldr_driver_info_queue, link) {
		if (driver_info_node->ldr_driver_info.id == driver_id) {
			return &(driver_info_node->ldr_driver_info);
		}
	}

	EMSG("ERROR: invalid driver id %d.", driver_id);
	return NULL;
}

dispatch ldr_get_dispatcher(uint32_t driver_id) {
	struct ldr_driver_info *driver_info;
	
	driver_info = ldr_get_driver_info(driver_id);

	if (driver_info) {
		return driver_info->disp;
	} else {
		return NULL;
	}
}

uint32_t *ldr_get_sv(uint32_t driver_id) {
	struct ldr_driver_info *driver_info;
	
	driver_info = ldr_get_driver_info(driver_id);

	if (driver_info) {
		return driver_info->sv;
	} else {
		return NULL;
	}
}

uint32_t ldr_register_shm(uint32_t driver_id, 
			  paddr_t shm_pa, uint32_t shm_size) {
	struct ldr_driver_info *driver_info;
	vaddr_t shm_va;

	driver_info = ldr_get_driver_info(driver_id);

	if (driver_info) {
		driver_info->shm_info.shm_pa = shm_pa;
		driver_info->shm_info.shm_size = shm_size;

		/* map the shm into optee core */
		if (!core_mmu_add_mapping(MEM_AREA_RAM_NSEC, shm_pa, shm_size)) {
			EMSG("ERROR: shm reg failed for driver %d.", driver_id);
		}

		shm_va = phys_to_virt(shm_pa, MEM_AREA_RAM_NSEC);
		if (shm_va == NULL) {
			EMSG("ERROR: shm reg NULL va for driver %d.", driver_id);
		}

		driver_info->shm_info.shm_va = shm_va;

		return TEE_SUCCESS;
	} else {
		return TEE_ERROR_GENERIC;
	}
}

vaddr_t ldr_get_shm(uint32_t driver_id) {
	struct ldr_driver_info *driver_info;
	
	driver_info = ldr_get_driver_info(driver_id);

	if (driver_info) {
		return driver_info->shm_info.shm_va;
	} else {
		return NULL;
	}
}

typedef enum itr_return (*itr_handler_t)(struct itr_handler *h);

uint32_t ldr_sw_irq_register(unsigned int irq, itr_handler_t handler, 
			     void *sv) {
	struct itr_handler *itr_handler;

	itr_handler = malloc(sizeof(*itr_handler));

	itr_handler->it = irq;
	itr_handler->handler = handler;
	itr_handler->data = sv;

	itr_set_it_secure(itr_handler->it);
	itr_add(itr_handler);
	itr_enable(itr_handler->it);
	itr_set_affinity(itr_handler->it, 0x01 << 3);

	return 0;
}
TEE_EXPORT_SYMBOL(ldr_sw_irq_register);

uint32_t global_current_driver_id;
uint32_t current_driver_id[CFG_TEE_CORE_NB_CORE];

uint32_t ldr_sw_set_cur_driver_id(uint32_t driver_id) {
	unsigned int pos = get_core_pos();

	uint32_t org_id = current_driver_id[pos];

	current_driver_id[pos] = driver_id;
	global_current_driver_id = driver_id;

	return org_id; /* return original driver id */
}
TEE_EXPORT_SYMBOL(ldr_sw_set_cur_driver_id);

uint32_t ldr_sw_get_cur_driver_id(void) {
	unsigned int pos = get_core_pos();
	unsigned int id;

	if (current_driver_id[pos])
		id = current_driver_id[pos];
	else
		id = global_current_driver_id;
	
	return id;
}
TEE_EXPORT_SYMBOL(ldr_sw_get_cur_driver_id);

struct hook_info *get_hook_info(vaddr_t callsite_va) {
	struct ldr_driver_info_node *driver_info_node;
	struct ldr_driver_info *drv_info;
	uint32_t exceptions;

	if(TAILQ_EMPTY(&ldr_driver_info_queue))
		return NULL;

	exceptions = thread_mask_exceptions(THREAD_EXCP_ALL);

	TAILQ_FOREACH(driver_info_node, &ldr_driver_info_queue, link) {
		drv_info = &(driver_info_node->ldr_driver_info);

		if ((callsite_va >= drv_info->mod->core_layout.base &&
		     callsite_va < drv_info->mod->core_layout.base +
		                   drv_info->mod->core_layout.size) ||
		    (callsite_va >= drv_info->mod->init_layout.base &&
		     callsite_va < drv_info->mod->init_layout.base +
		                   drv_info->mod->init_layout.size)) {
			#ifdef LDR_GATE_DEBUG
			DMSG("using drv %d hook info.", drv_info->id);
			#endif
			thread_set_exceptions(exceptions);
			return drv_info->hook_info;
		}
	}
	thread_set_exceptions(exceptions);

	return NULL;
}