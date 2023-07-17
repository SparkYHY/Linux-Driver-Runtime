/* SPDX-License-iedntifier: BSD-2-Clause */
/**
 * This is the main source file implementing LDR domain
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
#include <arm32.h>

#include "module.h"

#include <ldr/ldr.h>		/* LDR */
#include <ldr/ldr_dac.h>

#define MMU_DESC_DOMAIN_MASK	0x000001e0
#define MMU_DESC_DOMAIN_SHIFT	5
#define LDR_DOMAIN_ID		2

#define SECTION_SIZE		0x00100000

/**
 * LDR RAM layout
 *
 *  +----------------------------------+ <-- CFG_TZDRAM_START
 *  | TEE core secure RAM (TEE_RAM)    |
 *  +----------------------------------+ <-- PGDIR aligned, need padding
 *  | *IED gate                        |
 *  +----------------------------------+ <-- PGDIR aligned, need padding
 *  | *IED 1 heap (1MB)                |
 *  +----------------------------------+
 *  | *IED 1 stack (1MB)               |
 *  +----------------------------------+
 *  | *IED 2 heap (1MB)                |
 *  +----------------------------------+
 *  | *IED 2 stack (1MB)               |
 *  +----------------------------------+ <-- PGDIR aligned
 *  | Trusted Application RAM (TA_RAM) |
 *  +----------------------------------+
 *  | SDP test memory (optional)       |
 *  +----------------------------------+ <-- CFG_TZDRAM_START + CFG_TZDRAM_SIZE
 *
 *  +----------------------------------+ <-- CFG_SHMEM_START
 *  | Non-secure static SHM            |
 *  +----------------------------------+ <-- CFG_SHMEM_START + CFG_SHMEM_SIZE
*/

#define IED_NUMBER 2
struct ldr_dac_ctx ldr_dac_ctx[CFG_TEE_CORE_NB_CORE];

#define LDR_PER_CORE_STACK_SIZE	(CFG_LDR_STACK_SIZE / CFG_TEE_CORE_NB_CORE / 2)

void set_ldr_dac_desc(uint32_t start_va, uint32_t end_va, uint32_t domain_num) {
	struct core_mmu_table_info tbl_info;
	unsigned int idx;
	unsigned int tmp_va;
	unsigned int tmp_pa;
	unsigned int tmp_desc;
	uint32_t *tbl;

	if (domain_num > 15) {
		EMSG("ERROR: invalid domain number: %d.\n", domain_num);
		return;
	}

	/* traverse all the corresponding entries in the page table */
	for (tmp_va = ROUNDDOWN(start_va, SECTION_SIZE);
	     tmp_va < end_va;
	     tmp_va += SECTION_SIZE) {
		if (!core_mmu_find_table(NULL, tmp_va, 2, &tbl_info))
			panic("Can't find pagetable for vaddr ");

		idx = core_mmu_va2idx(&tbl_info, tmp_va);

		/* get ttb descriptor */
		tbl = tbl_info.table;
		tmp_desc = tbl[idx];

		/* update domain attribute (bit[8:5]) */
		/* CAUTION: use bit shift to set attributes, NEVER immediate num */
		tmp_desc &= ~MMU_DESC_DOMAIN_MASK;
		tmp_desc |= domain_num << 5;

		tbl[idx] = tmp_desc;

		// DMSG("[0x%08x, 0x%08x], desc: 0x%08x.", 
		//       tmp_va, tmp_va + SECTION_SIZE, tbl[idx]);
	}
}

