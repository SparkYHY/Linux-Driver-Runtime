// SPDX-License-Identifier: BSD-2-Clause
/*
 * Copyright (c) 2016-2020, Linaro Limited
 * Copyright (c) 2014, STMicroelectronics International N.V.
 */
#include <arm.h>
#include <arm32.h>
#include <compiler.h>
#include <config.h>
#include <kernel/misc.h>
#include <kernel/thread.h>
#include <kernel/spinlock.h>
#include <platform_config.h>
#include <sm/optee_smc.h>
#include <sm/sm.h>
#include <sm/std_smc.h>
#include <string.h>
#include "sm_private.h"

#include <trace.h>

enum sm_handler_ret __weak sm_platform_handler(struct sm_ctx *ctx __unused)
{
	return SM_HANDLER_PENDING_SMC;
}

static void smc_arch_handler(struct thread_smc_args *args)
{
	uint32_t smc_fid = args->a0;
	uint32_t feature_fid = args->a1;

	switch (smc_fid) {
	case ARM_SMCCC_VERSION:
		args->a0 = SMCCC_V_1_1;
		break;
	case ARM_SMCCC_ARCH_FEATURES:
		switch (feature_fid) {
		case ARM_SMCCC_VERSION:
		case ARM_SMCCC_ARCH_SOC_ID:
			args->a0 = ARM_SMCCC_RET_SUCCESS;
			break;
		default:
			args->a0 = ARM_SMCCC_RET_NOT_SUPPORTED;
			break;
		}
		break;
	case ARM_SMCCC_ARCH_SOC_ID:
		args->a0 = ARM_SMCCC_RET_NOT_SUPPORTED;
		break;
	case ARM_SMCCC_ARCH_WORKAROUND_1:
	case ARM_SMCCC_ARCH_WORKAROUND_2:
		args->a0 = ARM_SMCCC_RET_NOT_REQUIRED;
		break;
	default:
		args->a0 = OPTEE_SMC_RETURN_UNKNOWN_FUNCTION;
		break;
	}
}

uint32_t sm_from_nsec(struct sm_ctx *ctx)
{
	uint32_t *nsec_r0 = (uint32_t *)(&ctx->nsec.r0);
	struct thread_smc_args *args = (struct thread_smc_args *)nsec_r0;

	if (if_lfc_stdcall_on()) {
		// DMSG("STD secure service invocation when LFC.");
		/* switch to SVC mode */
		ctx->sec.mon_spsr &= 0xFFFFFFF0;
		ctx->sec.mon_spsr |= 0x00000003;
		// print_sm_ctx(ctx);
	}

	/*
	 * Check that struct sm_ctx has the different parts properly
	 * aligned since the stack pointer will be updated to point at
	 * different parts of this struct.
	 */
	COMPILE_TIME_ASSERT(!(offsetof(struct sm_ctx, sec.r0) % 8));
	COMPILE_TIME_ASSERT(!(offsetof(struct sm_ctx, nsec.r0) % 8));
	COMPILE_TIME_ASSERT(!(sizeof(struct sm_ctx) % 8));

	/* IMX has its own implementation for sm_platform_handler()
	 * but probably will not be unused by LDR. */
	if (IS_ENABLED(CFG_SM_PLATFORM_HANDLER) &&
	    sm_platform_handler(ctx) == SM_HANDLER_SMC_HANDLED)
		return SM_EXIT_TO_NON_SECURE;

	switch (OPTEE_SMC_OWNER_NUM(args->a0)) {
	case OPTEE_SMC_OWNER_STANDARD:
		if (IS_ENABLED(CFG_PSCI_ARM32)) {
			smc_std_handler(args, &ctx->nsec);
			return SM_EXIT_TO_NON_SECURE;
		}
		break;
	case OPTEE_SMC_OWNER_ARCH:
		/* retrieve some SMCCC metadata */
		smc_arch_handler(args);
		return SM_EXIT_TO_NON_SECURE;
	default:
		break;
	}

	/* All the SMC functions above are provided by SM and does not require
	 * the trusted OS' involvement. */

	/* switch from NW to SW, and let trusted OS handles the sec requests */
	sm_save_unbanked_regs(&ctx->nsec.ub_regs);
	sm_restore_unbanked_regs(&ctx->sec.ub_regs);

	/* r0-r7 are used for smc arg passing, thus does not need saving. */
	memcpy(&ctx->sec.r0, args, sizeof(*args));
	if (OPTEE_SMC_IS_FAST_CALL(ctx->sec.r0))
		ctx->sec.mon_lr = (uint32_t)vector_fast_smc_entry;
	else
		ctx->sec.mon_lr = (uint32_t)vector_std_smc_entry;

	return SM_EXIT_TO_SECURE;
}

