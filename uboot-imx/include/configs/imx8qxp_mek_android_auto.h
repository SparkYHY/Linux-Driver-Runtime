/*
 * Copyright 2020 NXP
 *
 * SPDX-License-Identifier:	GPL-2.0+
 */

#ifndef IMX8QXP_MEK_ANDROID_AUTO_H
#define IMX8QXP_MEK_ANDROID_AUTO_H

#define CONFIG_USB_GADGET_VBUS_DRAW	2
#define CONFIG_SKIP_RESOURCE_CHECKING

/* USB OTG controller configs */
#ifdef CONFIG_USB_EHCI_HCD
#ifndef CONFIG_MXC_USB_PORTSC
#define CONFIG_MXC_USB_PORTSC		(PORT_PTS_UTMI | PORT_PTS_PTW)
#endif
#endif

#define FSL_FASTBOOT_FB_DEV "mmc"

#undef CONFIG_EXTRA_ENV_SETTINGS
#undef CONFIG_BOOTCOMMAND

#define CONFIG_EXTRA_ENV_SETTINGS					\
	"splashpos=m,m\0"	  \
	"fdt_high=0xffffffffffffffff\0"	  \
	"initrd_high=0xffffffffffffffff\0" \

#ifdef CONFIG_IMX_TRUSTY_OS
#define NS_ARCH_ARM64 1
#define AVB_RPMB
#define KEYSLOT_HWPARTITION_ID	2
#define KEYSLOT_BLKS		0x3FFF

#define BOOTLOADER_RBIDX_OFFSET  0x3FE000
#define BOOTLOADER_RBIDX_START   0x3FF000
#define BOOTLOADER_RBIDX_LEN     0x08
#define BOOTLOADER_RBIDX_INITVAL 0
#define CONFIG_SYS_SPL_PTE_RAM_BASE 0x801F8000
#endif

#endif /* IMX8QXP_MEK_ANDROID_AUTO_H */
