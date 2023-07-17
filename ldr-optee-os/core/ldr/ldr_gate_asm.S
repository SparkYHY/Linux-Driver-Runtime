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
#include <kernel/cache_helpers.h>

#include <ldr/ldr_gate.h>
#include <ldr/ldr_dac.h>

	.section ".ldr_gate.txt", "ax"

	.global ldr_enter_drv
	.global ldr_exit_drv
	.global ldr_enter_drv_irq_handler
	.global ldr_exit_drv_irq_handler
	.global ldr_gate_hook

/* void ldr_enter_drv(void); */
ldr_enter_drv:
	.fnstart

	push	{r4-r7}
	push	{r0-r3}

	mov	r5, lr		/* save svc_lr */

	mov	r6, sp		/* save svc_sp */
	add	r6, r6, #32	/* adjust svc_sp value */

	bl	get_ldr_dac_ctx
	mov	r7, r0		/* save ldr_dac_ctx ptr */
	pop	{r1-r4}		/* r0-r3 pushed above */
	stm	r0!, {r1-r4}
	pop	{r1-r4}		/* r4-r7 pushed above */
	stm	r0!, {r1-r4}

	add	r0, r0, #4	/* skip ldr_stack */
	stm	r0!, {r6}
	stm	r0!, {r5}

	add	r7, r7, #32
	ldm	r7!, {r0}	/* get ldr stack addr */
	mov	sp, r0		/* switch to ldr stack */

	isb
	dsb

	/* invalidate branch prediction cache */
	write_bpiallis
	isb
	dsb

	bl	get_ldr_dac_ctx
	add	r0, r0, #8	/* skip r0, r1 */
	ldm	r0!, {r2-r3}
	ldm	r0!, {r4-r7}

	add	r0, r0, #8	/* skip ldr_stack, svc_sp */
	ldm	r0!, {lr}	/* get svc_lr */

	push	{lr}

	//bl	set_tee_text_xn
	bl	ldr_dac_tee_close
	isb
	dsb

	pop	{lr}
	bx	lr		/* invoke next ins after prelogue */
	.fnend

/* void ldr_exit_drv(void); */
ldr_exit_drv:
	.fnstart

	push	{r4-r7}
	push	{r0-r3}

	mov	r5, lr		/* save svc_lr */
	push	{r5}

	bl	ldr_dac_tee_open
	//bl	clear_tee_text_xn 
	isb
	dsb

	pop	{r5}

	/* invalidate branch prediction cache */
	write_bpiallis
	isb
	dsb

	bl	get_ldr_dac_ctx
	mov	r7, r0		/* save ldr_dac_ctx ptr */
	pop	{r1-r4}		/* r0-r3 pushed above */
	stm	r0!, {r1-r4}
	pop	{r1-r4}		/* r4-r7 pushed above */
	stm	r0!, {r1-r4}

	add	r0, r0, #8	/* skip ldr_stack, svc_sp */
	stm	r0!, {r5}

	add	r7, r7, #36
	ldm	r7!, {r0}	/* get saved svc_sp */
	mov	sp, r0		/* switch to svc stack */
	isb
	dsb

	bl	get_ldr_dac_ctx
	add	r0, r0, #8	/* skip r0, r1 */
	ldm	r0!, {r2-r3}
	ldm	r0!, {r4-r7}

	add	r0, r0, #8	/* skip ldr_stack, svc_sp */
	ldm	r0!, {lr}	/* get svc_lr */

	bx	lr		/* invoke next ins after prelogue */
	.fnend