/**
 * domain number: [0, 15]
 * 0: secure OS
 * 1: TA
 * 2: shared memory + IED gate
 * 3-15: SW drivers
*/
TEE_Result init_ldr_domain(void) {
	/* two ied region info */	
	uint32_t ied1_start_va;
	uint32_t ied1_end_va;
	uint32_t ied1_size;
	uint32_t ied2_start_va;
	uint32_t ied2_end_va;
	uint32_t ied2_size;

	/* ied gate info */
	uint32_t ldr_gate_start_va;
	uint32_t ldr_gate_end_va;
	uint32_t ldr_gate_size;

	/* shm info */
	uint32_t rest_start_va;
	uint32_t rest_end_va;
	uint32_t rest_size;
	uint32_t nsecshm_start_va;
	uint32_t nsecshm_end_va;
	uint32_t nsecshm_size;

	/* configure domain ID of IED 1 memory page table desc as 3 */
	ied1_start_va = (uint32_t)__ldr_heap1_start;
	ied1_end_va = (uint32_t)__ldr_stack1_end;
	ied1_size = ied1_end_va - ied1_start_va;

	DMSG("IED 1 region [s-e]: [0x%08x, 0x%08x] size: 0x%08x", 
	      ied1_start_va, ied1_end_va, ied1_size);
	set_ldr_dac_desc(ied1_start_va, ied1_end_va, 3);

	/* configure domain ID of IED 2 memory page table desc as 4 */
	ied2_start_va = (uint32_t)__ldr_heap2_start;
	ied2_end_va = (uint32_t)__ldr_stack2_end;
	ied2_size = ied2_end_va - ied2_start_va;

	DMSG("IED 2 region [s-e]: [0x%08x, 0x%08x] size: 0x%08x", 
	      ied2_start_va, ied2_end_va, ied2_size);
	set_ldr_dac_desc(ied2_start_va, ied2_end_va, 4);

	/* configure domain ID of LDR gate page table desc as 2 */
	ldr_gate_start_va = (uint32_t)__ldr_gate_text_start;
	ldr_gate_end_va = (uint32_t)__ldr_gate_text_end;
	ldr_gate_size = ldr_gate_end_va - ldr_gate_start_va;

	DMSG("ldr gate     [s-e]: [0x%08x, 0x%08x] size: 0x%08x", 
	      ldr_gate_start_va, ldr_gate_end_va, ldr_gate_size);
	set_ldr_dac_desc(ldr_gate_start_va, ldr_gate_end_va, 2);

	/* configure domain ID of the remaining tee memory page table desc as 2 */
	core_mmu_get_mem_by_type(MEM_AREA_SHM_VASPACE, &rest_start_va, &rest_size);
	core_mmu_get_mem_by_type(MEM_AREA_TA_RAM, &rest_end_va, &rest_size);

	rest_size = rest_end_va - rest_start_va;

	DMSG("shm & IO     [s-e]: [0x%08x, 0x%08x] size: 0x%08x", 
	      rest_start_va, rest_end_va, rest_size);
	set_ldr_dac_desc(rest_start_va, rest_end_va, 2);

	/* configure domain ID of the NSEC_SHM page table desc as 2 */
	core_mmu_get_mem_by_type(MEM_AREA_NSEC_SHM, &nsecshm_start_va, &nsecshm_end_va);

	nsecshm_size = nsecshm_end_va - nsecshm_start_va;

	DMSG("NSEC_SHM mem [s-e]: [0x%08x, 0x%08x] size: 0x%08x", 
	      nsecshm_start_va, nsecshm_end_va, nsecshm_size);
	set_ldr_dac_desc(nsecshm_start_va, nsecshm_end_va, 2);

	return TEE_SUCCESS;
}

void show_va_desc(vaddr_t va) {
	bool table_found;
	struct core_mmu_table_info tbl_info;
	unsigned int idx;	
	uint32_t *tbl;

	if (!core_mmu_find_table(NULL, va, 2, &tbl_info))
		panic("Can't find pagetable for vaddr ");

	idx = core_mmu_va2idx(&tbl_info, va);
	tbl = tbl_info.table;

	DMSG("va: 0x%08x, desc: 0x%08x", va, tbl[idx]);
}

/**
 * By default, set ldr_dac_ctx stack to IED ied_num's stack.
*/
TEE_Result set_ldr_stacks(int ied_num) {
	uint32_t ldr_stack_start_va;
	uint32_t ldr_stack_end_va;

	if (ied_num == 1) {
		ldr_stack_start_va = (uint32_t)__ldr_stack1_start;
		ldr_stack_end_va = (uint32_t)__ldr_stack1_end;
	} else {
		ldr_stack_start_va = (uint32_t)__ldr_stack2_start;
		ldr_stack_end_va = (uint32_t)__ldr_stack2_end;
	}

	assert((ldr_stack_end_va - ldr_stack_start_va) == CFG_LDR_STACK_SIZE);

	memset((void *)ldr_stack_start_va, NULL, CFG_LDR_STACK_SIZE);

	/* initialize LDR stacks */
	for (int i = 1; i <= CFG_TEE_CORE_NB_CORE; i++) {
		ldr_dac_ctx[i - 1].ldr_stack = ldr_stack_start_va + 
			       LDR_PER_CORE_STACK_SIZE * i;
		
		// DMSG("core %d ldr stack addr: 0x%08x", i - 1, 
		// 	ldr_dac_ctx[i - 1].ldr_stack);

		ldr_dac_ctx[i - 1].ldr_fiq_stack = ldr_stack_start_va + 
			       LDR_PER_CORE_STACK_SIZE * (i + CFG_TEE_CORE_NB_CORE);
		
		// DMSG("core %d ldr fiq stack addr: 0x%08x", i - 1, 
		// 	ldr_dac_ctx[i - 1].ldr_fiq_stack);
	}

	return TEE_SUCCESS;
}

