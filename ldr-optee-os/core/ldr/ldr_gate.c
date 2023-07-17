/* SPDX-License-Identifier: BSD-2-Clause */
/**
 * This is the main source file implementing LDR DMZ gate
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
#include <kernel/linker.h>
#include <kernel/misc.h>
#include <kernel/panic.h>
#include <malloc.h>
#include <mm/core_memprot.h>
#include <mm/core_mmu.h>
#include <mm/tee_mm.h>
#include <mm/tee_mmu.h>
#include <mm/tee_pager.h>
#include <stdio.h>
#include <trace.h>
#include <utee_defines.h>
#include <kernel/cache_helpers.h>
#include <kernel/tlb_helpers.h>
#include <sm/sm.h>
#include <kernel/interrupt.h>
#include <kernel/spinlock.h>

#include "module.h"

#include <ldr/ldr.h>
#include <ldr/ldr_dac.h>
#include <ldr/ldr_gate.h>

#define SECTION_SIZE		0x00100000

struct ldr_gate_ctx ldr_gate_ctx[CFG_TEE_CORE_NB_CORE];
struct hook_info *cur_hook_info;

/* 1-level page table descriptor array for optee text */
uint32_t *tee_text_pt_desc;
uint32_t tee_text_sec_num;

void set_cur_hook_info(struct hook_info *hi) {
	cur_hook_info = hi;
}

struct hook_info *get_cur_hook_info(void) {
	return cur_hook_info;
}

struct ldr_gate_ctx *get_ldr_gate_ctx(void) {
	unsigned int pos = get_core_pos();

	return &ldr_gate_ctx[pos];
}

void init_tee_text_pt_desc(void) {
	uint32_t tee_text_start;
	uint32_t ldr_gate_text_start;
	uint32_t tee_text_end;
	struct core_mmu_table_info tbl_info;
	unsigned int idx;
	unsigned int tmp_va;
	unsigned int tmp_pa;
	unsigned int tmp_desc;
	uint32_t *tbl;
	uint32_t count = 0;

	tee_text_start = __text_start;
	tee_text_end = __ldr_gate_text_start; /* tee core end to set NX */

	ldr_gate_text_start = __ldr_gate_text_start;	

	assert((tee_text_start % SECTION_SIZE) == 0);
	assert((ldr_gate_text_start % SECTION_SIZE) == 0);

	#ifdef LDR_GATE_DEBUG
	DMSG("tee_text_start:      0x%08x.", tee_text_start);
	DMSG("tee_text_end:        0x%08x.", tee_text_end);
	DMSG("ldr_gate_text_start: 0x%08x.", ldr_gate_text_start);	
	#endif

	/* traverse all the corresponding entries in the page table */
	for (tmp_va = tee_text_start;
	     tmp_va < tee_text_end;
	     tmp_va += SECTION_SIZE) {
		if (!core_mmu_find_table(NULL, tmp_va, 2, &tbl_info))
			panic("Can't find pagetable for vaddr ");

		idx = core_mmu_va2idx(&tbl_info, tmp_va);

		/* get ttb descriptor */
		tbl = tbl_info.table;
		tee_text_pt_desc = &tbl[idx];

		count++;
	}

	tee_text_sec_num = count;

	DMSG("ldr_gate_ctx addr: %p", ldr_gate_ctx);
	DMSG("TEE text section #: %d", tee_text_sec_num);
	DMSG("TEE text section desc: 0x%08x", *tee_text_pt_desc);
}

uint32_t *get_tee_text_pt_desc(void) {
	return tee_text_pt_desc;
}

void set_tee_text_xn(void) {
	/* section descriptor XN (bit[4]) */
	/* CAUTION: use bit shift to set attributes, NEVER immediate num */
	*tee_text_pt_desc |= BIT(4);
	DMSG("");

	ldr_icache_inv_all();
	ldr_dcache_op_all(DCACHE_OP_CLEAN_INV);
	ldr_tlbi_all();
}