/* void ldr_enter_drv_irq_handler(void); */
ldr_enter_drv_irq_handler:
	.fnstart
	push	{r4-r7}
	push	{r0-r3}

	mov	r5, lr		/* save fiq_lr */

	mov	r6, sp		/* save fiq_sp */
	add	r6, r6, #32	/* adjust fiq_sp value */
	isb
	dsb

	bl	get_ldr_dac_ctx
	mov	r7, r0		/* save ldr_dac_ctx ptr */
	pop	{r1-r4}		/* r0-r3 pushed above */
	stm	r0!, {r1-r4}
	pop	{r1-r4}		/* r4-r7 pushed above */
	stm	r0!, {r1-r4}

	add	r0, r0, #4	/* skip ldr_stack */
	stm	r0!, {r6}
	stm	r0!, {r5}

	add	r7, r7, #44
	ldm	r7!, {r0}	/* get ldr fiq stack addr */
	mov	sp, r0		/* switch to ldr fiq stack */
	isb
	dsb

	/* invalidate branch prediction cache */
	write_bpiallis
	isb
	dsb

	bl	get_ldr_dac_ctx
	add	r0, r0, #8	/* skip r0, r1 */
	ldm	r0!, {r2-r3}
	ldm	r0!, {r4-r7}

	add	r0, r0, #8	/* skip ldr_stack, svc_sp */
	ldm	r0!, {lr}	/* get fiq_lr */

	push	{lr}

	//bl	set_tee_text_xn
	bl	ldr_dac_tee_close
	isb
	dsb

	pop	{lr}
	bx	lr		/* invoke next ins after prelogue */
	.fnend

