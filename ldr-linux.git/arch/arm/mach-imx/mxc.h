/*
 * Copyright 2004-2007, 2010-2015 Freescale Semiconductor, Inc.
 * Copyright (C) 2008 Juergen Beisert (kernel@pengutronix.de)
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 * MA 02110-1301, USA.
 */

#ifndef __ASM_ARCH_MXC_H__
#define __ASM_ARCH_MXC_H__

#include <linux/types.h>

#ifndef __ASM_ARCH_MXC_HARDWARE_H__
#error "Do not include directly."
#endif

#define MXC_CPU_MX1		1
#define MXC_CPU_MX21		21
#define MXC_CPU_MX25		25
#define MXC_CPU_MX27		27
#define MXC_CPU_MX31		31
#define MXC_CPU_MX35		35
#define MXC_CPU_MX51		51
#define MXC_CPU_MX53		53
#define MXC_CPU_IMX6SL		0x60
#define MXC_CPU_IMX6DL		0x61
#define MXC_CPU_IMX6SX		0x62
#define MXC_CPU_IMX6Q		0x63
#define MXC_CPU_IMX6UL		0x64
#define MXC_CPU_IMX6ULL		0x65
#define MXC_CPU_IMX6SLL		0x67
#define MXC_CPU_IMX6ULZ		0x6B
#define MXC_CPU_IMX6ULZL	0x6C	/* Dummy ID */
#define MXC_CPU_IMX7D		0x72
#define MXC_CPU_IMX7ULP		0xff /* TBD */

#define IMX_DDR_TYPE_DDR3		0
#define IMX_DDR_TYPE_LPDDR2		1
#define IMX_DDR_TYPE_LPDDR3		2
#define IMX_MMDC_DDR_TYPE_LPDDR3	3

#define IMX_LPDDR2_1CH_MODE            0
#define IMX_LPDDR2_2CH_MODE            1

#ifndef __ASSEMBLY__
extern unsigned int __mxc_cpu_type;

#ifdef CONFIG_SOC_IMX6SL
static inline bool cpu_is_imx6sl(void)
{
	return __mxc_cpu_type == MXC_CPU_IMX6SL;
}
#else
static inline bool cpu_is_imx6sl(void)
{
	return false;
}
#endif

static inline bool cpu_is_imx6dl(void)
{
	return __mxc_cpu_type == MXC_CPU_IMX6DL;
}

static inline bool cpu_is_imx6sx(void)
{
	return __mxc_cpu_type == MXC_CPU_IMX6SX;
}

static inline bool cpu_is_imx6ul(void)
{
	return __mxc_cpu_type == MXC_CPU_IMX6UL;
}

static inline bool cpu_is_imx6ull(void)
{
	return __mxc_cpu_type == MXC_CPU_IMX6ULL ||
		__mxc_cpu_type == MXC_CPU_IMX6ULZ ||
		__mxc_cpu_type == MXC_CPU_IMX6ULZL;
}

static inline bool cpu_is_imx6sll(void)
{
	return __mxc_cpu_type == MXC_CPU_IMX6SLL;
}

static inline bool cpu_is_imx6q(void)
{
	return __mxc_cpu_type == MXC_CPU_IMX6Q;
}

static inline bool cpu_is_imx6(void)
{
	return __mxc_cpu_type == MXC_CPU_IMX6Q ||
		__mxc_cpu_type == MXC_CPU_IMX6DL ||
		__mxc_cpu_type == MXC_CPU_IMX6SL ||
		__mxc_cpu_type == MXC_CPU_IMX6SX ||
		__mxc_cpu_type == MXC_CPU_IMX6UL ||
		__mxc_cpu_type == MXC_CPU_IMX6ULL ||
		__mxc_cpu_type == MXC_CPU_IMX6SLL ||
		__mxc_cpu_type == MXC_CPU_IMX6ULZ ||
		__mxc_cpu_type == MXC_CPU_IMX6ULZL;
}

static inline bool cpu_is_imx7d(void)
{
	return __mxc_cpu_type == MXC_CPU_IMX7D;
}

static inline bool cpu_is_imx7ulp(void)
{
	return __mxc_cpu_type == MXC_CPU_IMX7ULP;
}

struct cpu_op {
	u32 cpu_rate;
};

int tzic_enable_wake(void);

extern struct cpu_op *(*get_cpu_op)(int *op);
#endif

#define imx_readl	readl_relaxed
#define imx_readw	readw_relaxed
#define imx_writel	writel_relaxed
#define imx_writew	writew_relaxed

#endif /*  __ASM_ARCH_MXC_H__ */
