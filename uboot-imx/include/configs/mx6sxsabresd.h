/* SPDX-License-Identifier: GPL-2.0+ */
/*
 * Copyright 2014 Freescale Semiconductor, Inc.
 * Copyright 2018 NXP
 *
 * Configuration settings for the Freescale i.MX6SX Sabresd board.
 */

#ifndef __CONFIG_H
#define __CONFIG_H

#include <linux/stringify.h>

#include "mx6_common.h"
#include "imx_env.h"

#define CONFIG_DBG_MONITOR

#ifdef CONFIG_SPL
#include "imx6_spl.h"
#endif

#define CONFIG_MXC_UART_BASE		UART1_BASE

#define CONFIG_CMD_READ
#define CONFIG_SERIAL_TAG
#define CONFIG_FASTBOOT_USB_DEV 0

#ifdef CONFIG_IMX_BOOTAUX
/* Set to QSPI2 B flash at default */
#ifdef CONFIG_DM_SPI
#define CONFIG_SYS_AUXCORE_BOOTDATA 0x78000000
#define SF_QSPI2_B_CS_NUM 2
#elif defined(CONFIG_MX6SX_SABRESD_REVA)
#define CONFIG_SYS_AUXCORE_BOOTDATA 0x71000000
#define SF_QSPI2_B_CS_NUM 1
#else
#define CONFIG_SYS_AUXCORE_BOOTDATA 0x72000000
#define SF_QSPI2_B_CS_NUM 1
#endif

/* When using M4 fastup demo, no need these M4 env, since QSPI is used by M4 */
#ifndef CONFIG_SYS_AUXCORE_FASTUP
#define UPDATE_M4_ENV \
	"m4image=m4_qspi.bin\0" \
	"m4_qspi_cs="__stringify(SF_QSPI2_B_CS_NUM)"\0" \
	"loadm4image=fatload mmc ${mmcdev}:${mmcpart} ${loadaddr} ${m4image}\0" \
	"update_m4_from_sd=" \
		"if sf probe 1:${m4_qspi_cs}; then " \
			"if run loadm4image; then " \
				"setexpr fw_sz ${filesize} + 0xffff; " \
				"setexpr fw_sz ${fw_sz} / 0x10000; "	\
				"setexpr fw_sz ${fw_sz} * 0x10000; "	\
				"sf erase 0x0 ${fw_sz}; " \
				"sf write ${loadaddr} 0x0 ${filesize}; " \
			"fi; " \
		"fi\0" \
	"m4boot=sf probe 1:${m4_qspi_cs}; bootaux "__stringify(CONFIG_SYS_AUXCORE_BOOTDATA)"\0"
#else
#define UPDATE_M4_ENV ""
#endif /* CONFIG_SYS_AUXCORE_FASTUP */

#else
#define UPDATE_M4_ENV ""
#endif /* CONFIG_IMX_BOOTAUX */

#define CONFIG_MFG_ENV_SETTINGS \
    CONFIG_MFG_ENV_SETTINGS_DEFAULT \
	"initrd_addr=0x86800000\0" \
	"initrd_high=0xffffffff\0" \
    "emmc_dev=3\0"\
    "sd_dev=3\0" \