/* void ldr_exit_drv_irq_handler(void); */
ldr_exit_drv_irq_handler:
	.fnstart

	push	{r4-r7}
	push	{r0-r3}

	mov	r5, lr		/* save fiq_lr */
	push	{r5}

	bl	ldr_dac_tee_open
	//bl	clear_tee_text_xn
	isb
	dsb

	pop	{r5}

	/* invalidate branch prediction cache */
	write_bpiallis	
	isb
	dsb

	bl	get_ldr_dac_ctx
	mov	r7, r0		/* save ldr_dac_ctx ptr */
	isb
	dsb
	pop	{r1-r4}		/* r0-r3 pushed above */
	stm	r0!, {r1-r4}
	pop	{r1-r4}		/* r4-r7 pushed above */
	stm	r0!, {r1-r4}

	add	r0, r0, #8	/* skip ldr_fiq_stack, fiq_sp */
	stm	r0!, {r5}

	add	r7, r7, #36
	ldm	r7!, {r0}	/* get saved fiq_sp */
	mov	sp, r0		/* switch to fiq stack */
	isb
	dsb

	bl	get_ldr_dac_ctx
	isb
	dsb
	ldr	r1, [r0, #0]	/* get saved r0 */
	push	{r1}		/* push r0 */
	add	r0, r0, #4	/* skip r0 */
	ldm	r0!, {r1-r3}
	ldm	r0!, {r4-r7}

	add	r0, r0, #8	/* skip ldr_fiq_stack, fiq_sp */
	ldm	r0!, {lr}	/* get fiq_lr */

	pop	{r0}
	isb
	dsb

	bx	lr		/* invoke next ins after prelogue */
	.fnend

/* void ldr_gate_hook(void); */
ldr_gate_hook:
	.fnstart

ldr_gate_hook_entry:
	push	{lr}
	push	{r8-r12}
	push	{r4-r7}
	push	{r0-r3}
	isb
	dsb

	bl	ldr_dac_tee_open
	//bl	clear_tee_text_xn
	isb
	dsb

	bl	get_ldr_gate_ctx
	isb
	dsb
	pop	{r1-r4}		/* r0-r3 pushed above */
	stm	r0!, {r1-r4}
	pop	{r1-r4}		/* r4-r7 pushed above */
	stm	r0!, {r1-r4}
	pop	{r1-r5}		/* r8-r12 pushed above */
	stm	r0!, {r1-r5}
	pop	{r1}		/* lr pushed above */
	stm	r0!, {r1}
	stm	r0!, {sp}	/* drv ctx saved in ldr_gate_ctx */
	isb
	dsb

	bl	ldr_gate_get_callee
	mov	r6, r0
	isb
	dsb

	bl	get_ldr_gate_ctx
	mov	r10, r0		/* save ldr_gate_ctx ptr */
	isb
	dsb

	ldr	r1, [r0, #56]	/* restore sp */
	mov	sp, r1

	push	{r6}		/* push callee addr */

	ldm	r10!, {r0-r9}	/* restore callsite ctx */
	add	r10, r10, #4	/* skip r10 */
	ldm	r10!, {r11-r12}

	pop	{r10}

ldr_gate_hook_func_inv:
	isb
	dsb
	blx	r10
	isb
	dsb

ldr_gate_hook_exit:
	push	{r11-r12}
	push	{r8-r9}
	push	{r4-r7}
	push	{r0-r3}
	isb
	dsb

	bl	get_ldr_gate_ctx
	ldr	r1, [r0, #40]	/* retrieve r10 */
	push	{r1}
	ldr	r1, [r0, #52]	/* retrieve lr */
	push	{r1}

	//bl	set_tee_text_xn
	bl	ldr_dac_tee_close
	isb
	dsb

	/* invalidate branch prediction cache */
	write_bpiallis
	isb
	dsb

	pop	{lr}
	pop	{r10}
	pop	{r0-r3}
	pop	{r4-r7}
	pop	{r8-r9}
	pop	{r11-r12}
	isb
	dsb

	bx	lr
	isb
	dsb
	.fnend

	.global ldr_tlbi_all
	.global ldr_icache_inv_all
	.global ldr_dcache_op_all

ldr_tlbi_all:
	.fnstart
	dsb	ishst		/* Sync with table update */
	write_tlbiallis 	/* Invalidate TLBs */
	dsb	ish		/* Sync with tlb invalidation completion */
	isb			/* Sync execution on tlb update */
	/* invalidate branch prediction cache */
	write_bpiallis
	isb
	dsb
	bx	lr
	.fnend


ldr_icache_inv_all:
	.fnstart
	/* Invalidate Entire Instruction Cache (and branch predictors) */
	write_icialluis

	dsb	ishst	/* ensure that maintenance operations are seen */
	isb		/* by the instructions rigth after the isb */

	bx      lr
	.fnend

	.macro	dcsw_op shift, fw, ls
	read_clidr r2
	ubfx	r3, r2, \shift, \fw
	lsl	r3, r3, \ls
	mov	r1, #0
	b	do_dcsw_op
	.endm

do_dcsw_op:
	.fnstart
	push	{r4-r12,lr}
	adr	r11, dcsw_loop_table	// compute cache op based on the operation type
	add	r6, r11, r0, lsl #3	// cache op is 2x32-bit instructions
loop1:
	add	r10, r1, r1, LSR #1	// Work out 3x current cache level
	mov	r12, r2, LSR r10	// extract cache type bits from clidr
	and	r12, r12, #7   		// mask the bits for current cache only
	cmp	r12, #2			// see what cache we have at this level
	blo	level_done      	// no cache or only instruction cache at this level

	write_csselr r1			// select current cache level in csselr
	isb				// isb to sych the new cssr&csidr
	read_ccsidr r12			// read the new ccsidr
	and	r10, r12, #7   		// extract the length of the cache lines
	add	r10, r10, #4        	// add 4 (r10 = line length offset)
	ubfx	r4, r12, #3, #10	// r4 = maximum way number (right aligned)
	clz	r5, r4            	// r5 = the bit position of the way size increment
	mov	r9, r4			// r9 working copy of the aligned max way number

loop2:
	ubfx	r7, r12, #13, #15	// r7 = max set number (right aligned)

loop3:
	orr	r0, r1, r9, LSL r5	// factor in the way number and cache level into r0
	orr	r0, r0, r7, LSL r10	// factor in the set number

	blx	r6
	subs	r7, r7, #1              // decrement the set number
	bhs	loop3
	subs	r9, r9, #1              // decrement the way number
	bhs	loop2
level_done:
	add	r1, r1, #2		// increment the cache number
	cmp	r3, r1
	dsb	sy			// ensure completion of previous cache maintenance instruction
	bhi	loop1

	mov	r6, #0
	write_csselr r6			//select cache level 0 in csselr
	dsb	sy
	isb
	pop	{r4-r12,pc}

dcsw_loop_table:
	write_dcisw r0
	bx	lr
	write_dccisw r0
	bx	lr
	write_dccsw r0
	bx	lr
	.fnend

ldr_dcache_op_all:
	.fnstart
	dcsw_op #CLIDR_LOC_SHIFT, #CLIDR_FIELD_WIDTH, #CSSELR_LEVEL_SHIFT
	.fnend
