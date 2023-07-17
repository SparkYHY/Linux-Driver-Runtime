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

#include <ldr/ldr_dac.h>

	.section ".ldr_gate.txt", "ax"

	.global ldr_write_dac

/* void ldr_write_dac(uint32_t val) */
ldr_write_dac:
	.fnstart
	push	{r0, lr}
	write_dacr r0
	isb
	dsb
	pop	{r0, lr}
	bx	lr
	.fnend