#define CONFIG_EXTRA_ENV_SETTINGS \
	CONFIG_MFG_ENV_SETTINGS \
	UPDATE_M4_ENV \
	TEE_ENV \
	"script=boot.scr\0" \
	"image=zImage\0" \
	"console=ttymxc0\0" \
	"fdt_high=0xffffffff\0" \
	"initrd_high=0xffffffff\0" \
	"fdt_file=undefined\0" \
	"fdt_addr=0x83000000\0" \
	"tee_addr=0x84000000\0" \
	"tee_file=uTee-6sxsdb\0" \
	"boot_fdt=try\0" \
	"ip_dyn=yes\0" \
	"splashimage=0x8c000000\0" \
	"mmcdev="__stringify(CONFIG_SYS_MMC_ENV_DEV)"\0" \
	"mmcpart=1\0" \
	"mmcroot=" CONFIG_MMCROOT " rootwait rw\0" \
	"mmcautodetect=yes\0" \
	"mmcargs=setenv bootargs console=${console},${baudrate} " \
		"root=${mmcroot}\0" \
	"loadbootscript=" \
		"fatload mmc ${mmcdev}:${mmcpart} ${loadaddr} ${script};\0" \
	"bootscript=echo Running bootscript from mmc ...; " \
		"source\0" \
	"loadimage=fatload mmc ${mmcdev}:${mmcpart} ${loadaddr} ${image}\0" \
	"loadfdt=fatload mmc ${mmcdev}:${mmcpart} ${fdt_addr} ${fdt_file}\0" \
	"loadtee=fatload mmc ${mmcdev}:${mmcpart} ${tee_addr} ${tee_file}\0" \
	"mmcboot=echo Booting from mmc ...; " \
		"run mmcargs; " \
		"if test ${tee} = yes; then " \
			"run loadfdt; run loadtee; bootm ${tee_addr} - ${fdt_addr}; " \
		"else " \
			"if test ${boot_fdt} = yes || test ${boot_fdt} = try; then " \
				"if run loadfdt; then " \
					"bootz ${loadaddr} - ${fdt_addr}; " \
				"else " \
					"if test ${boot_fdt} = try; then " \
						"bootz; " \
					"else " \
						"echo WARN: Cannot load the DT; " \
					"fi; " \
				"fi; " \
			"else " \
				"bootz; " \
			"fi; " \
		"fi;\0" \
	"netargs=setenv bootargs console=${console},${baudrate} " \
		"root=/dev/nfs " \
	"ip=dhcp nfsroot=${serverip}:${nfsroot},v3,tcp\0" \
		"netboot=echo Booting from net ...; " \
		"run netargs; " \
		"if test ${ip_dyn} = yes; then " \
			"setenv get_cmd dhcp; " \
		"else " \
			"setenv get_cmd tftp; " \
		"fi; " \
		"${get_cmd} ${image}; " \
		"if test ${tee} = yes; then " \
			"${get_cmd} ${tee_addr} ${tee_file}; " \
			"${get_cmd} ${fdt_addr} ${fdt_file}; " \
			"bootm ${tee_addr} - ${fdt_addr}; " \
		"else " \
			"if test ${boot_fdt} = yes || test ${boot_fdt} = try; then " \
				"if ${get_cmd} ${fdt_addr} ${fdt_file}; then " \
					"bootz ${loadaddr} - ${fdt_addr}; " \
				"else " \
					"if test ${boot_fdt} = try; then " \
						"bootz; " \
					"else " \
						"echo WARN: Cannot load the DT; " \
					"fi; " \
				"fi; " \
			"else " \
				"bootz; " \
			"fi;" \
		"fi;\0" \
	"findfdt="\
		"if test $fdt_file = undefined; then " \
			"setenv fdt_file " CONFIG_DEFAULT_DEVICE_TREE ".dtb; " \
		"fi;\0" \

/* Miscellaneous configurable options */

/* Physical Memory Map */
#define PHYS_SDRAM			MMDC0_ARB_BASE_ADDR

#define CONFIG_SYS_SDRAM_BASE		PHYS_SDRAM
#define CONFIG_SYS_INIT_RAM_ADDR	IRAM_BASE_ADDR
#define CONFIG_SYS_INIT_RAM_SIZE	IRAM_SIZE

#define CONFIG_SYS_INIT_SP_OFFSET \
	(CONFIG_SYS_INIT_RAM_SIZE - GENERATED_GBL_DATA_SIZE)
#define CONFIG_SYS_INIT_SP_ADDR \
	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)

/* MMC Configuration */

#define CONFIG_SYS_FSL_ESDHC_ADDR	USDHC4_BASE_ADDR


/* PMIC */
#ifndef CONFIG_DM_PMIC
#define CONFIG_POWER_PFUZE100
#define CONFIG_POWER_PFUZE100_I2C_ADDR	0x08
#endif

/* Network */
#define CONFIG_ETHPRIME                 "eth0"
#define CONFIG_FEC_XCV_TYPE             RGMII

#ifdef CONFIG_CMD_USB
#define CONFIG_EHCI_HCD_INIT_AFTER_RESET
#define CONFIG_MXC_USB_PORTSC  (PORT_PTS_UTMI | PORT_PTS_PTW)
#define CONFIG_MXC_USB_FLAGS   0
#define CONFIG_USB_MAX_CONTROLLER_COUNT 2
#endif

#ifdef CONFIG_CMD_PCI
#define CONFIG_PCI_SCAN_SHOW
#define CONFIG_PCIE_IMX
#endif

#define CONFIG_SYS_FSL_USDHC_NUM	3
#define CONFIG_MMCROOT			"/dev/mmcblk3p2"  /* USDHC4 */
#define CONFIG_SYS_MMC_ENV_DEV		3  /*USDHC4*/

#endif				/* __CONFIG_H */
