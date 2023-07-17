/* SPDX-License-Identifier: GPL-2.0+ */
/*
 * Copyright 2018-2022 NXP
 */

#ifndef __LX2_RDB_H
#define __LX2_RDB_H

#include "lx2160a_common.h"

/* RTC */
#define CONFIG_SYS_RTC_BUS_NUM		4

/* MAC/PHY configuration */
#if defined(CONFIG_FSL_MC_ENET)
#define CONFIG_ETHPRIME		"DPMAC1@xgmii"
#define AQR113C_PHY_ADDR1      0x0
#define AQR113C_PHY_ADDR2      0x08

#define INPHI_PHY_ADDR1		0x0
#ifdef CONFIG_SD_BOOT
#define IN112525_FW_ADDR        0x980000
#else
#define IN112525_FW_ADDR        0x20980000
#endif
#define IN112525_FW_LENGTH      0x40000

#define RGMII_PHY_ADDR1		0x01
#define RGMII_PHY_ADDR2		0x02
#endif

/* EMC2305 */
#define I2C_MUX_CH_EMC2305		0x09
#define I2C_EMC2305_ADDR		0x4D
#define I2C_EMC2305_CMD		0x40
#define I2C_EMC2305_PWM		0x80

/* EEPROM */
#define CONFIG_SYS_I2C_EEPROM_NXID
#define CONFIG_SYS_EEPROM_BUS_NUM	           0

/* Initial environment variables */
#define CONFIG_EXTRA_ENV_SETTINGS		\
	EXTRA_ENV_SETTINGS			\
	"boot_scripts=lx2160ardb_boot.scr\0"	\
	"boot_script_hdr=hdr_lx2160ardb_bs.out\0"	\
	"BOARD=lx2160ardb\0"			\
	"xspi_bootcmd=echo Trying load from flexspi..;"		\
		"sf probe 0:0 && sf read $load_addr "		\
		"$kernel_start $kernel_size ; env exists secureboot &&"	\
		"sf read $kernelheader_addr_r $kernelheader_start "	\
		"$kernelheader_size && esbc_validate ${kernelheader_addr_r}; "\
		" bootm $load_addr#$BOARD\0"			\
	"sd_bootcmd=echo Trying load from sd card..;"		\
		"mmc dev 0; mmcinfo; mmc read $load_addr "			\
		"$kernel_addr_sd $kernel_size_sd ;"		\
		"env exists secureboot && mmc read $kernelheader_addr_r "\
		"$kernelhdr_addr_sd $kernelhdr_size_sd "	\
		" && esbc_validate ${kernelheader_addr_r};"	\
		"bootm $load_addr#$BOARD\0"			\
	"sd2_bootcmd=echo Trying load from emmc card..;"	\
		"mmc dev 1; mmcinfo; mmc read $load_addr "	\
		"$kernel_addr_sd $kernel_size_sd ;"		\
		"env exists secureboot && mmc read $kernelheader_addr_r "\
		"$kernelhdr_addr_sd $kernelhdr_size_sd "	\
		" && esbc_validate ${kernelheader_addr_r};"	\
		"bootm $load_addr#$BOARD\0"

#include <asm/fsl_secure_boot.h>

#endif /* __LX2_RDB_H */