// #define SM_LFC_DEBUG 1

/**
 * Considering that every ARM core can handle FIQ interrupts, the fiq
 * rpc callback state has to be involved with a certain core.
*/
struct ldr_fiq_callback_state ldr_fiq_callback_state[CFG_TEE_CORE_NB_CORE];

static struct ldr_fiq_callback_state *get_lfc_state(size_t pos) {
	return &ldr_fiq_callback_state[pos];
}

static int lfc_on_count() {
	int count = 0;
	int i;

	for (i = 0; i < CFG_TEE_CORE_NB_CORE; i++) {
		if (ldr_fiq_callback_state[i].is_lfc_on != 0)
			count++;
	}

	return count;
}

static int lfc_std_on_count() {
	int count = 0;
	int i;

	for (i = 0; i < CFG_TEE_CORE_NB_CORE; i++) {
		if (ldr_fiq_callback_state[i].is_lfc_stdcall_on != 0)
			count++;
	}

	return count;
}

int if_lfc_on(void) {
	unsigned int pos = get_core_pos();

	struct ldr_fiq_callback_state *state;

	state = get_lfc_state(pos);

	/**
	 * LFC is on only when
	 * 1. LFC is on.
	 * 2. LFC stdcall is off.
	*/

	#ifdef SM_LFC_DEBUG
	if (state->is_lfc_on && state->is_lfc_stdcall_on == 0) {
		IMSG("Core %d: LFC is on.\n", pos);
	} else if (state->is_lfc_on && state->is_lfc_stdcall_on == 1) {
		IMSG("Core %d: LFC is temporarily off due to internal "
		     "stdcall.\n", pos);
	} else {
		IMSG("Core %d: LFC is off.\n", pos);
	}
	#endif

	if (state->is_lfc_on && state->is_lfc_stdcall_on == 0) {
		return 1;
	} else {
		return 0;
	}
}

/* mark that fiq callback is in process */
void set_lfc_on(void) {
	#ifdef SM_LFC_DEBUG
	IMSG("inside %s().\n", __func__);
	#endif

	unsigned int pos = get_core_pos();

	struct ldr_fiq_callback_state *state;

	state = get_lfc_state(pos);

	if (state->is_lfc_on) {
		EMSG("ERROR: SW LDR FIQ rpc callback is already on \
			for Core %d.", pos);
		return;
	}

	state->is_lfc_on = 1;
}

/* mark that fiq callback is over */
void set_lfc_off(void) {
	#ifdef SM_LFC_DEBUG
	IMSG("inside %s().\n", __func__);
	#endif

	unsigned int pos = get_core_pos();

	struct ldr_fiq_callback_state *state;

	state = get_lfc_state(pos);

	if (state->is_lfc_on == 0) {
		EMSG("ERROR: SW LDR FIQ rpc callback is already over \
			for Core %d.", pos);
		return;
	}

	state->is_lfc_on = 0;
	state->is_lfc_stdcall_on = 0;
}

int if_lfc_stdcall_on(void) {
	unsigned int pos = get_core_pos();

	struct ldr_fiq_callback_state *state;

	state = get_lfc_state(pos);

	/**
	 * LFC stdcall is on only when
	 * 1. LFC is on.
	 * 2. LFC stdcall is on.
	*/

	if (state->is_lfc_on && state->is_lfc_stdcall_on) {
		return 1;
	} else {
		return 0;
	}
}

/* mark that stdcall during LFC is in process */
void set_lfc_stdcall_on(void) {
	#ifdef SM_LFC_DEBUG
	IMSG("inside %s().\n", __func__);
	#endif

	unsigned int pos = get_core_pos();

	struct ldr_fiq_callback_state *state;

	state = get_lfc_state(pos);

	/**
	 * LFC stdcall can only be turned on when
	 * 1. LFC is on
	 * 2. LFC stdcall is off
	 * cause the LFC stdcall is still part of LFC whose process is
	 * synchronous.
	*/
	if (state->is_lfc_on && state->is_lfc_stdcall_on == 0) {
		state->is_lfc_stdcall_on = 1;
	} else {
		EMSG("ERROR: can not turn on lfc stdcall.");
	}	
}

/* mark that fiq callback is over */
void set_lfc_stdcall_off(void) {
	#ifdef SM_LFC_DEBUG
	IMSG("inside %s().\n", __func__);
	#endif

	unsigned int pos = get_core_pos();

	struct ldr_fiq_callback_state *state;

	state = get_lfc_state(pos);

	/**
	 * LFC stdcall can only be turned off when
	 * 1. LFC is on
	 * 2. LFC stdcall is on.
	*/
	if (state->is_lfc_on && state->is_lfc_stdcall_on) {
		state->is_lfc_stdcall_on = 0;
	} else {
		EMSG("ERROR: can not turn off lfc stdcall.");
	}
}

