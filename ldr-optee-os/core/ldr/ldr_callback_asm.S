#include <arm32_macros.S>
#include <arm.h>
#include <asm.S>
#include <generated/asm-defines.h>
#include <keep.h>
#include <kernel/asan.h>
#include <kernel/cache_helpers.h>
#include <kernel/unwind.h>
#include <platform_config.h>
#include <sm/optee_smc.h>
#include <sm/teesmc_opteed.h>
#include <sm/teesmc_opteed_macros.h>

#include "ldr_callback.h"
#include <ldr/ldr_gate.h>
#include <ldr/ldr_dac.h>

	.section ".ldr_gate.txt", "ax"

	.global ldr_fiq_callback
	.global ldr_fiq_callback_ret
/*
 * This function is a hook function to the original callback function.
 * Thus, all the original arguments (at most 4) will reside inside r0-r3.
 */
ldr_fiq_callback:
	.fnstart
	/* this function should only be executed inside FIQ mode */
	push	{r12, lr}
	/*
	 * Uses FIQ stack for temporary storage, while storing needed
	 * context in the ldr fiq context struct.
	 */

	mrs	r12, cpsr

	cpsid	aif			/* Disable Async abort, IRQ and FIQ */

	push	{r4-r7}
	push	{r0-r3}
	isb
	dsb

	mov	r5, r12			/* Save CPSR in a preserved register */
	mrs	r6, cpsr		/* Save current CPSR */

	bl	ldr_dac_tee_open
	//bl	clear_tee_text_xn
	isb
	dsb

	bl	get_ldr_fiq_regs	/* Get ldr fiq context regs */	
	mov	r7, r0			/* save the ldr_fiq_regs ptr */

	pop	{r1-r4}			/* r0-r3 pushed above */
	stm	r0!, {r1-r4}
	pop	{r1-r4}			/* r4-r7 pushed above */
	stm	r0!, {r1-r4}
	stm	r0!, {r8-r11}

	pop	{r12, lr}
	stm	r0!, {r12}

	/* all locally pushed regs have already been poped */
	stm	r0!, {sp}

	/* lr should now contain the address of the next instruction
	 * right after the callback callsite (blx r3).
	 */
	stm	r0!, {lr}

	/* we want the cpsr before AIF set */
	stm	r0!, {r5}

	/* get the current FIQ spsr */
	mrs	r1, spsr
	stm	r0!, {r1}
 
	/* get the saved ldr_fiq_regs ptr */
	mov	r0, r7

	/* arrange callback arguments into param buffer */
	bl	ldr_fiq_callback_prepare_args

	/* arrange SMC function id into r0 */
	ldr	r0, =TEESMC_OPTEED_LDR_CALLBACK

	smc	#0
	b	.	/* SMC should not return */
	.fnend

/* Only invoked (return) from sm */
ldr_fiq_callback_ret:
	.fnstart
	.cantunwind

	cpsid	aif			/* Disable Async abort, IRQ and FIQ */

	bl	ldr_fiq_callback_get_ret_value
	/* use the original FIQ sp on LFC callsite */
	push	{r0}

	bl	get_ldr_fiq_regs	/* Get ldr fiq context regs */

	add	r0, r0, #12		/* start from r3 */

	ldm	r0!, {r3}
	ldm	r0!, {r4-r7}
	ldm	r0!, {r8-r11}
	ldm	r0!, {r12}

	add	r0, r0, #4		/* skip sp cause we already push r0 */
	ldr	lr, [r0], #4
	push	{lr}

	push	{r1}
	ldr	r1, [r0], #4		/* saved cpsr */
	msr	cpsr, r1		/* Retore cpsr before hook */
	isb
	dsb

	//bl	set_tee_text_xn
	bl	ldr_dac_tee_close
	isb
	dsb

	pop	{r1}
	pop	{lr}
	pop	{r0}

	bx	lr			/* end of hook, return like a normal */
					/* func invocation */
	.fnend