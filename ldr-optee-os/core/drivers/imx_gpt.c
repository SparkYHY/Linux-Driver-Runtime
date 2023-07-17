// SPDX-License-Identifier: BSD-2-Clause
/*
 * (c) 2020 Jorge Ramirez <jorge@foundries.io>, Foundries Ltd.
 */
#include <arm.h>
#include <drivers/imx_i2c.h>
#include <initcall.h>
#include <io.h>
#include <kernel/delay.h>
#include <mm/core_memprot.h>
#include <mm/core_mmu.h>
#include <platform_config.h>
#include <stdlib.h>
#include <trace.h>
#include <util.h>
#include <kernel/export.h>

#include <drivers/imx_gpt.h>
#include <registers/imx6.h>
#include <kernel/cache_helpers.h>

#include <ldr/ldr_dac.h>

#define MXC_HCLK			24000000
#define CONFIG_SYS_HZ			1000

#define GPT_CR			0x00
#define GPT_PRE			0x04
#define GPT_CNT			0x24

register_phys_mem(MEM_AREA_IO_SEC, GPT_BASE, GPT_SIZE);

// #define IMX_GPT_DEBUG

static unsigned long gpt_read(uint32_t reg) {
	vaddr_t gpt_reg_vaddr;

	gpt_reg_vaddr = (vaddr_t)phys_to_virt(GPT_BASE, MEM_AREA_IO_NSEC) + reg;

	#ifdef IMX_GPT_DEBUG
	DMSG("gpt_reg_vaddr: 0x%08x", phys_to_virt(GPT_BASE, MEM_AREA_IO_NSEC));
	#endif

	return io_read32(gpt_reg_vaddr);
}

static void gpt_write(uint32_t reg, uint32_t value) {
	vaddr_t gpt_reg_vaddr; 

	gpt_reg_vaddr = (vaddr_t)phys_to_virt(GPT_BASE, MEM_AREA_IO_NSEC) + reg;

	#ifdef IMX_GPT_DEBUG
	DMSG("gpt_reg_vaddr: 0x%08x", phys_to_virt(GPT_BASE, MEM_AREA_IO_NSEC));
	#endif

	io_write32(gpt_reg_vaddr, value);
}

static unsigned long get_ticks(void) {
	return gpt_read(GPT_CNT);
}

/*
 * This function is derived from PowerPC code (timebase clock frequency).
 * On ARM it returns the number of timer ticks per m-second.
 */
static unsigned long get_tbclk(void) {
	return MXC_HCLK >> 6;
}

static unsigned long tick_to_time(unsigned long tick){
	unsigned long div, second, millis;
	div = get_tbclk();
	second = tick / div;
	millis = (tick % div) / (div / CONFIG_SYS_HZ);
	return second * CONFIG_SYS_HZ + millis;
}

//Returns the number of milliseconds since the epoch 'base'
unsigned long get_timer(unsigned long base) {
	long res;

	res = get_ticks();

	return res;
}
TEE_EXPORT_SYMBOL(get_timer);

static void change_gpt_clock_source(void) {

}

void print_gpt_confs(void) {
	uint32_t conf, pre;

	conf = gpt_read(GPT_CR);
	IMSG("imx gpt CR value: 0x%08x.", conf);

	pre = gpt_read(GPT_PRE);
	IMSG("imx gpt PRE value: 0x%08x.", pre);
}

static void imx_gpt_init(void) {	
	print_gpt_confs();

	#ifdef IMX_GPT_DEBUG
	DMSG("gpt_reg_vaddr: 0x%08x", phys_to_virt(GPT_BASE, MEM_AREA_IO_NSEC));
	#endif
}
driver_init(imx_gpt_init);