/* option 2 */
struct sm_ctx lfc_sm_ctx; /* save original sm_ctx */

void set_lfc_sm_nsec_ctx(void *ptr) {
	struct sm_ctx *sm_ctx_ptr = ptr;
	uint32_t nw_lfc_stack;

	#ifdef SM_LFC_DEBUG
	IMSG("inside %s()", __func__);
	#endif

	/* save the original sm nsec ctx */
	memcpy(&lfc_sm_ctx, ptr, sizeof(lfc_sm_ctx));

	/* set LFC NW entry */
	sm_ctx_ptr->nsec.mon_lr = LFC_NW_ENTRY;
	sm_ctx_ptr->nsec.mon_spsr &= 0xFFFFFFF0;
	sm_ctx_ptr->nsec.mon_spsr |= 0x00000003;

	nw_lfc_stack = LFC_NW_STACK_ADDR + LFC_STACK_SIZE;

	// IMSG("usr_sp:      \t0x%08x", sm_ctx_ptr->nsec.ub_regs.usr_sp);
	// IMSG("und_sp:      \t0x%08x", sm_ctx_ptr->nsec.ub_regs.und_sp);
	IMSG("irq_sp:      \t0x%08x", sm_ctx_ptr->nsec.ub_regs.irq_sp);
	IMSG("fiq_sp:      \t0x%08x", sm_ctx_ptr->nsec.ub_regs.fiq_sp);
	IMSG("svc_sp:      \t0x%08x", sm_ctx_ptr->nsec.ub_regs.svc_sp);
	// IMSG("abt_sp:      \t0x%08x", sm_ctx_ptr->nsec.ub_regs.abt_sp);

	/* all nw mode will use lfc stack */
	// sm_ctx_ptr->nsec.ub_regs.usr_sp = nw_lfc_stack;
	// sm_ctx_ptr->nsec.ub_regs.und_sp = nw_lfc_stack;
	sm_ctx_ptr->nsec.ub_regs.irq_sp = nw_lfc_stack;
	sm_ctx_ptr->nsec.ub_regs.fiq_sp = nw_lfc_stack;
	sm_ctx_ptr->nsec.ub_regs.svc_sp = nw_lfc_stack;
	// sm_ctx_ptr->nsec.ub_regs.abt_sp = nw_lfc_stack;
}

extern vaddr_t ldr_get_shm(uint32_t driver_id);
extern void ldr_fiq_callback_ret(void);

void set_lfc_sm_sec_ctx(void *ptr) {
	struct sm_ctx *sm_ctx_ptr = ptr;

	#ifdef SM_LFC_DEBUG
	IMSG("inside %s()", __func__);
	#endif

	/* restore the original sm nsec ctx */
	memcpy(&sm_ctx_ptr->nsec, &lfc_sm_ctx.nsec, sizeof(lfc_sm_ctx.nsec));

	/* restore saved sec ctx */
	sm_restore_unbanked_regs(&sm_ctx_ptr->sec.ub_regs);

	sm_ctx_ptr->sec.mon_lr = ldr_fiq_callback_ret;

	/* retore FIQ mode that the original FIQ handler was in */
	sm_ctx_ptr->sec.mon_spsr &= 0xFFFFFFF0;
	sm_ctx_ptr->sec.mon_spsr |= 0x00000001;
}

extern uint32_t ldr_big_spinlock;
unsigned long flag;

/* ldr big spinlock */
void acquire_ldr_big_spinlock(void) {
	if (if_lfc_stdcall_on() || if_lfc_on()) {
		/* currently, there should be only one core with LFC on */
		if (lfc_on_count() > 1) {
			EMSG("ERROR: only ONE LFC is allowed at the same time.");
			return;
		}

		goto pass;
	}

	// DMSG("acquring ldr big spinlock.");
	cpu_spin_lock(&ldr_big_spinlock);
	// DMSG("acquring ldr big spinlock success.");
pass:
	return;
}

void release_ldr_big_spinlock(void) {
	if (if_lfc_stdcall_on() || if_lfc_on()){
		/* currently, there should be only one core with LFC on */
		if (lfc_on_count() > 1) {
			EMSG("ERROR: only ONE LFC is allowed at the same time.");
			return;
		}

		goto pass;
	}

	// DMSG("releasing ldr big spinlock.");
	cpu_spin_unlock(&ldr_big_spinlock);
	// DMSG("releasing ldr big spinlock success.");

pass:
	return;
}