void clear_tee_text_xn(void) {
	/* section descriptor XN (bit[4]) */
	/* CAUTION: use bit shift to set attributes, NEVER immediate num */
	*tee_text_pt_desc &= ~BIT(4);
	DMSG("");

	ldr_icache_inv_all();
	ldr_dcache_op_all(DCACHE_OP_CLEAN_INV);
	ldr_tlbi_all();
}

struct hook_info *alloc_hook_info(void) {
	struct hook_info *hook_info;

	hook_info = malloc(sizeof(struct hook_info));		
	hook_info->hook_array = calloc(50, sizeof(struct hook_map_entry));

	if (hook_info == NULL || hook_info->hook_array == NULL) {
		EMSG("ERROR: hookinfo allocation fails.");
		return NULL;
	}

	hook_info->count = 0;
	hook_info->capacity = 50;

	return hook_info;
}

TEE_Result add_hook_map_entry(struct hook_info *hook_info,
			      uint32_t callsite_va,
			      uint32_t callee_va) {
	void* buf;

	if (hook_info == NULL) {
		EMSG("ERROR: NULL hook_info.");
		return TEE_ERROR_BAD_PARAMETERS;
	}

	/* whether need to resize */
	if (hook_info->count >= hook_info->capacity - 4) {
		hook_info->capacity += 50;
		buf = calloc(hook_info->capacity, 
			     sizeof(struct hook_map_entry));
		if (buf == NULL) {
			EMSG("ERROR: hookinfo resize fails.");
			return TEE_ERROR_GENERIC;
		}

		memcpy(buf, hook_info->hook_array,
		       hook_info->count * sizeof(struct hook_map_entry));
		free(hook_info->hook_array);

		hook_info->hook_array = buf;
	}

	hook_info->hook_array[hook_info->count].callsite_va = callsite_va;
	hook_info->hook_array[hook_info->count].callee_va = callee_va;

	hook_info->count++;

	return TEE_SUCCESS;
}

void print_hook_info(struct hook_info *hi) {
	if (hi == NULL)
		return;

	IMSG("hook info cap: %d, count: %d", hi->capacity, hi->count);

	for (int i = 0; i < hi->count; i++) {
		IMSG("callsite loc: %p, callee loc: %p",
		     hi->hook_array[i].callsite_va,
		     hi->hook_array[i].callee_va);
	}
}

int get_callee_spinlock;

uint32_t ldr_gate_get_callee(void) {
	struct ldr_driver_info *drv_info;
	struct hook_info *hook_info;
	struct ldr_gate_ctx *cur_ldr_gate_ctx;
	uint32_t callsite_addr;

	cur_ldr_gate_ctx = get_ldr_gate_ctx();	
	callsite_addr = cur_ldr_gate_ctx->ldr_lr - 4;

	hook_info = get_hook_info(callsite_addr);
	if (hook_info == NULL) { /* during driver init() */
		hook_info = cur_hook_info;
	}

	#ifdef LDR_GATE_DEBUG
	DMSG("ldr gate lr: %p, callsite addr:%p", 
	     cur_ldr_gate_ctx->ldr_lr, callsite_addr);
	#endif

	cpu_spin_lock(&get_callee_spinlock);
	for (int i = 0; i < hook_info->count; i++) {
		if (hook_info->hook_array[i].callsite_va == callsite_addr) {
			#ifdef LDR_GATE_DEBUG
			DMSG("callee addr: %p", hook_info->hook_array[i].callee_va);
			#endif
			cpu_spin_unlock(&get_callee_spinlock);
			return hook_info->hook_array[i].callee_va;
		}
	}

	EMSG("ERROR: invalid callsite address %p.", callsite_addr);
	panic("captured security breach.");
}

