/**
 * LDR FIQ callback
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
#include <kernel/cache_helpers.h>

#include "ldr_callback.h"

uint32_t callback_addr;

struct ldr_fiq_regs ldr_fiq_regs[CFG_TEE_CORE_NB_CORE];;

struct ldr_fiq_regs *get_ldr_fiq_regs(void) {
	unsigned int pos = get_core_pos();

	return &ldr_fiq_regs[pos];
}

void print_ldr_fiq_regs(void) {
	unsigned int pos = get_core_pos();
	IMSG("Print Core %d ldr fig saved regs ...", pos);

	IMSG("r0:          \t0x%08x", ldr_fiq_regs[pos].r0);
	IMSG("r1:          \t0x%08x", ldr_fiq_regs[pos].r1);
	IMSG("r2:          \t0x%08x", ldr_fiq_regs[pos].r2);
	IMSG("r3:          \t0x%08x", ldr_fiq_regs[pos].r3);
	IMSG("r4:          \t0x%08x", ldr_fiq_regs[pos].r4);
	IMSG("r5:          \t0x%08x", ldr_fiq_regs[pos].r5);
	IMSG("r6:          \t0x%08x", ldr_fiq_regs[pos].r6);
	IMSG("r7:          \t0x%08x", ldr_fiq_regs[pos].r7);
	IMSG("r8:          \t0x%08x", ldr_fiq_regs[pos].r8);
	IMSG("r9:          \t0x%08x", ldr_fiq_regs[pos].r9);
	IMSG("r10:         \t0x%08x", ldr_fiq_regs[pos].r10);
	IMSG("r11:         \t0x%08x", ldr_fiq_regs[pos].r11);
	IMSG("r12:         \t0x%08x", ldr_fiq_regs[pos].r12);
	IMSG("sp:          \t0x%08x", ldr_fiq_regs[pos].sp);
	IMSG("lr:          \t0x%08x", ldr_fiq_regs[pos].lr);
	IMSG("cpsr:        \t0x%08x", ldr_fiq_regs[pos].cpsr);
	IMSG("spsr:        \t0x%08x", ldr_fiq_regs[pos].spsr);
}

void print_reg(uint32_t reg) {
	IMSG("reg value: 0x%08x", reg);

	dhex_dump(0, 0, 0, reg, 0x40);
}

/* temp APIs to set and retrieve nw callback addr */

void temp_ldr_set_callback_addr(uint32_t addr) {
	callback_addr = addr;
}
TEE_EXPORT_SYMBOL(temp_ldr_set_callback_addr);

extern void ldr_fiq_callback(void);
TEE_EXPORT_SYMBOL(ldr_fiq_callback);

/*----------------------end/*---------------------*/

void ldr_fiq_callback_prepare_args(void) {
	/**
	 * target linux function address (linux kaddress)
	 * 1st arguement to the target linux function
	 * 2nd arguement to the target linux function
	 * 3rd arguement to the target linux function
	 * 4th arguement to the target linux function
	*/
	struct ldr_fiq_regs *regs = get_ldr_fiq_regs();

	// DMSG("");

	unsigned char *param_buf;
	uint32_t driver_id = ldr_sw_get_cur_driver_id();

	param_buf = ldr_get_shm(driver_id);

	/* clean buffer */
	memset(param_buf, NULL, LDR_FIQ_CALLBACK_BUF_SIZE);

	/* prepare parameter buffer */
	*(uint32_t *)param_buf = callback_addr;
	param_buf += sizeof(callback_addr);

	*(uint32_t *)param_buf = regs->r0;
	param_buf += sizeof(regs->r0);

	*(uint32_t *)param_buf = regs->r1;
	param_buf += sizeof(regs->r1);

	*(uint32_t *)param_buf = regs->r2;
	param_buf += sizeof(regs->r2);

	*(uint32_t *)param_buf = regs->r3;
	param_buf += sizeof(regs->r3);
}

uint32_t ldr_fiq_callback_get_ret_value(void) {
	unsigned char *param_buf;
	uint32_t driver_id = ldr_sw_get_cur_driver_id();

	param_buf = ldr_get_shm(driver_id);

	// DMSG("ldr_fiq_callback ret value: 0x%08x.", *(uint32_t *)param_buf);

	return *(uint32_t *)param_buf;
}