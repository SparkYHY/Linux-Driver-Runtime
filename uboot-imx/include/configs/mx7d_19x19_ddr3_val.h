/*
 * Copyright (C) 2014-2015 Freescale Semiconductor, Inc.
 *
 * Configuration settings for the Freescale i.MX7D 19x19 DDR3 ARM2 board.
 *
 * SPDX-License-Identifier:	GPL-2.0+
 */

#ifndef __MX7D_19X19_DDR3_VAL_CONFIG_H
#define __MX7D_19X19_DDR3_VAL_CONFIG_H

#define CONFIG_SYS_FSL_USDHC_NUM    3
#define CONFIG_MMCROOT			"/dev/mmcblk1p2"  /* USDHC2 */

#define PHYS_SDRAM_SIZE			SZ_1G

#define CONFIG_FEC_MXC
#define CONFIG_FEC_XCV_TYPE             RGMII
#ifdef CONFIG_DM_ETH
#define CONFIG_ETHPRIME                 "eth0"
#else
#define CONFIG_ETHPRIME                 "FEC"
#endif
#define CONFIG_FEC_MXC_PHYADDR          0

#define CONFIG_PHY_ATHEROS

/* ENET2 */
#define IMX_FEC_BASE			ENET2_IPS_BASE_ADDR

#define CONFIG_FEC_MXC_MDIO_BASE	ENET_IPS_BASE_ADDR

#include "mx7d_val.h"

#endif
