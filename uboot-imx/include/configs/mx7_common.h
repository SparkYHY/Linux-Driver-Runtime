/* SPDX-License-Identifier: GPL-2.0+ */
/*
 * Copyright (C) 2015 Freescale Semiconductor, Inc.
 *
 * Configuration settings for the Freescale i.MX7.
 */

#ifndef __MX7_COMMON_H
#define __MX7_COMMON_H

#include <linux/sizes.h>
#include <linux/stringify.h>
#include <asm/arch/imx-regs.h>
#include <asm/mach-imx/gpio.h>

/* Timer settings */
#define CONFIG_MXC_GPT_HCLK
#define CONFIG_SC_TIMER_CLK 8000000 /* 8Mhz */
#define COUNTER_FREQUENCY CONFIG_SC_TIMER_CLK

#define CONFIG_SYS_BOOTM_LEN	0x1000000

/* Enable iomux-lpsr support */
#define CONFIG_IOMUX_LPSR

/* Miscellaneous configurable options */
#define CONFIG_SYS_CBSIZE		2048
#define CONFIG_SYS_MAXARGS		32
#define CONFIG_SYS_BARGSIZE		CONFIG_SYS_CBSIZE

/* UART */

/* NET PHY */
#define PHY_ANEG_TIMEOUT 20000

#define CONFIG_ARMV7_SECURE_BASE	0x00900000

/*
 * If we have defined the OPTEE ram size and not OPTEE it means that we were
 * launched by OPTEE, because of that we shall skip all the low level
 * initialization since it was already done by ATF or OPTEE
 */

#ifdef CONFIG_IMX_OPTEE
#define TEE_ENV "tee=yes\0"
#else
#define TEE_ENV "tee=no\0"
#endif

#endif