void print_sm_ctx(void *ptr) {
	struct sm_ctx *sm_ctx_ptr = ptr;

	IMSG("Printing sm ctx ...");

	/* sec_ctx */
	IMSG("SEC CTX");
	IMSG("usr_sp:      \t0x%08x", sm_ctx_ptr->sec.ub_regs.usr_sp);
	IMSG("usr_lr:      \t0x%08x", sm_ctx_ptr->sec.ub_regs.usr_lr);
	IMSG("irq_spsr:    \t0x%08x", sm_ctx_ptr->sec.ub_regs.irq_spsr);
	IMSG("irq_sp:      \t0x%08x", sm_ctx_ptr->sec.ub_regs.irq_sp);
	IMSG("irq_lr:      \t0x%08x", sm_ctx_ptr->sec.ub_regs.irq_lr);
	IMSG("fiq_spsr:    \t0x%08x", sm_ctx_ptr->sec.ub_regs.fiq_spsr);
	IMSG("fiq_sp:      \t0x%08x", sm_ctx_ptr->sec.ub_regs.fiq_sp);
	IMSG("fiq_lr:      \t0x%08x", sm_ctx_ptr->sec.ub_regs.fiq_lr);
	IMSG("svc_spsr:    \t0x%08x", sm_ctx_ptr->sec.ub_regs.svc_spsr);
	IMSG("svc_sp:      \t0x%08x", sm_ctx_ptr->sec.ub_regs.svc_sp);
	IMSG("svc_lr:      \t0x%08x", sm_ctx_ptr->sec.ub_regs.svc_lr);
	IMSG("abt_spsr:    \t0x%08x", sm_ctx_ptr->sec.ub_regs.abt_spsr);
	IMSG("abt_sp:      \t0x%08x", sm_ctx_ptr->sec.ub_regs.abt_sp);
	IMSG("abt_lr:      \t0x%08x", sm_ctx_ptr->sec.ub_regs.abt_lr);
	IMSG("und_spsr:    \t0x%08x", sm_ctx_ptr->sec.ub_regs.und_spsr);
	IMSG("und_sp:      \t0x%08x", sm_ctx_ptr->sec.ub_regs.und_sp);
	IMSG("und_lr:      \t0x%08x", sm_ctx_ptr->sec.ub_regs.und_lr);

	IMSG("r0:          \t0x%08x", sm_ctx_ptr->sec.r0);
	IMSG("r1:          \t0x%08x", sm_ctx_ptr->sec.r1);
	IMSG("r2:          \t0x%08x", sm_ctx_ptr->sec.r2);
	IMSG("r3:          \t0x%08x", sm_ctx_ptr->sec.r3);
	IMSG("r4:          \t0x%08x", sm_ctx_ptr->sec.r4);
	IMSG("r5:          \t0x%08x", sm_ctx_ptr->sec.r5);
	IMSG("r6:          \t0x%08x", sm_ctx_ptr->sec.r6);
	IMSG("r7:          \t0x%08x", sm_ctx_ptr->sec.r7);
	IMSG("mon_lr:      \t0x%08x", sm_ctx_ptr->sec.mon_lr);
	IMSG("mon_spsr:    \t0x%08x", sm_ctx_ptr->sec.mon_spsr);

	IMSG("");

	/* nsec_ctx */
	IMSG("NSEC CTX");
	IMSG("usr_sp:      \t0x%08x", sm_ctx_ptr->nsec.ub_regs.usr_sp);
	IMSG("usr_lr:      \t0x%08x", sm_ctx_ptr->nsec.ub_regs.usr_lr);
	IMSG("irq_spsr:    \t0x%08x", sm_ctx_ptr->nsec.ub_regs.irq_spsr);
	IMSG("irq_sp:      \t0x%08x", sm_ctx_ptr->nsec.ub_regs.irq_sp);
	IMSG("irq_lr:      \t0x%08x", sm_ctx_ptr->nsec.ub_regs.irq_lr);
	IMSG("fiq_spsr:    \t0x%08x", sm_ctx_ptr->nsec.ub_regs.fiq_spsr);
	IMSG("fiq_sp:      \t0x%08x", sm_ctx_ptr->nsec.ub_regs.fiq_sp);
	IMSG("fiq_lr:      \t0x%08x", sm_ctx_ptr->nsec.ub_regs.fiq_lr);
	IMSG("svc_spsr:    \t0x%08x", sm_ctx_ptr->nsec.ub_regs.svc_spsr);
	IMSG("svc_sp:      \t0x%08x", sm_ctx_ptr->nsec.ub_regs.svc_sp);
	IMSG("svc_lr:      \t0x%08x", sm_ctx_ptr->nsec.ub_regs.svc_lr);
	IMSG("abt_spsr:    \t0x%08x", sm_ctx_ptr->nsec.ub_regs.abt_spsr);
	IMSG("abt_sp:      \t0x%08x", sm_ctx_ptr->nsec.ub_regs.abt_sp);
	IMSG("abt_lr:      \t0x%08x", sm_ctx_ptr->nsec.ub_regs.abt_lr);
	IMSG("und_spsr:    \t0x%08x", sm_ctx_ptr->nsec.ub_regs.und_spsr);
	IMSG("und_sp:      \t0x%08x", sm_ctx_ptr->nsec.ub_regs.und_sp);
	IMSG("und_lr:      \t0x%08x", sm_ctx_ptr->nsec.ub_regs.und_lr);

	IMSG("r0:          \t0x%08x", sm_ctx_ptr->nsec.r0);
	IMSG("r1:          \t0x%08x", sm_ctx_ptr->nsec.r1);
	IMSG("r2:          \t0x%08x", sm_ctx_ptr->nsec.r2);
	IMSG("r3:          \t0x%08x", sm_ctx_ptr->nsec.r3);
	IMSG("r4:          \t0x%08x", sm_ctx_ptr->nsec.r4);
	IMSG("r5:          \t0x%08x", sm_ctx_ptr->nsec.r5);
	IMSG("r6:          \t0x%08x", sm_ctx_ptr->nsec.r6);
	IMSG("r7:          \t0x%08x", sm_ctx_ptr->nsec.r7);
	IMSG("r8:          \t0x%08x", sm_ctx_ptr->nsec.r8);
	IMSG("r9:          \t0x%08x", sm_ctx_ptr->nsec.r9);
	IMSG("r10:         \t0x%08x", sm_ctx_ptr->nsec.r10);
	IMSG("r11:         \t0x%08x", sm_ctx_ptr->nsec.r11);
	IMSG("r12:         \t0x%08x", sm_ctx_ptr->nsec.r12);
	IMSG("mon_lr:      \t0x%08x", sm_ctx_ptr->nsec.mon_lr);
	IMSG("mon_spsr:    \t0x%08x", sm_ctx_ptr->nsec.mon_spsr);
}