struct ldr_dac_ctx *get_ldr_dac_ctx(void) {
	unsigned int pos = get_core_pos();

	return &ldr_dac_ctx[pos];
}

void print_ldr_dac_ctx(void) {
	unsigned int pos = get_core_pos();
	IMSG("Print Core %d ldr dac ctx regs ...", pos);

	IMSG("ldr stack addr: \t0x%08x", ldr_dac_ctx[pos].ldr_stack);
	IMSG("svc sp:         \t0x%08x", ldr_dac_ctx[pos].svc_sp);
	IMSG("svc lr:         \t0x%08x", ldr_dac_ctx[pos].svc_lr);
}

void show_dacr(void) {
	IMSG("DACR: 0x%08x.", read_dacr());
}

int current_ied_num __attribute__((section(".ldr_gate.data")));

void set_cur_ied_num(int num) {
	current_ied_num = num;
}

int get_cur_ied_num(void) {
	return current_ied_num;
}

int ied_usage[2];
/**
 * No need to check invoker since only LDR driver manager can invoke 
 * these two functions and these functions are not exported for SW 
 * drivers' access.
*/
uint32_t get_ied_num(void) {
	int ied = 0;

	for (ied = 0; ied < 2; ied++) {
		if (ied_usage[ied] == 0) {
			ied_usage[ied] = 1;
			break;
		}
	}

	// return ied + 1;
	return 1;
}

void put_ied_num(uint32_t ied_num) {
	if (ied_num != 1 || ied_num != 2) {
		EMSG("ERROR: invalid domain num %d.\n", ied_num);
		return;
	}

	ied_usage[ied_num] = 0;
}

/* close tee access and inter current IED */
void ldr_dac_tee_close(void) {
	uint32_t dacr = 0;

	/* get current IED number */
	int ied_num = get_cur_ied_num();

	dacr |= DACR_DOMAIN(0, DACR_DOMAIN_PERM_NO_ACCESS) |
		DACR_DOMAIN(1, DACR_DOMAIN_PERM_NO_ACCESS) |
		DACR_DOMAIN(2, DACR_DOMAIN_PERM_CLIENT) |
		DACR_DOMAIN(3, DACR_DOMAIN_PERM_NO_ACCESS) |
		DACR_DOMAIN(4, DACR_DOMAIN_PERM_NO_ACCESS) |
		DACR_DOMAIN(ied_num + 2, DACR_DOMAIN_PERM_CLIENT);

	ldr_write_dac(dacr);
}

/**
 * Note that when exiting from the current IED, we should prevent tee from 
 * accessing any other IED to prevent confused deputy attacks.
*/
void ldr_dac_tee_open(void) {
	uint32_t dacr = 0;

	/* get current IED number */
	int ied_num = get_cur_ied_num();

	dacr |= DACR_DOMAIN(0, DACR_DOMAIN_PERM_CLIENT) |
		DACR_DOMAIN(1, DACR_DOMAIN_PERM_CLIENT) |
		DACR_DOMAIN(2, DACR_DOMAIN_PERM_CLIENT) |
		DACR_DOMAIN(3, DACR_DOMAIN_PERM_NO_ACCESS) |
		DACR_DOMAIN(4, DACR_DOMAIN_PERM_NO_ACCESS) |
		DACR_DOMAIN(ied_num + 2, DACR_DOMAIN_PERM_CLIENT);

	/* We cannot invoke any tee function until the next func call. */
	ldr_write_dac(dacr);
}