void print_ldr_gate_ctx(void) {
	unsigned int pos = get_core_pos();
	IMSG("Print Core %d ldr fig saved regs ...", pos);

	IMSG("r0:      \t0x%08x", ldr_gate_ctx[pos].r0);
	IMSG("r1:      \t0x%08x", ldr_gate_ctx[pos].r1);
	IMSG("r2:      \t0x%08x", ldr_gate_ctx[pos].r2);
	IMSG("r3:      \t0x%08x", ldr_gate_ctx[pos].r3);
	IMSG("r4:      \t0x%08x", ldr_gate_ctx[pos].r4);
	IMSG("r5:      \t0x%08x", ldr_gate_ctx[pos].r5);
	IMSG("r6:      \t0x%08x", ldr_gate_ctx[pos].r6);
	IMSG("r7:      \t0x%08x", ldr_gate_ctx[pos].r7);
	IMSG("r8:      \t0x%08x", ldr_gate_ctx[pos].r8);
	IMSG("r9:      \t0x%08x", ldr_gate_ctx[pos].r9);
	IMSG("r10:     \t0x%08x", ldr_gate_ctx[pos].r10);
	IMSG("r11:     \t0x%08x", ldr_gate_ctx[pos].r11);
	IMSG("r12:     \t0x%08x", ldr_gate_ctx[pos].r12);
	IMSG("sp:      \t0x%08x", ldr_gate_ctx[pos].ldr_sp);
	IMSG("lr:      \t0x%08x", ldr_gate_ctx[pos].ldr_lr);
}

void print_here(void) {
	DMSG("");
}

void gate_print_reg(int r0) {
	DMSG("%d.");
}

int invoke_drv_init(drv_init init, int ied_num) {
	int res;

	/* prepare ldr_dac_ctx stack */
	set_cur_ied_num(ied_num);

	#ifdef LDR_GATE_DEBUG
	DMSG("entering ldr, invoking drv init().");
	#endif
	ldr_enter_drv();

	ldr_icache_inv_all();
	ldr_dcache_op_all(DCACHE_OP_CLEAN_INV);
	ldr_tlbi_all();

	res = (*init)();

	ldr_exit_drv();
	#ifdef LDR_GATE_DEBUG
	DMSG("exiting ldr, drv init() success.");
	#endif

	return res;
}

int invoke_drv_dispatch(dispatch disp, 
			uint32_t function_id, 
			unsigned char *params,
			int ied_num) {
	int res;

	/* prepare ldr_dac_ctx stack */
	// set_ldr_stacks(ied_num);
	set_cur_ied_num(ied_num);

	#ifdef LDR_GATE_DEBUG
	DMSG("entering ldr, invoking drv dispatch().");
	#endif
	ldr_enter_drv();

	ldr_icache_inv_all();
	ldr_dcache_op_all(DCACHE_OP_CLEAN_INV);
	ldr_tlbi_all();

	res = (*disp)(function_id, params);

	ldr_exit_drv();
	#ifdef LDR_GATE_DEBUG
	DMSG("exiting ldr, drv dispatch() success.");
	#endif

	return res;
}

typedef (*irq_handler)(int irq, void *desc);

int invoke_drv_irq_handler(struct itr_handler *h) {
	int res;
	int irq = h->it;
	void *desc = h->data;
	irq_handler irq_handler = h->handler;

	/* TODO: find the corresponding ldr_driver_info of the handler. */
	int ied_num = get_cur_ied_num();

	ldr_icache_inv_all();
	ldr_dcache_op_all(DCACHE_OP_CLEAN_INV);
	ldr_tlbi_all();

	uint32_t exceptions = thread_mask_exceptions(THREAD_EXCP_ALL);

	ldr_enter_drv_irq_handler();

	res = (*irq_handler)(irq, desc);

	ldr_exit_drv_irq_handler();
	DMSG("");

	thread_set_exceptions(exceptions);
	return res;
}

extern void ldr_tlbi_all(void);
extern void ldr_icache_inv_all(void);
extern void ldr_dcache_op_all(unsigned long op_type);

TEE_EXPORT_SYMBOL(ldr_tlbi_all);
TEE_EXPORT_SYMBOL(ldr_icache_inv_all);
TEE_EXPORT_SYMBOL(ldr_dcache_op_all);