/*

struct lfc_sm_ret sm_ret_to_nw = {
	.mon_lr = LFC_NW_ENTRY,
	.mon_spsr = 0x00070093,
};

void set_lfc_sm_ret_nw_spsr(uint32_t nw_fiq_cpsr) {
	#ifdef SM_LFC_DEBUG
	IMSG("inside %s().\n", __func__);
	IMSG("nw_fiq_cpsr      \t0x%08x.\n", nw_fiq_cpsr);
	#endif

	sm_ret_to_nw.mon_spsr = nw_fiq_cpsr;
}

struct lfc_sm_ret *get_lfc_sm_ret_nw(void) {
	#ifdef SM_LFC_DEBUG
	IMSG("inside %s().\n", __func__);
	#endif

	if (sm_ret_to_nw.mon_lr == 0) {
		EMSG("ERROR: empty LFC NW target callback address.");
	}

	if (sm_ret_to_nw.mon_spsr == 0) {
		EMSG("ERROR: empty LFC NW cpsr.");
	}

	return &sm_ret_to_nw;
}

struct lfc_sm_ret sm_ret_to_sw = {
	.mon_lr = ldr_fiq_callback_ret,
	.mon_spsr = 0x00,
};

void set_lfc_sm_ret_sw_spsr(uint32_t sw_fiq_cpsr) {
	#ifdef SM_LFC_DEBUG
	IMSG("inside %s().\n", __func__);
	IMSG("sw_fiq_cpsr      \t0x%08x.\n", sw_fiq_cpsr);
	#endif

	sm_ret_to_sw.mon_spsr = sw_fiq_cpsr;
}

struct lfc_sm_ret *get_lfc_sm_ret_sw(void) {
	#ifdef SM_LFC_DEBUG
	DMSG("cpsr:      \t0x%08x.", read_cpsr());
	IMSG("inside %s().\n", __func__);
	#endif

	if (sm_ret_to_sw.mon_lr == 0) {
		EMSG("ERROR: empty LFC SW ldr_fiq_callback_ret() address.");
	}

	if (sm_ret_to_sw.mon_spsr == 0) {
		EMSG("ERROR: empty LFC SW cpsr.");
	}

	return &sm_ret_to_sw;
}

*/