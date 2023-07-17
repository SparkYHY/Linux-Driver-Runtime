/* SPDX-License-Identifier: GPL-2.0+ */
/*
 * Copyright 2020 NXP
 */

/*!
 * Header file used to configure SoC pad list.
 */

#ifndef SC_PADS_H
#define SC_PADS_H

/* Includes */

/* Defines */

/*!
 * @name Pad Definitions
 */
/*@{*/
#define SC_P_PCIE_CTRL0_PERST_B                  0	/* HSIO.PCIE0.PERST_B, LSIO.GPIO4.IO00, LSIO.GPIO7.IO00 */
#define SC_P_PCIE_CTRL0_CLKREQ_B                 1	/* HSIO.PCIE0.CLKREQ_B, LSIO.GPIO4.IO01, LSIO.GPIO7.IO01 */
#define SC_P_PCIE_CTRL0_WAKE_B                   2	/* HSIO.PCIE0.WAKE_B, LSIO.GPIO4.IO02, LSIO.GPIO7.IO02 */
#define SC_P_COMP_CTL_GPIO_1V8_3V3_PCIESEP       3	/*  */
#define SC_P_USB_SS3_TC0                         4	/* ADMA.I2C1.SCL, CONN.USB_OTG1.PWR, CONN.USB_OTG2.PWR, LSIO.GPIO4.IO03, LSIO.GPIO7.IO03 */
#define SC_P_USB_SS3_TC1                         5	/* ADMA.I2C1.SCL, CONN.USB_OTG2.PWR, LSIO.GPIO4.IO04, LSIO.GPIO7.IO04 */
#define SC_P_USB_SS3_TC2                         6	/* ADMA.I2C1.SDA, CONN.USB_OTG1.OC, CONN.USB_OTG2.OC, LSIO.GPIO4.IO05, LSIO.GPIO7.IO05 */
#define SC_P_USB_SS3_TC3                         7	/* ADMA.I2C1.SDA, CONN.USB_OTG2.OC, LSIO.GPIO4.IO06, LSIO.GPIO7.IO06 */
#define SC_P_COMP_CTL_GPIO_3V3_USB3IO            8	/*  */
#define SC_P_EMMC0_CLK                           9	/* CONN.EMMC0.CLK, CONN.NAND.READY_B, LSIO.GPIO4.IO07 */
#define SC_P_EMMC0_CMD                           10	/* CONN.EMMC0.CMD, CONN.NAND.DQS, LSIO.GPIO4.IO08 */
#define SC_P_EMMC0_DATA0                         11	/* CONN.EMMC0.DATA0, CONN.NAND.DATA00, LSIO.GPIO4.IO09 */
#define SC_P_EMMC0_DATA1                         12	/* CONN.EMMC0.DATA1, CONN.NAND.DATA01, LSIO.GPIO4.IO10 */
#define SC_P_EMMC0_DATA2                         13	/* CONN.EMMC0.DATA2, CONN.NAND.DATA02, LSIO.GPIO4.IO11 */
#define SC_P_EMMC0_DATA3                         14	/* CONN.EMMC0.DATA3, CONN.NAND.DATA03, LSIO.GPIO4.IO12 */
#define SC_P_EMMC0_DATA4                         15	/* CONN.EMMC0.DATA4, CONN.NAND.DATA04, LSIO.GPIO4.IO13 */
#define SC_P_EMMC0_DATA5                         16	/* CONN.EMMC0.DATA5, CONN.NAND.DATA05, LSIO.GPIO4.IO14 */
#define SC_P_EMMC0_DATA6                         17	/* CONN.EMMC0.DATA6, CONN.NAND.DATA06, LSIO.GPIO4.IO15 */
#define SC_P_EMMC0_DATA7                         18	/* CONN.EMMC0.DATA7, CONN.NAND.DATA07, LSIO.GPIO4.IO16 */
#define SC_P_EMMC0_STROBE                        19	/* CONN.EMMC0.STROBE, CONN.NAND.CLE, LSIO.GPIO4.IO17 */
#define SC_P_EMMC0_RESET_B                       20	/* CONN.EMMC0.RESET_B, CONN.NAND.WP_B, LSIO.GPIO4.IO18 */
#define SC_P_COMP_CTL_GPIO_1V8_3V3_SD1FIX0       21	/*  */
#define SC_P_USDHC1_RESET_B                      22	/* CONN.USDHC1.RESET_B, CONN.NAND.RE_N, ADMA.SPI2.SCK, CONN.NAND.WE_B, LSIO.GPIO4.IO19, LSIO.GPIO7.IO08 */
#define SC_P_USDHC1_VSELECT                      23	/* CONN.USDHC1.VSELECT, CONN.NAND.RE_P, ADMA.SPI2.SDO, CONN.NAND.RE_B, LSIO.GPIO4.IO20, LSIO.GPIO7.IO09 */
#define SC_P_CTL_NAND_RE_P_N                     24	/*  */
#define SC_P_USDHC1_WP                           25	/* CONN.USDHC1.WP, CONN.NAND.DQS_N, ADMA.SPI2.SDI, CONN.NAND.ALE, LSIO.GPIO4.IO21, LSIO.GPIO7.IO10 */
#define SC_P_USDHC1_CD_B                         26	/* CONN.USDHC1.CD_B, CONN.NAND.DQS_P, ADMA.SPI2.CS0, CONN.NAND.DQS, LSIO.GPIO4.IO22, LSIO.GPIO7.IO11 */
#define SC_P_CTL_NAND_DQS_P_N                    27	/*  */
#define SC_P_COMP_CTL_GPIO_1V8_3V3_VSELSEP       28	/*  */
#define SC_P_ENET0_RGMII_TXC                     29	/* CONN.ENET0.RGMII_TXC, CONN.ENET0.RCLK50M_OUT, CONN.ENET0.RCLK50M_IN, CONN.NAND.CE1_B, LSIO.GPIO4.IO29, CONN.USDHC2.CLK */
#define SC_P_ENET0_RGMII_TX_CTL                  30	/* CONN.ENET0.RGMII_TX_CTL, CONN.USDHC1.RESET_B, LSIO.GPIO4.IO30, CONN.USDHC2.CMD */
#define SC_P_ENET0_RGMII_TXD0                    31	/* CONN.ENET0.RGMII_TXD0, CONN.USDHC1.VSELECT, LSIO.GPIO4.IO31, CONN.USDHC2.DATA0 */
#define SC_P_ENET0_RGMII_TXD1                    32	/* CONN.ENET0.RGMII_TXD1, CONN.USDHC1.WP, LSIO.GPIO5.IO00, CONN.USDHC2.DATA1 */
#define SC_P_ENET0_RGMII_TXD2                    33	/* CONN.ENET0.RGMII_TXD2, CONN.NAND.CE0_B, CONN.USDHC1.CD_B, LSIO.GPIO5.IO01, CONN.USDHC2.DATA2 */
#define SC_P_ENET0_RGMII_TXD3                    34	/* CONN.ENET0.RGMII_TXD3, CONN.NAND.RE_B, LSIO.GPIO5.IO02, CONN.USDHC2.DATA3 */
#define SC_P_COMP_CTL_GPIO_1V8_3V3_ENET_ENETB0   35	/*  */
#define SC_P_ENET0_RGMII_RXC                     36	/* CONN.ENET0.RGMII_RXC, CONN.NAND.WE_B, CONN.USDHC1.CLK, LSIO.GPIO5.IO03 */
#define SC_P_ENET0_RGMII_RX_CTL                  37	/* CONN.ENET0.RGMII_RX_CTL, CONN.USDHC1.CMD, LSIO.GPIO5.IO04 */
#define SC_P_ENET0_RGMII_RXD0                    38	/* CONN.ENET0.RGMII_RXD0, CONN.USDHC1.DATA0, LSIO.GPIO5.IO05 */
#define SC_P_ENET0_RGMII_RXD1                    39	/* CONN.ENET0.RGMII_RXD1, CONN.USDHC1.DATA1, LSIO.GPIO5.IO06 */
#define SC_P_ENET0_RGMII_RXD2                    40	/* CONN.ENET0.RGMII_RXD2, CONN.ENET0.RMII_RX_ER, CONN.USDHC1.DATA2, LSIO.GPIO5.IO07 */
#define SC_P_ENET0_RGMII_RXD3                    41	/* CONN.ENET0.RGMII_RXD3, CONN.NAND.ALE, CONN.USDHC1.DATA3, LSIO.GPIO5.IO08 */
#define SC_P_COMP_CTL_GPIO_1V8_3V3_ENET_ENETB1   42	/*  */
#define SC_P_ENET0_REFCLK_125M_25M               43	/* CONN.ENET0.REFCLK_125M_25M, CONN.ENET0.PPS, CONN.EQOS.PPS_IN, CONN.EQOS.PPS_OUT, LSIO.GPIO5.IO09 */
#define SC_P_ENET0_MDIO                          44	/* CONN.ENET0.MDIO, ADMA.I2C3.SDA, CONN.EQOS.MDIO, LSIO.GPIO5.IO10, LSIO.GPIO7.IO16 */
#define SC_P_ENET0_MDC                           45	/* CONN.ENET0.MDC, ADMA.I2C3.SCL, CONN.EQOS.MDC, LSIO.GPIO5.IO11, LSIO.GPIO7.IO17 */
#define SC_P_COMP_CTL_GPIO_1V8_3V3_GPIOCT        46	/*  */
#define SC_P_ENET1_RGMII_TXC                     47	/* LSIO.GPIO0.IO00, CONN.EQOS.RCLK50M_OUT, ADMA.LCDIF.D00, CONN.EQOS.RGMII_TXC, CONN.EQOS.RCLK50M_IN */
#define SC_P_ENET1_RGMII_TXD2                    48	/* , ADMA.LCDIF.D01, CONN.EQOS.RGMII_TXD2, LSIO.GPIO0.IO01 */
#define SC_P_ENET1_RGMII_TX_CTL                  49	/* , ADMA.LCDIF.D02, CONN.EQOS.RGMII_TX_CTL, LSIO.GPIO0.IO02 */
#define SC_P_ENET1_RGMII_TXD3                    50	/* , ADMA.LCDIF.D03, CONN.EQOS.RGMII_TXD3, LSIO.GPIO0.IO03 */
#define SC_P_ENET1_RGMII_RXC                     51	/* , ADMA.LCDIF.D04, CONN.EQOS.RGMII_RXC, LSIO.GPIO0.IO04 */
#define SC_P_ENET1_RGMII_RXD3                    52	/* , ADMA.LCDIF.D05, CONN.EQOS.RGMII_RXD3, LSIO.GPIO0.IO05 */
#define SC_P_ENET1_RGMII_RXD2                    53	/* , ADMA.LCDIF.D06, CONN.EQOS.RGMII_RXD2, LSIO.GPIO0.IO06, LSIO.GPIO6.IO00 */
#define SC_P_ENET1_RGMII_RXD1                    54	/* , ADMA.LCDIF.D07, CONN.EQOS.RGMII_RXD1, LSIO.GPIO0.IO07, LSIO.GPIO6.IO01 */
#define SC_P_ENET1_RGMII_TXD0                    55	/* , ADMA.LCDIF.D08, CONN.EQOS.RGMII_TXD0, LSIO.GPIO0.IO08, LSIO.GPIO6.IO02 */
#define SC_P_ENET1_RGMII_TXD1                    56	/* , ADMA.LCDIF.D09, CONN.EQOS.RGMII_TXD1, LSIO.GPIO0.IO09, LSIO.GPIO6.IO03 */
#define SC_P_ENET1_RGMII_RXD0                    57	/* ADMA.SPDIF0.RX, ADMA.MQS.R, ADMA.LCDIF.D10, CONN.EQOS.RGMII_RXD0, LSIO.GPIO0.IO10, LSIO.GPIO6.IO04 */
#define SC_P_ENET1_RGMII_RX_CTL                  58	/* ADMA.SPDIF0.TX, ADMA.MQS.L, ADMA.LCDIF.D11, CONN.EQOS.RGMII_RX_CTL, LSIO.GPIO0.IO11, LSIO.GPIO6.IO05 */
#define SC_P_ENET1_REFCLK_125M_25M               59	/* ADMA.SPDIF0.EXT_CLK, ADMA.LCDIF.D12, CONN.EQOS.REFCLK_125M_25M, LSIO.GPIO0.IO12, LSIO.GPIO6.IO06 */
#define SC_P_COMP_CTL_GPIO_1V8_3V3_GPIORHB       60	/*  */
#define SC_P_SPI3_SCK                            61	/* ADMA.SPI3.SCK, ADMA.LCDIF.D13, LSIO.GPIO0.IO13, ADMA.LCDIF.D00 */
#define SC_P_SPI3_SDO                            62	/* ADMA.SPI3.SDO, ADMA.LCDIF.D14, LSIO.GPIO0.IO14, ADMA.LCDIF.D01 */
#define SC_P_SPI3_SDI                            63	/* ADMA.SPI3.SDI, ADMA.LCDIF.D15, LSIO.GPIO0.IO15, ADMA.LCDIF.D02 */
#define SC_P_SPI3_CS0                            64	/* ADMA.SPI3.CS0, ADMA.ACM.MCLK_OUT1, ADMA.LCDIF.HSYNC, LSIO.GPIO0.IO16, ADMA.LCDIF.CS */
#define SC_P_SPI3_CS1                            65	/* ADMA.SPI3.CS1, ADMA.I2C3.SCL, ADMA.LCDIF.RESET, ADMA.SPI2.CS0, ADMA.LCDIF.D16, ADMA.LCDIF.RD_E */
#define SC_P_MCLK_IN1                            66	/* ADMA.ACM.MCLK_IN1, ADMA.I2C3.SDA, ADMA.LCDIF.EN, ADMA.SPI2.SCK, ADMA.LCDIF.D17, ADMA.LCDIF.D03 */
#define SC_P_MCLK_IN0                            67	/* ADMA.ACM.MCLK_IN0, ADMA.LCDIF.VSYNC, ADMA.SPI2.SDI, LSIO.GPIO0.IO19, ADMA.LCDIF.RS */
#define SC_P_MCLK_OUT0                           68	/* ADMA.ACM.MCLK_OUT0, ADMA.LCDIF.CLK, ADMA.SPI2.SDO, LSIO.GPIO0.IO20, ADMA.LCDIF.WR_RWN */
#define SC_P_UART1_TX                            69	/* ADMA.UART1.TX, LSIO.PWM0.OUT, LSIO.GPT0.CAPTURE, LSIO.GPIO0.IO21, ADMA.LCDIF.D04 */
#define SC_P_UART1_RX                            70	/* ADMA.UART1.RX, LSIO.PWM1.OUT, LSIO.GPT0.COMPARE, LSIO.GPT1.CLK, LSIO.GPIO0.IO22, ADMA.LCDIF.D05 */
#define SC_P_UART1_RTS_B                         71	/* ADMA.UART1.RTS_B, LSIO.PWM2.OUT, ADMA.LCDIF.D16, LSIO.GPT1.CAPTURE, LSIO.GPT0.CLK, ADMA.LCDIF.D06 */
#define SC_P_UART1_CTS_B                         72	/* ADMA.UART1.CTS_B, LSIO.PWM3.OUT, ADMA.LCDIF.D17, LSIO.GPT1.COMPARE, LSIO.GPIO0.IO24, ADMA.LCDIF.D07 */
#define SC_P_COMP_CTL_GPIO_1V8_3V3_GPIORHK       73	/*  */
#define SC_P_SPI0_SCK                            74	/* ADMA.SPI0.SCK, ADMA.SAI0.TXC, M40.I2C0.SCL, M40.GPIO0.IO00, LSIO.GPIO1.IO04, ADMA.LCDIF.D08 */
#define SC_P_SPI0_SDI                            75	/* ADMA.SPI0.SDI, ADMA.SAI0.TXD, M40.TPM0.CH0, M40.GPIO0.IO02, LSIO.GPIO1.IO05, ADMA.LCDIF.D09 */
#define SC_P_SPI0_SDO                            76	/* ADMA.SPI0.SDO, ADMA.SAI0.TXFS, M40.I2C0.SDA, M40.GPIO0.IO01, LSIO.GPIO1.IO06, ADMA.LCDIF.D10 */
#define SC_P_SPI0_CS1                            77	/* ADMA.SPI0.CS1, ADMA.SAI0.RXC, ADMA.SAI1.TXD, ADMA.LCD_PWM0.OUT, LSIO.GPIO1.IO07, ADMA.LCDIF.D11 */
#define SC_P_SPI0_CS0                            78	/* ADMA.SPI0.CS0, ADMA.SAI0.RXD, M40.TPM0.CH1, M40.GPIO0.IO03, LSIO.GPIO1.IO08, ADMA.LCDIF.D12 */
#define SC_P_COMP_CTL_GPIO_1V8_3V3_GPIORHT       79	/*  */
#define SC_P_ADC_IN1                             80	/* ADMA.ADC.IN1, M40.I2C0.SDA, M40.GPIO0.IO01, ADMA.I2C0.SDA, LSIO.GPIO1.IO09, ADMA.LCDIF.D13 */
#define SC_P_ADC_IN0                             81	/* ADMA.ADC.IN0, M40.I2C0.SCL, M40.GPIO0.IO00, ADMA.I2C0.SCL, LSIO.GPIO1.IO10, ADMA.LCDIF.D14 */
#define SC_P_ADC_IN3                             82	/* ADMA.ADC.IN3, M40.UART0.TX, M40.GPIO0.IO03, ADMA.ACM.MCLK_OUT0, LSIO.GPIO1.IO11, ADMA.LCDIF.D15 */
#define SC_P_ADC_IN2                             83	/* ADMA.ADC.IN2, M40.UART0.RX, M40.GPIO0.IO02, ADMA.ACM.MCLK_IN0, LSIO.GPIO1.IO12, ADMA.LCDIF.D16 */
#define SC_P_ADC_IN5                             84	/* ADMA.ADC.IN5, M40.TPM0.CH1, M40.GPIO0.IO05, ADMA.LCDIF.LCDBUSY, LSIO.GPIO1.IO13, ADMA.LCDIF.D17 */
#define SC_P_ADC_IN4                             85	/* ADMA.ADC.IN4, M40.TPM0.CH0, M40.GPIO0.IO04, ADMA.LCDIF.LCDRESET, LSIO.GPIO1.IO14 */
#define SC_P_FLEXCAN0_RX                         86	/* ADMA.FLEXCAN0.RX, ADMA.SAI2.RXC, ADMA.UART0.RTS_B, ADMA.SAI1.TXC, LSIO.GPIO1.IO15, LSIO.GPIO6.IO08 */
#define SC_P_FLEXCAN0_TX                         87	/* ADMA.FLEXCAN0.TX, ADMA.SAI2.RXD, ADMA.UART0.CTS_B, ADMA.SAI1.TXFS, LSIO.GPIO1.IO16, LSIO.GPIO6.IO09 */
#define SC_P_FLEXCAN1_RX                         88	/* ADMA.FLEXCAN1.RX, ADMA.SAI2.RXFS, ADMA.FTM.CH2, ADMA.SAI1.TXD, LSIO.GPIO1.IO17, LSIO.GPIO6.IO10 */
#define SC_P_FLEXCAN1_TX                         89	/* ADMA.FLEXCAN1.TX, ADMA.SAI3.RXC, ADMA.DMA0.REQ_IN0, ADMA.SAI1.RXD, LSIO.GPIO1.IO18, LSIO.GPIO6.IO11 */
#define SC_P_FLEXCAN2_RX                         90	/* ADMA.FLEXCAN2.RX, ADMA.SAI3.RXD, ADMA.UART3.RX, ADMA.SAI1.RXFS, LSIO.GPIO1.IO19, LSIO.GPIO6.IO12 */
#define SC_P_FLEXCAN2_TX                         91	/* ADMA.FLEXCAN2.TX, ADMA.SAI3.RXFS, ADMA.UART3.TX, ADMA.SAI1.RXC, LSIO.GPIO1.IO20, LSIO.GPIO6.IO13 */
#define SC_P_UART0_RX                            92	/* ADMA.UART0.RX, ADMA.MQS.R, ADMA.FLEXCAN0.RX, SCU.UART0.RX, LSIO.GPIO1.IO21, LSIO.GPIO6.IO14 */
#define SC_P_UART0_TX                            93	/* ADMA.UART0.TX, ADMA.MQS.L, ADMA.FLEXCAN0.TX, SCU.UART0.TX, LSIO.GPIO1.IO22, LSIO.GPIO6.IO15 */
#define SC_P_UART2_TX                            94	/* ADMA.UART2.TX, ADMA.FTM.CH1, ADMA.FLEXCAN1.TX, LSIO.GPIO1.IO23, LSIO.GPIO6.IO16 */
#define SC_P_UART2_RX                            95	/* ADMA.UART2.RX, ADMA.FTM.CH0, ADMA.FLEXCAN1.RX, LSIO.GPIO1.IO24, LSIO.GPIO6.IO17 */
#define SC_P_COMP_CTL_GPIO_1V8_3V3_GPIOLH        96	/*  */
#define SC_P_JTAG_TRST_B                         97	/* SCU.JTAG.TRST_B, SCU.WDOG0.WDOG_OUT */
#define SC_P_PMIC_I2C_SCL                        98	/* SCU.PMIC_I2C.SCL, SCU.GPIO0.IOXX_PMIC_A35_ON, LSIO.GPIO2.IO01 */
#define SC_P_PMIC_I2C_SDA                        99	/* SCU.PMIC_I2C.SDA, SCU.GPIO0.IOXX_PMIC_GPU_ON, LSIO.GPIO2.IO02 */
#define SC_P_PMIC_INT_B                          100	/* SCU.DSC.PMIC_INT_B */
#define SC_P_SCU_GPIO0_00                        101	/* SCU.GPIO0.IO00, SCU.UART0.RX, M40.UART0.RX, ADMA.UART3.RX, LSIO.GPIO2.IO03 */
#define SC_P_SCU_GPIO0_01                        102	/* SCU.GPIO0.IO01, SCU.UART0.TX, M40.UART0.TX, ADMA.UART3.TX, SCU.WDOG0.WDOG_OUT */
#define SC_P_SCU_PMIC_STANDBY                    103	/* SCU.DSC.PMIC_STANDBY */
#define SC_P_SCU_BOOT_MODE1                      104	/* SCU.DSC.BOOT_MODE1 */
#define SC_P_SCU_BOOT_MODE0                      105	/* SCU.DSC.BOOT_MODE0 */
#define SC_P_SCU_BOOT_MODE2                      106	/* SCU.DSC.BOOT_MODE2, SCU.DSC.RTC_CLOCK_OUTPUT_32K */
#define SC_P_SNVS_TAMPER_OUT1                    107	/* , LSIO.GPIO2.IO05_IN, LSIO.GPIO6.IO19_IN */
#define SC_P_SNVS_TAMPER_OUT2                    108	/* , LSIO.GPIO2.IO06_IN, LSIO.GPIO6.IO20_IN */
#define SC_P_SNVS_TAMPER_OUT3                    109	/* , ADMA.SAI2.RXC, LSIO.GPIO2.IO07_IN, LSIO.GPIO6.IO21_IN */
#define SC_P_SNVS_TAMPER_OUT4                    110	/* , ADMA.SAI2.RXD, LSIO.GPIO2.IO08_IN, LSIO.GPIO6.IO22_IN */
#define SC_P_SNVS_TAMPER_IN0                     111	/* , ADMA.SAI2.RXFS, LSIO.GPIO2.IO09_IN, LSIO.GPIO6.IO23_IN */
#define SC_P_SNVS_TAMPER_IN1                     112	/* , ADMA.SAI3.RXC, LSIO.GPIO2.IO10_IN, LSIO.GPIO6.IO24_IN */
#define SC_P_SNVS_TAMPER_IN2                     113	/* , ADMA.SAI3.RXD, LSIO.GPIO2.IO11_IN, LSIO.GPIO6.IO25_IN */
#define SC_P_SNVS_TAMPER_IN3                     114	/* , ADMA.SAI3.RXFS, LSIO.GPIO2.IO12_IN, LSIO.GPIO6.IO26_IN */
#define SC_P_SPI1_SCK                            115	/* , ADMA.I2C2.SDA, ADMA.SPI1.SCK, LSIO.GPIO3.IO00 */
#define SC_P_SPI1_SDO                            116	/* , ADMA.I2C2.SCL, ADMA.SPI1.SDO, LSIO.GPIO3.IO01 */
#define SC_P_SPI1_SDI                            117	/* , ADMA.I2C3.SCL, ADMA.SPI1.SDI, LSIO.GPIO3.IO02 */
#define SC_P_SPI1_CS0                            118	/* , ADMA.I2C3.SDA, ADMA.SPI1.CS0, LSIO.GPIO3.IO03 */
#define SC_P_COMP_CTL_GPIO_1V8_3V3_GPIORHD       119	/*  */
#define SC_P_QSPI0A_DATA1                        120	/* LSIO.QSPI0A.DATA1, LSIO.GPIO3.IO10 */
#define SC_P_QSPI0A_DATA0                        121	/* LSIO.QSPI0A.DATA0, LSIO.GPIO3.IO09 */
#define SC_P_QSPI0A_DATA3                        122	/* LSIO.QSPI0A.DATA3, LSIO.GPIO3.IO12 */
#define SC_P_QSPI0A_DATA2                        123	/* LSIO.QSPI0A.DATA2, LSIO.GPIO3.IO11 */
#define SC_P_QSPI0A_SS0_B                        124	/* LSIO.QSPI0A.SS0_B, LSIO.GPIO3.IO14 */
#define SC_P_QSPI0A_DQS                          125	/* LSIO.QSPI0A.DQS, LSIO.GPIO3.IO13 */
#define SC_P_QSPI0A_SCLK                         126	/* LSIO.QSPI0A.SCLK, LSIO.GPIO3.IO16 */
#define SC_P_COMP_CTL_GPIO_1V8_3V3_QSPI0A        127	/*  */
#define SC_P_QSPI0B_SCLK                         128	/* LSIO.QSPI0B.SCLK, LSIO.GPIO3.IO17 */
#define SC_P_QSPI0B_DQS                          129	/* LSIO.QSPI0B.DQS, LSIO.GPIO3.IO22 */
#define SC_P_QSPI0B_DATA1                        130	/* LSIO.QSPI0B.DATA1, LSIO.GPIO3.IO19 */
#define SC_P_QSPI0B_DATA0                        131	/* LSIO.QSPI0B.DATA0, LSIO.GPIO3.IO18 */
#define SC_P_QSPI0B_DATA3                        132	/* LSIO.QSPI0B.DATA3, LSIO.GPIO3.IO21 */
#define SC_P_QSPI0B_DATA2                        133	/* LSIO.QSPI0B.DATA2, LSIO.GPIO3.IO20 */
#define SC_P_QSPI0B_SS0_B                        134	/* LSIO.QSPI0B.SS0_B, LSIO.GPIO3.IO23, LSIO.QSPI0A.SS1_B */
#define SC_P_COMP_CTL_GPIO_1V8_3V3_QSPI0B        135	/*  */
/*@}*/

/*!
 * @name Pad Mux Definitions
 * format: name padid padmux
 */
/*@{*/
#define SC_P_PCIE_CTRL0_PERST_B_HSIO_PCIE0_PERST_B              SC_P_PCIE_CTRL0_PERST_B            0
#define SC_P_PCIE_CTRL0_PERST_B_LSIO_GPIO4_IO00                 SC_P_PCIE_CTRL0_PERST_B            4
#define SC_P_PCIE_CTRL0_PERST_B_LSIO_GPIO7_IO00                 SC_P_PCIE_CTRL0_PERST_B            5
#define SC_P_PCIE_CTRL0_CLKREQ_B_HSIO_PCIE0_CLKREQ_B            SC_P_PCIE_CTRL0_CLKREQ_B           0
#define SC_P_PCIE_CTRL0_CLKREQ_B_LSIO_GPIO4_IO01                SC_P_PCIE_CTRL0_CLKREQ_B           4
#define SC_P_PCIE_CTRL0_CLKREQ_B_LSIO_GPIO7_IO01                SC_P_PCIE_CTRL0_CLKREQ_B           5
#define SC_P_PCIE_CTRL0_WAKE_B_HSIO_PCIE0_WAKE_B                SC_P_PCIE_CTRL0_WAKE_B             0
#define SC_P_PCIE_CTRL0_WAKE_B_LSIO_GPIO4_IO02                  SC_P_PCIE_CTRL0_WAKE_B             4
#define SC_P_PCIE_CTRL0_WAKE_B_LSIO_GPIO7_IO02                  SC_P_PCIE_CTRL0_WAKE_B             5
#define SC_P_USB_SS3_TC0_ADMA_I2C1_SCL                          SC_P_USB_SS3_TC0                   0
#define SC_P_USB_SS3_TC0_CONN_USB_OTG1_PWR                      SC_P_USB_SS3_TC0                   1
#define SC_P_USB_SS3_TC0_CONN_USB_OTG2_PWR                      SC_P_USB_SS3_TC0                   2
#define SC_P_USB_SS3_TC0_LSIO_GPIO4_IO03                        SC_P_USB_SS3_TC0                   4
#define SC_P_USB_SS3_TC0_LSIO_GPIO7_IO03                        SC_P_USB_SS3_TC0                   5
#define SC_P_USB_SS3_TC1_ADMA_I2C1_SCL                          SC_P_USB_SS3_TC1                   0
#define SC_P_USB_SS3_TC1_CONN_USB_OTG2_PWR                      SC_P_USB_SS3_TC1                   1
#define SC_P_USB_SS3_TC1_LSIO_GPIO4_IO04                        SC_P_USB_SS3_TC1                   4
#define SC_P_USB_SS3_TC1_LSIO_GPIO7_IO04                        SC_P_USB_SS3_TC1                   5
#define SC_P_USB_SS3_TC2_ADMA_I2C1_SDA                          SC_P_USB_SS3_TC2                   0
#define SC_P_USB_SS3_TC2_CONN_USB_OTG1_OC                       SC_P_USB_SS3_TC2                   1
#define SC_P_USB_SS3_TC2_CONN_USB_OTG2_OC                       SC_P_USB_SS3_TC2                   2
#define SC_P_USB_SS3_TC2_LSIO_GPIO4_IO05                        SC_P_USB_SS3_TC2                   4
#define SC_P_USB_SS3_TC2_LSIO_GPIO7_IO05                        SC_P_USB_SS3_TC2                   5
#define SC_P_USB_SS3_TC3_ADMA_I2C1_SDA                          SC_P_USB_SS3_TC3                   0
#define SC_P_USB_SS3_TC3_CONN_USB_OTG2_OC                       SC_P_USB_SS3_TC3                   1
#define SC_P_USB_SS3_TC3_LSIO_GPIO4_IO06                        SC_P_USB_SS3_TC3                   4
#define SC_P_USB_SS3_TC3_LSIO_GPIO7_IO06                        SC_P_USB_SS3_TC3                   5
#define SC_P_EMMC0_CLK_CONN_EMMC0_CLK                           SC_P_EMMC0_CLK                     0
#define SC_P_EMMC0_CLK_CONN_NAND_READY_B                        SC_P_EMMC0_CLK                     1
#define SC_P_EMMC0_CLK_LSIO_GPIO4_IO07                          SC_P_EMMC0_CLK                     4
#define SC_P_EMMC0_CMD_CONN_EMMC0_CMD                           SC_P_EMMC0_CMD                     0
#define SC_P_EMMC0_CMD_CONN_NAND_DQS                            SC_P_EMMC0_CMD                     1
#define SC_P_EMMC0_CMD_LSIO_GPIO4_IO08                          SC_P_EMMC0_CMD                     4
#define SC_P_EMMC0_DATA0_CONN_EMMC0_DATA0                       SC_P_EMMC0_DATA0                   0
#define SC_P_EMMC0_DATA0_CONN_NAND_DATA00                       SC_P_EMMC0_DATA0                   1
#define SC_P_EMMC0_DATA0_LSIO_GPIO4_IO09                        SC_P_EMMC0_DATA0                   4
#define SC_P_EMMC0_DATA1_CONN_EMMC0_DATA1                       SC_P_EMMC0_DATA1                   0
#define SC_P_EMMC0_DATA1_CONN_NAND_DATA01                       SC_P_EMMC0_DATA1                   1
#define SC_P_EMMC0_DATA1_LSIO_GPIO4_IO10                        SC_P_EMMC0_DATA1                   4
#define SC_P_EMMC0_DATA2_CONN_EMMC0_DATA2                       SC_P_EMMC0_DATA2                   0
#define SC_P_EMMC0_DATA2_CONN_NAND_DATA02                       SC_P_EMMC0_DATA2                   1
#define SC_P_EMMC0_DATA2_LSIO_GPIO4_IO11                        SC_P_EMMC0_DATA2                   4
#define SC_P_EMMC0_DATA3_CONN_EMMC0_DATA3                       SC_P_EMMC0_DATA3                   0
#define SC_P_EMMC0_DATA3_CONN_NAND_DATA03                       SC_P_EMMC0_DATA3                   1
#define SC_P_EMMC0_DATA3_LSIO_GPIO4_IO12                        SC_P_EMMC0_DATA3                   4
#define SC_P_EMMC0_DATA4_CONN_EMMC0_DATA4                       SC_P_EMMC0_DATA4                   0
#define SC_P_EMMC0_DATA4_CONN_NAND_DATA04                       SC_P_EMMC0_DATA4                   1
#define SC_P_EMMC0_DATA4_LSIO_GPIO4_IO13                        SC_P_EMMC0_DATA4                   4
#define SC_P_EMMC0_DATA5_CONN_EMMC0_DATA5                       SC_P_EMMC0_DATA5                   0
#define SC_P_EMMC0_DATA5_CONN_NAND_DATA05                       SC_P_EMMC0_DATA5                   1
#define SC_P_EMMC0_DATA5_LSIO_GPIO4_IO14                        SC_P_EMMC0_DATA5                   4
#define SC_P_EMMC0_DATA6_CONN_EMMC0_DATA6                       SC_P_EMMC0_DATA6                   0
#define SC_P_EMMC0_DATA6_CONN_NAND_DATA06                       SC_P_EMMC0_DATA6                   1
#define SC_P_EMMC0_DATA6_LSIO_GPIO4_IO15                        SC_P_EMMC0_DATA6                   4
#define SC_P_EMMC0_DATA7_CONN_EMMC0_DATA7                       SC_P_EMMC0_DATA7                   0
#define SC_P_EMMC0_DATA7_CONN_NAND_DATA07                       SC_P_EMMC0_DATA7                   1
#define SC_P_EMMC0_DATA7_LSIO_GPIO4_IO16                        SC_P_EMMC0_DATA7                   4
#define SC_P_EMMC0_STROBE_CONN_EMMC0_STROBE                     SC_P_EMMC0_STROBE                  0
#define SC_P_EMMC0_STROBE_CONN_NAND_CLE                         SC_P_EMMC0_STROBE                  1
#define SC_P_EMMC0_STROBE_LSIO_GPIO4_IO17                       SC_P_EMMC0_STROBE                  4
#define SC_P_EMMC0_RESET_B_CONN_EMMC0_RESET_B                   SC_P_EMMC0_RESET_B                 0
#define SC_P_EMMC0_RESET_B_CONN_NAND_WP_B                       SC_P_EMMC0_RESET_B                 1
#define SC_P_EMMC0_RESET_B_LSIO_GPIO4_IO18                      SC_P_EMMC0_RESET_B                 4
#define SC_P_USDHC1_RESET_B_CONN_USDHC1_RESET_B                 SC_P_USDHC1_RESET_B                0
#define SC_P_USDHC1_RESET_B_CONN_NAND_RE_N                      SC_P_USDHC1_RESET_B                1
#define SC_P_USDHC1_RESET_B_ADMA_SPI2_SCK                       SC_P_USDHC1_RESET_B                2
#define SC_P_USDHC1_RESET_B_CONN_NAND_WE_B                      SC_P_USDHC1_RESET_B                3
#define SC_P_USDHC1_RESET_B_LSIO_GPIO4_IO19                     SC_P_USDHC1_RESET_B                4
#define SC_P_USDHC1_RESET_B_LSIO_GPIO7_IO08                     SC_P_USDHC1_RESET_B                5
#define SC_P_USDHC1_VSELECT_CONN_USDHC1_VSELECT                 SC_P_USDHC1_VSELECT                0
#define SC_P_USDHC1_VSELECT_CONN_NAND_RE_P                      SC_P_USDHC1_VSELECT                1
#define SC_P_USDHC1_VSELECT_ADMA_SPI2_SDO                       SC_P_USDHC1_VSELECT                2
#define SC_P_USDHC1_VSELECT_CONN_NAND_RE_B                      SC_P_USDHC1_VSELECT                3
#define SC_P_USDHC1_VSELECT_LSIO_GPIO4_IO20                     SC_P_USDHC1_VSELECT                4
#define SC_P_USDHC1_VSELECT_LSIO_GPIO7_IO09                     SC_P_USDHC1_VSELECT                5
#define SC_P_USDHC1_WP_CONN_USDHC1_WP                           SC_P_USDHC1_WP                     0
#define SC_P_USDHC1_WP_CONN_NAND_DQS_N                          SC_P_USDHC1_WP                     1
#define SC_P_USDHC1_WP_ADMA_SPI2_SDI                            SC_P_USDHC1_WP                     2
#define SC_P_USDHC1_WP_CONN_NAND_ALE                            SC_P_USDHC1_WP                     3
#define SC_P_USDHC1_WP_LSIO_GPIO4_IO21                          SC_P_USDHC1_WP                     4
#define SC_P_USDHC1_WP_LSIO_GPIO7_IO10                          SC_P_USDHC1_WP                     5
#define SC_P_USDHC1_CD_B_CONN_USDHC1_CD_B                       SC_P_USDHC1_CD_B                   0
#define SC_P_USDHC1_CD_B_CONN_NAND_DQS_P                        SC_P_USDHC1_CD_B                   1
#define SC_P_USDHC1_CD_B_ADMA_SPI2_CS0                          SC_P_USDHC1_CD_B                   2
#define SC_P_USDHC1_CD_B_CONN_NAND_DQS                          SC_P_USDHC1_CD_B                   3
#define SC_P_USDHC1_CD_B_LSIO_GPIO4_IO22                        SC_P_USDHC1_CD_B                   4
#define SC_P_USDHC1_CD_B_LSIO_GPIO7_IO11                        SC_P_USDHC1_CD_B                   5
#define SC_P_ENET0_RGMII_TXC_CONN_ENET0_RGMII_TXC               SC_P_ENET0_RGMII_TXC               0
#define SC_P_ENET0_RGMII_TXC_CONN_ENET0_RCLK50M_OUT             SC_P_ENET0_RGMII_TXC               1
#define SC_P_ENET0_RGMII_TXC_CONN_ENET0_RCLK50M_IN              SC_P_ENET0_RGMII_TXC               2
#define SC_P_ENET0_RGMII_TXC_CONN_NAND_CE1_B                    SC_P_ENET0_RGMII_TXC               3
#define SC_P_ENET0_RGMII_TXC_LSIO_GPIO4_IO29                    SC_P_ENET0_RGMII_TXC               4
#define SC_P_ENET0_RGMII_TXC_CONN_USDHC2_CLK                    SC_P_ENET0_RGMII_TXC               5
#define SC_P_ENET0_RGMII_TX_CTL_CONN_ENET0_RGMII_TX_CTL         SC_P_ENET0_RGMII_TX_CTL            0
#define SC_P_ENET0_RGMII_TX_CTL_CONN_USDHC1_RESET_B             SC_P_ENET0_RGMII_TX_CTL            3
#define SC_P_ENET0_RGMII_TX_CTL_LSIO_GPIO4_IO30                 SC_P_ENET0_RGMII_TX_CTL            4
#define SC_P_ENET0_RGMII_TX_CTL_CONN_USDHC2_CMD                 SC_P_ENET0_RGMII_TX_CTL            5
#define SC_P_ENET0_RGMII_TXD0_CONN_ENET0_RGMII_TXD0             SC_P_ENET0_RGMII_TXD0              0
#define SC_P_ENET0_RGMII_TXD0_CONN_USDHC1_VSELECT               SC_P_ENET0_RGMII_TXD0              3
#define SC_P_ENET0_RGMII_TXD0_LSIO_GPIO4_IO31                   SC_P_ENET0_RGMII_TXD0              4
#define SC_P_ENET0_RGMII_TXD0_CONN_USDHC2_DATA0                 SC_P_ENET0_RGMII_TXD0              5
#define SC_P_ENET0_RGMII_TXD1_CONN_ENET0_RGMII_TXD1             SC_P_ENET0_RGMII_TXD1              0
#define SC_P_ENET0_RGMII_TXD1_CONN_USDHC1_WP                    SC_P_ENET0_RGMII_TXD1              3
#define SC_P_ENET0_RGMII_TXD1_LSIO_GPIO5_IO00                   SC_P_ENET0_RGMII_TXD1              4
#define SC_P_ENET0_RGMII_TXD1_CONN_USDHC2_DATA1                 SC_P_ENET0_RGMII_TXD1              5
#define SC_P_ENET0_RGMII_TXD2_CONN_ENET0_RGMII_TXD2             SC_P_ENET0_RGMII_TXD2              0
#define SC_P_ENET0_RGMII_TXD2_CONN_NAND_CE0_B                   SC_P_ENET0_RGMII_TXD2              2
#define SC_P_ENET0_RGMII_TXD2_CONN_USDHC1_CD_B                  SC_P_ENET0_RGMII_TXD2              3
#define SC_P_ENET0_RGMII_TXD2_LSIO_GPIO5_IO01                   SC_P_ENET0_RGMII_TXD2              4
#define SC_P_ENET0_RGMII_TXD2_CONN_USDHC2_DATA2                 SC_P_ENET0_RGMII_TXD2              5
#define SC_P_ENET0_RGMII_TXD3_CONN_ENET0_RGMII_TXD3             SC_P_ENET0_RGMII_TXD3              0
#define SC_P_ENET0_RGMII_TXD3_CONN_NAND_RE_B                    SC_P_ENET0_RGMII_TXD3              2
#define SC_P_ENET0_RGMII_TXD3_LSIO_GPIO5_IO02                   SC_P_ENET0_RGMII_TXD3              4
#define SC_P_ENET0_RGMII_TXD3_CONN_USDHC2_DATA3                 SC_P_ENET0_RGMII_TXD3              5
#define SC_P_ENET0_RGMII_RXC_CONN_ENET0_RGMII_RXC               SC_P_ENET0_RGMII_RXC               0
#define SC_P_ENET0_RGMII_RXC_CONN_NAND_WE_B                     SC_P_ENET0_RGMII_RXC               2
#define SC_P_ENET0_RGMII_RXC_CONN_USDHC1_CLK                    SC_P_ENET0_RGMII_RXC               3
#define SC_P_ENET0_RGMII_RXC_LSIO_GPIO5_IO03                    SC_P_ENET0_RGMII_RXC               4
#define SC_P_ENET0_RGMII_RX_CTL_CONN_ENET0_RGMII_RX_CTL         SC_P_ENET0_RGMII_RX_CTL            0
#define SC_P_ENET0_RGMII_RX_CTL_CONN_USDHC1_CMD                 SC_P_ENET0_RGMII_RX_CTL            3
#define SC_P_ENET0_RGMII_RX_CTL_LSIO_GPIO5_IO04                 SC_P_ENET0_RGMII_RX_CTL            4
#define SC_P_ENET0_RGMII_RXD0_CONN_ENET0_RGMII_RXD0             SC_P_ENET0_RGMII_RXD0              0
#define SC_P_ENET0_RGMII_RXD0_CONN_USDHC1_DATA0                 SC_P_ENET0_RGMII_RXD0              3
#define SC_P_ENET0_RGMII_RXD0_LSIO_GPIO5_IO05                   SC_P_ENET0_RGMII_RXD0              4
#define SC_P_ENET0_RGMII_RXD1_CONN_ENET0_RGMII_RXD1             SC_P_ENET0_RGMII_RXD1              0
#define SC_P_ENET0_RGMII_RXD1_CONN_USDHC1_DATA1                 SC_P_ENET0_RGMII_RXD1              3
#define SC_P_ENET0_RGMII_RXD1_LSIO_GPIO5_IO06                   SC_P_ENET0_RGMII_RXD1              4
#define SC_P_ENET0_RGMII_RXD2_CONN_ENET0_RGMII_RXD2             SC_P_ENET0_RGMII_RXD2              0
#define SC_P_ENET0_RGMII_RXD2_CONN_ENET0_RMII_RX_ER             SC_P_ENET0_RGMII_RXD2              1
#define SC_P_ENET0_RGMII_RXD2_CONN_USDHC1_DATA2                 SC_P_ENET0_RGMII_RXD2              3
#define SC_P_ENET0_RGMII_RXD2_LSIO_GPIO5_IO07                   SC_P_ENET0_RGMII_RXD2              4
#define SC_P_ENET0_RGMII_RXD3_CONN_ENET0_RGMII_RXD3             SC_P_ENET0_RGMII_RXD3              0
#define SC_P_ENET0_RGMII_RXD3_CONN_NAND_ALE                     SC_P_ENET0_RGMII_RXD3              2
#define SC_P_ENET0_RGMII_RXD3_CONN_USDHC1_DATA3                 SC_P_ENET0_RGMII_RXD3              3
#define SC_P_ENET0_RGMII_RXD3_LSIO_GPIO5_IO08                   SC_P_ENET0_RGMII_RXD3              4
#define SC_P_ENET0_REFCLK_125M_25M_CONN_ENET0_REFCLK_125M_25M   SC_P_ENET0_REFCLK_125M_25M         0
#define SC_P_ENET0_REFCLK_125M_25M_CONN_ENET0_PPS               SC_P_ENET0_REFCLK_125M_25M         1
#define SC_P_ENET0_REFCLK_125M_25M_CONN_EQOS_PPS_IN             SC_P_ENET0_REFCLK_125M_25M         2
#define SC_P_ENET0_REFCLK_125M_25M_CONN_EQOS_PPS_OUT            SC_P_ENET0_REFCLK_125M_25M         3
#define SC_P_ENET0_REFCLK_125M_25M_LSIO_GPIO5_IO09              SC_P_ENET0_REFCLK_125M_25M         4
#define SC_P_ENET0_MDIO_CONN_ENET0_MDIO                         SC_P_ENET0_MDIO                    0
#define SC_P_ENET0_MDIO_ADMA_I2C3_SDA                           SC_P_ENET0_MDIO                    1
#define SC_P_ENET0_MDIO_CONN_EQOS_MDIO                          SC_P_ENET0_MDIO                    2
#define SC_P_ENET0_MDIO_LSIO_GPIO5_IO10                         SC_P_ENET0_MDIO                    4
#define SC_P_ENET0_MDIO_LSIO_GPIO7_IO16                         SC_P_ENET0_MDIO                    5
#define SC_P_ENET0_MDC_CONN_ENET0_MDC                           SC_P_ENET0_MDC                     0
#define SC_P_ENET0_MDC_ADMA_I2C3_SCL                            SC_P_ENET0_MDC                     1
#define SC_P_ENET0_MDC_CONN_EQOS_MDC                            SC_P_ENET0_MDC                     2
#define SC_P_ENET0_MDC_LSIO_GPIO5_IO11                          SC_P_ENET0_MDC                     4
#define SC_P_ENET0_MDC_LSIO_GPIO7_IO17                          SC_P_ENET0_MDC                     5
#define SC_P_ENET1_RGMII_TXC_LSIO_GPIO0_IO00                    SC_P_ENET1_RGMII_TXC               0
#define SC_P_ENET1_RGMII_TXC_CONN_EQOS_RCLK50M_OUT              SC_P_ENET1_RGMII_TXC               1
#define SC_P_ENET1_RGMII_TXC_ADMA_LCDIF_D00                     SC_P_ENET1_RGMII_TXC               2
#define SC_P_ENET1_RGMII_TXC_CONN_EQOS_RGMII_TXC                SC_P_ENET1_RGMII_TXC               3
#define SC_P_ENET1_RGMII_TXC_CONN_EQOS_RCLK50M_IN               SC_P_ENET1_RGMII_TXC               4
#define SC_P_ENET1_RGMII_TXD2_ADMA_LCDIF_D01                    SC_P_ENET1_RGMII_TXD2              2
#define SC_P_ENET1_RGMII_TXD2_CONN_EQOS_RGMII_TXD2              SC_P_ENET1_RGMII_TXD2              3
#define SC_P_ENET1_RGMII_TXD2_LSIO_GPIO0_IO01                   SC_P_ENET1_RGMII_TXD2              4
#define SC_P_ENET1_RGMII_TX_CTL_ADMA_LCDIF_D02                  SC_P_ENET1_RGMII_TX_CTL            2
#define SC_P_ENET1_RGMII_TX_CTL_CONN_EQOS_RGMII_TX_CTL          SC_P_ENET1_RGMII_TX_CTL            3
#define SC_P_ENET1_RGMII_TX_CTL_LSIO_GPIO0_IO02                 SC_P_ENET1_RGMII_TX_CTL            4
#define SC_P_ENET1_RGMII_TXD3_ADMA_LCDIF_D03                    SC_P_ENET1_RGMII_TXD3              2
#define SC_P_ENET1_RGMII_TXD3_CONN_EQOS_RGMII_TXD3              SC_P_ENET1_RGMII_TXD3              3
#define SC_P_ENET1_RGMII_TXD3_LSIO_GPIO0_IO03                   SC_P_ENET1_RGMII_TXD3              4
#define SC_P_ENET1_RGMII_RXC_ADMA_LCDIF_D04                     SC_P_ENET1_RGMII_RXC               2
#define SC_P_ENET1_RGMII_RXC_CONN_EQOS_RGMII_RXC                SC_P_ENET1_RGMII_RXC               3
#define SC_P_ENET1_RGMII_RXC_LSIO_GPIO0_IO04                    SC_P_ENET1_RGMII_RXC               4
#define SC_P_ENET1_RGMII_RXD3_ADMA_LCDIF_D05                    SC_P_ENET1_RGMII_RXD3              2
#define SC_P_ENET1_RGMII_RXD3_CONN_EQOS_RGMII_RXD3              SC_P_ENET1_RGMII_RXD3              3
#define SC_P_ENET1_RGMII_RXD3_LSIO_GPIO0_IO05                   SC_P_ENET1_RGMII_RXD3              4
#define SC_P_ENET1_RGMII_RXD2_ADMA_LCDIF_D06                    SC_P_ENET1_RGMII_RXD2              2
#define SC_P_ENET1_RGMII_RXD2_CONN_EQOS_RGMII_RXD2              SC_P_ENET1_RGMII_RXD2              3
#define SC_P_ENET1_RGMII_RXD2_LSIO_GPIO0_IO06                   SC_P_ENET1_RGMII_RXD2              4
#define SC_P_ENET1_RGMII_RXD2_LSIO_GPIO6_IO00                   SC_P_ENET1_RGMII_RXD2              5
#define SC_P_ENET1_RGMII_RXD1_ADMA_LCDIF_D07                    SC_P_ENET1_RGMII_RXD1              2
#define SC_P_ENET1_RGMII_RXD1_CONN_EQOS_RGMII_RXD1              SC_P_ENET1_RGMII_RXD1              3
#define SC_P_ENET1_RGMII_RXD1_LSIO_GPIO0_IO07                   SC_P_ENET1_RGMII_RXD1              4
#define SC_P_ENET1_RGMII_RXD1_LSIO_GPIO6_IO01                   SC_P_ENET1_RGMII_RXD1              5
#define SC_P_ENET1_RGMII_TXD0_ADMA_LCDIF_D08                    SC_P_ENET1_RGMII_TXD0              2
#define SC_P_ENET1_RGMII_TXD0_CONN_EQOS_RGMII_TXD0              SC_P_ENET1_RGMII_TXD0              3
#define SC_P_ENET1_RGMII_TXD0_LSIO_GPIO0_IO08                   SC_P_ENET1_RGMII_TXD0              4
#define SC_P_ENET1_RGMII_TXD0_LSIO_GPIO6_IO02                   SC_P_ENET1_RGMII_TXD0              5
#define SC_P_ENET1_RGMII_TXD1_ADMA_LCDIF_D09                    SC_P_ENET1_RGMII_TXD1              2
#define SC_P_ENET1_RGMII_TXD1_CONN_EQOS_RGMII_TXD1              SC_P_ENET1_RGMII_TXD1              3
#define SC_P_ENET1_RGMII_TXD1_LSIO_GPIO0_IO09                   SC_P_ENET1_RGMII_TXD1              4
#define SC_P_ENET1_RGMII_TXD1_LSIO_GPIO6_IO03                   SC_P_ENET1_RGMII_TXD1              5
#define SC_P_ENET1_RGMII_RXD0_ADMA_SPDIF0_RX                    SC_P_ENET1_RGMII_RXD0              0
#define SC_P_ENET1_RGMII_RXD0_ADMA_MQS_R                        SC_P_ENET1_RGMII_RXD0              1
#define SC_P_ENET1_RGMII_RXD0_ADMA_LCDIF_D10                    SC_P_ENET1_RGMII_RXD0              2
#define SC_P_ENET1_RGMII_RXD0_CONN_EQOS_RGMII_RXD0              SC_P_ENET1_RGMII_RXD0              3
#define SC_P_ENET1_RGMII_RXD0_LSIO_GPIO0_IO10                   SC_P_ENET1_RGMII_RXD0              4
#define SC_P_ENET1_RGMII_RXD0_LSIO_GPIO6_IO04                   SC_P_ENET1_RGMII_RXD0              5
#define SC_P_ENET1_RGMII_RX_CTL_ADMA_SPDIF0_TX                  SC_P_ENET1_RGMII_RX_CTL            0
#define SC_P_ENET1_RGMII_RX_CTL_ADMA_MQS_L                      SC_P_ENET1_RGMII_RX_CTL            1
#define SC_P_ENET1_RGMII_RX_CTL_ADMA_LCDIF_D11                  SC_P_ENET1_RGMII_RX_CTL            2
#define SC_P_ENET1_RGMII_RX_CTL_CONN_EQOS_RGMII_RX_CTL          SC_P_ENET1_RGMII_RX_CTL            3
#define SC_P_ENET1_RGMII_RX_CTL_LSIO_GPIO0_IO11                 SC_P_ENET1_RGMII_RX_CTL            4
#define SC_P_ENET1_RGMII_RX_CTL_LSIO_GPIO6_IO05                 SC_P_ENET1_RGMII_RX_CTL            5
#define SC_P_ENET1_REFCLK_125M_25M_ADMA_SPDIF0_EXT_CLK          SC_P_ENET1_REFCLK_125M_25M         0
#define SC_P_ENET1_REFCLK_125M_25M_ADMA_LCDIF_D12               SC_P_ENET1_REFCLK_125M_25M         2
#define SC_P_ENET1_REFCLK_125M_25M_CONN_EQOS_REFCLK_125M_25M    SC_P_ENET1_REFCLK_125M_25M         3
#define SC_P_ENET1_REFCLK_125M_25M_LSIO_GPIO0_IO12              SC_P_ENET1_REFCLK_125M_25M         4
#define SC_P_ENET1_REFCLK_125M_25M_LSIO_GPIO6_IO06              SC_P_ENET1_REFCLK_125M_25M         5
#define SC_P_SPI3_SCK_ADMA_SPI3_SCK                             SC_P_SPI3_SCK                      0
#define SC_P_SPI3_SCK_ADMA_LCDIF_D13                            SC_P_SPI3_SCK                      2
#define SC_P_SPI3_SCK_LSIO_GPIO0_IO13                           SC_P_SPI3_SCK                      4
#define SC_P_SPI3_SCK_ADMA_LCDIF_D00                            SC_P_SPI3_SCK                      5
#define SC_P_SPI3_SDO_ADMA_SPI3_SDO                             SC_P_SPI3_SDO                      0
#define SC_P_SPI3_SDO_ADMA_LCDIF_D14                            SC_P_SPI3_SDO                      2
#define SC_P_SPI3_SDO_LSIO_GPIO0_IO14                           SC_P_SPI3_SDO                      4
#define SC_P_SPI3_SDO_ADMA_LCDIF_D01                            SC_P_SPI3_SDO                      5
#define SC_P_SPI3_SDI_ADMA_SPI3_SDI                             SC_P_SPI3_SDI                      0
#define SC_P_SPI3_SDI_ADMA_LCDIF_D15                            SC_P_SPI3_SDI                      2
#define SC_P_SPI3_SDI_LSIO_GPIO0_IO15                           SC_P_SPI3_SDI                      4
#define SC_P_SPI3_SDI_ADMA_LCDIF_D02                            SC_P_SPI3_SDI                      5
#define SC_P_SPI3_CS0_ADMA_SPI3_CS0                             SC_P_SPI3_CS0                      0
#define SC_P_SPI3_CS0_ADMA_ACM_MCLK_OUT1                        SC_P_SPI3_CS0                      1
#define SC_P_SPI3_CS0_ADMA_LCDIF_HSYNC                          SC_P_SPI3_CS0                      2
#define SC_P_SPI3_CS0_LSIO_GPIO0_IO16                           SC_P_SPI3_CS0                      4
#define SC_P_SPI3_CS0_ADMA_LCDIF_CS                             SC_P_SPI3_CS0                      5
#define SC_P_SPI3_CS1_ADMA_SPI3_CS1                             SC_P_SPI3_CS1                      0
#define SC_P_SPI3_CS1_ADMA_I2C3_SCL                             SC_P_SPI3_CS1                      1
#define SC_P_SPI3_CS1_ADMA_LCDIF_RESET                          SC_P_SPI3_CS1                      2
#define SC_P_SPI3_CS1_ADMA_SPI2_CS0                             SC_P_SPI3_CS1                      3
#define SC_P_SPI3_CS1_ADMA_LCDIF_D16                            SC_P_SPI3_CS1                      4
#define SC_P_SPI3_CS1_ADMA_LCDIF_RD_E                           SC_P_SPI3_CS1                      5
#define SC_P_MCLK_IN1_ADMA_ACM_MCLK_IN1                         SC_P_MCLK_IN1                      0
#define SC_P_MCLK_IN1_ADMA_I2C3_SDA                             SC_P_MCLK_IN1                      1
#define SC_P_MCLK_IN1_ADMA_LCDIF_EN                             SC_P_MCLK_IN1                      2
#define SC_P_MCLK_IN1_ADMA_SPI2_SCK                             SC_P_MCLK_IN1                      3
#define SC_P_MCLK_IN1_ADMA_LCDIF_D17                            SC_P_MCLK_IN1                      4
#define SC_P_MCLK_IN1_ADMA_LCDIF_D03                            SC_P_MCLK_IN1                      5
#define SC_P_MCLK_IN0_ADMA_ACM_MCLK_IN0                         SC_P_MCLK_IN0                      0
#define SC_P_MCLK_IN0_ADMA_LCDIF_VSYNC                          SC_P_MCLK_IN0                      2
#define SC_P_MCLK_IN0_ADMA_SPI2_SDI                             SC_P_MCLK_IN0                      3
#define SC_P_MCLK_IN0_LSIO_GPIO0_IO19                           SC_P_MCLK_IN0                      4
#define SC_P_MCLK_IN0_ADMA_LCDIF_RS                             SC_P_MCLK_IN0                      5
#define SC_P_MCLK_OUT0_ADMA_ACM_MCLK_OUT0                       SC_P_MCLK_OUT0                     0
#define SC_P_MCLK_OUT0_ADMA_LCDIF_CLK                           SC_P_MCLK_OUT0                     2
#define SC_P_MCLK_OUT0_ADMA_SPI2_SDO                            SC_P_MCLK_OUT0                     3
#define SC_P_MCLK_OUT0_LSIO_GPIO0_IO20                          SC_P_MCLK_OUT0                     4
#define SC_P_MCLK_OUT0_ADMA_LCDIF_WR_RWN                        SC_P_MCLK_OUT0                     5
#define SC_P_UART1_TX_ADMA_UART1_TX                             SC_P_UART1_TX                      0
#define SC_P_UART1_TX_LSIO_PWM0_OUT                             SC_P_UART1_TX                      1
#define SC_P_UART1_TX_LSIO_GPT0_CAPTURE                         SC_P_UART1_TX                      2
#define SC_P_UART1_TX_LSIO_GPIO0_IO21                           SC_P_UART1_TX                      4
#define SC_P_UART1_TX_ADMA_LCDIF_D04                            SC_P_UART1_TX                      5
#define SC_P_UART1_RX_ADMA_UART1_RX                             SC_P_UART1_RX                      0
#define SC_P_UART1_RX_LSIO_PWM1_OUT                             SC_P_UART1_RX                      1
#define SC_P_UART1_RX_LSIO_GPT0_COMPARE                         SC_P_UART1_RX                      2
#define SC_P_UART1_RX_LSIO_GPT1_CLK                             SC_P_UART1_RX                      3
#define SC_P_UART1_RX_LSIO_GPIO0_IO22                           SC_P_UART1_RX                      4
#define SC_P_UART1_RX_ADMA_LCDIF_D05                            SC_P_UART1_RX                      5
#define SC_P_UART1_RTS_B_ADMA_UART1_RTS_B                       SC_P_UART1_RTS_B                   0
#define SC_P_UART1_RTS_B_LSIO_PWM2_OUT                          SC_P_UART1_RTS_B                   1
#define SC_P_UART1_RTS_B_ADMA_LCDIF_D16                         SC_P_UART1_RTS_B                   2
#define SC_P_UART1_RTS_B_LSIO_GPT1_CAPTURE                      SC_P_UART1_RTS_B                   3
#define SC_P_UART1_RTS_B_LSIO_GPT0_CLK                          SC_P_UART1_RTS_B                   4
#define SC_P_UART1_RTS_B_ADMA_LCDIF_D06                         SC_P_UART1_RTS_B                   5
#define SC_P_UART1_CTS_B_ADMA_UART1_CTS_B                       SC_P_UART1_CTS_B                   0
#define SC_P_UART1_CTS_B_LSIO_PWM3_OUT                          SC_P_UART1_CTS_B                   1
#define SC_P_UART1_CTS_B_ADMA_LCDIF_D17                         SC_P_UART1_CTS_B                   2
#define SC_P_UART1_CTS_B_LSIO_GPT1_COMPARE                      SC_P_UART1_CTS_B                   3
#define SC_P_UART1_CTS_B_LSIO_GPIO0_IO24                        SC_P_UART1_CTS_B                   4
#define SC_P_UART1_CTS_B_ADMA_LCDIF_D07                         SC_P_UART1_CTS_B                   5
#define SC_P_SPI0_SCK_ADMA_SPI0_SCK                             SC_P_SPI0_SCK                      0
#define SC_P_SPI0_SCK_ADMA_SAI0_TXC                             SC_P_SPI0_SCK                      1
#define SC_P_SPI0_SCK_M40_I2C0_SCL                              SC_P_SPI0_SCK                      2
#define SC_P_SPI0_SCK_M40_GPIO0_IO00                            SC_P_SPI0_SCK                      3
#define SC_P_SPI0_SCK_LSIO_GPIO1_IO04                           SC_P_SPI0_SCK                      4
#define SC_P_SPI0_SCK_ADMA_LCDIF_D08                            SC_P_SPI0_SCK                      5
#define SC_P_SPI0_SDI_ADMA_SPI0_SDI                             SC_P_SPI0_SDI                      0
#define SC_P_SPI0_SDI_ADMA_SAI0_TXD                             SC_P_SPI0_SDI                      1
#define SC_P_SPI0_SDI_M40_TPM0_CH0                              SC_P_SPI0_SDI                      2
#define SC_P_SPI0_SDI_M40_GPIO0_IO02                            SC_P_SPI0_SDI                      3
#define SC_P_SPI0_SDI_LSIO_GPIO1_IO05                           SC_P_SPI0_SDI                      4
#define SC_P_SPI0_SDI_ADMA_LCDIF_D09                            SC_P_SPI0_SDI                      5
#define SC_P_SPI0_SDO_ADMA_SPI0_SDO                             SC_P_SPI0_SDO                      0
#define SC_P_SPI0_SDO_ADMA_SAI0_TXFS                            SC_P_SPI0_SDO                      1
#define SC_P_SPI0_SDO_M40_I2C0_SDA                              SC_P_SPI0_SDO                      2
#define SC_P_SPI0_SDO_M40_GPIO0_IO01                            SC_P_SPI0_SDO                      3
#define SC_P_SPI0_SDO_LSIO_GPIO1_IO06                           SC_P_SPI0_SDO                      4
#define SC_P_SPI0_SDO_ADMA_LCDIF_D10                            SC_P_SPI0_SDO                      5
#define SC_P_SPI0_CS1_ADMA_SPI0_CS1                             SC_P_SPI0_CS1                      0
#define SC_P_SPI0_CS1_ADMA_SAI0_RXC                             SC_P_SPI0_CS1                      1
#define SC_P_SPI0_CS1_ADMA_SAI1_TXD                             SC_P_SPI0_CS1                      2
#define SC_P_SPI0_CS1_ADMA_LCD_PWM0_OUT                         SC_P_SPI0_CS1                      3
#define SC_P_SPI0_CS1_LSIO_GPIO1_IO07                           SC_P_SPI0_CS1                      4
#define SC_P_SPI0_CS1_ADMA_LCDIF_D11                            SC_P_SPI0_CS1                      5
#define SC_P_SPI0_CS0_ADMA_SPI0_CS0                             SC_P_SPI0_CS0                      0
#define SC_P_SPI0_CS0_ADMA_SAI0_RXD                             SC_P_SPI0_CS0                      1
#define SC_P_SPI0_CS0_M40_TPM0_CH1                              SC_P_SPI0_CS0                      2
#define SC_P_SPI0_CS0_M40_GPIO0_IO03                            SC_P_SPI0_CS0                      3
#define SC_P_SPI0_CS0_LSIO_GPIO1_IO08                           SC_P_SPI0_CS0                      4
#define SC_P_SPI0_CS0_ADMA_LCDIF_D12                            SC_P_SPI0_CS0                      5
#define SC_P_ADC_IN1_ADMA_ADC_IN1                               SC_P_ADC_IN1                       0
#define SC_P_ADC_IN1_M40_I2C0_SDA                               SC_P_ADC_IN1                       1
#define SC_P_ADC_IN1_M40_GPIO0_IO01                             SC_P_ADC_IN1                       2
#define SC_P_ADC_IN1_ADMA_I2C0_SDA                              SC_P_ADC_IN1                       3
#define SC_P_ADC_IN1_LSIO_GPIO1_IO09                            SC_P_ADC_IN1                       4
#define SC_P_ADC_IN1_ADMA_LCDIF_D13                             SC_P_ADC_IN1                       5
#define SC_P_ADC_IN0_ADMA_ADC_IN0                               SC_P_ADC_IN0                       0
#define SC_P_ADC_IN0_M40_I2C0_SCL                               SC_P_ADC_IN0                       1
#define SC_P_ADC_IN0_M40_GPIO0_IO00                             SC_P_ADC_IN0                       2
#define SC_P_ADC_IN0_ADMA_I2C0_SCL                              SC_P_ADC_IN0                       3
#define SC_P_ADC_IN0_LSIO_GPIO1_IO10                            SC_P_ADC_IN0                       4
#define SC_P_ADC_IN0_ADMA_LCDIF_D14                             SC_P_ADC_IN0                       5
#define SC_P_ADC_IN3_ADMA_ADC_IN3                               SC_P_ADC_IN3                       0
#define SC_P_ADC_IN3_M40_UART0_TX                               SC_P_ADC_IN3                       1
#define SC_P_ADC_IN3_M40_GPIO0_IO03                             SC_P_ADC_IN3                       2
#define SC_P_ADC_IN3_ADMA_ACM_MCLK_OUT0                         SC_P_ADC_IN3                       3
#define SC_P_ADC_IN3_LSIO_GPIO1_IO11                            SC_P_ADC_IN3                       4
#define SC_P_ADC_IN3_ADMA_LCDIF_D15                             SC_P_ADC_IN3                       5
#define SC_P_ADC_IN2_ADMA_ADC_IN2                               SC_P_ADC_IN2                       0
#define SC_P_ADC_IN2_M40_UART0_RX                               SC_P_ADC_IN2                       1
#define SC_P_ADC_IN2_M40_GPIO0_IO02                             SC_P_ADC_IN2                       2
#define SC_P_ADC_IN2_ADMA_ACM_MCLK_IN0                          SC_P_ADC_IN2                       3
#define SC_P_ADC_IN2_LSIO_GPIO1_IO12                            SC_P_ADC_IN2                       4
#define SC_P_ADC_IN2_ADMA_LCDIF_D16                             SC_P_ADC_IN2                       5
#define SC_P_ADC_IN5_ADMA_ADC_IN5                               SC_P_ADC_IN5                       0
#define SC_P_ADC_IN5_M40_TPM0_CH1                               SC_P_ADC_IN5                       1
#define SC_P_ADC_IN5_M40_GPIO0_IO05                             SC_P_ADC_IN5                       2
#define SC_P_ADC_IN5_ADMA_LCDIF_LCDBUSY                         SC_P_ADC_IN5                       3
#define SC_P_ADC_IN5_LSIO_GPIO1_IO13                            SC_P_ADC_IN5                       4
#define SC_P_ADC_IN5_ADMA_LCDIF_D17                             SC_P_ADC_IN5                       5
#define SC_P_ADC_IN4_ADMA_ADC_IN4                               SC_P_ADC_IN4                       0
#define SC_P_ADC_IN4_M40_TPM0_CH0                               SC_P_ADC_IN4                       1
#define SC_P_ADC_IN4_M40_GPIO0_IO04                             SC_P_ADC_IN4                       2
#define SC_P_ADC_IN4_ADMA_LCDIF_LCDRESET                        SC_P_ADC_IN4                       3
#define SC_P_ADC_IN4_LSIO_GPIO1_IO14                            SC_P_ADC_IN4                       4
#define SC_P_FLEXCAN0_RX_ADMA_FLEXCAN0_RX                       SC_P_FLEXCAN0_RX                   0
#define SC_P_FLEXCAN0_RX_ADMA_SAI2_RXC                          SC_P_FLEXCAN0_RX                   1
#define SC_P_FLEXCAN0_RX_ADMA_UART0_RTS_B                       SC_P_FLEXCAN0_RX                   2
#define SC_P_FLEXCAN0_RX_ADMA_SAI1_TXC                          SC_P_FLEXCAN0_RX                   3
#define SC_P_FLEXCAN0_RX_LSIO_GPIO1_IO15                        SC_P_FLEXCAN0_RX                   4
#define SC_P_FLEXCAN0_RX_LSIO_GPIO6_IO08                        SC_P_FLEXCAN0_RX                   5
#define SC_P_FLEXCAN0_TX_ADMA_FLEXCAN0_TX                       SC_P_FLEXCAN0_TX                   0
#define SC_P_FLEXCAN0_TX_ADMA_SAI2_RXD                          SC_P_FLEXCAN0_TX                   1
#define SC_P_FLEXCAN0_TX_ADMA_UART0_CTS_B                       SC_P_FLEXCAN0_TX                   2
#define SC_P_FLEXCAN0_TX_ADMA_SAI1_TXFS                         SC_P_FLEXCAN0_TX                   3
#define SC_P_FLEXCAN0_TX_LSIO_GPIO1_IO16                        SC_P_FLEXCAN0_TX                   4
#define SC_P_FLEXCAN0_TX_LSIO_GPIO6_IO09                        SC_P_FLEXCAN0_TX                   5
#define SC_P_FLEXCAN1_RX_ADMA_FLEXCAN1_RX                       SC_P_FLEXCAN1_RX                   0
#define SC_P_FLEXCAN1_RX_ADMA_SAI2_RXFS                         SC_P_FLEXCAN1_RX                   1
#define SC_P_FLEXCAN1_RX_ADMA_FTM_CH2                           SC_P_FLEXCAN1_RX                   2
#define SC_P_FLEXCAN1_RX_ADMA_SAI1_TXD                          SC_P_FLEXCAN1_RX                   3
#define SC_P_FLEXCAN1_RX_LSIO_GPIO1_IO17                        SC_P_FLEXCAN1_RX                   4
#define SC_P_FLEXCAN1_RX_LSIO_GPIO6_IO10                        SC_P_FLEXCAN1_RX                   5
#define SC_P_FLEXCAN1_TX_ADMA_FLEXCAN1_TX                       SC_P_FLEXCAN1_TX                   0
#define SC_P_FLEXCAN1_TX_ADMA_SAI3_RXC                          SC_P_FLEXCAN1_TX                   1
#define SC_P_FLEXCAN1_TX_ADMA_DMA0_REQ_IN0                      SC_P_FLEXCAN1_TX                   2
#define SC_P_FLEXCAN1_TX_ADMA_SAI1_RXD                          SC_P_FLEXCAN1_TX                   3
#define SC_P_FLEXCAN1_TX_LSIO_GPIO1_IO18                        SC_P_FLEXCAN1_TX                   4
#define SC_P_FLEXCAN1_TX_LSIO_GPIO6_IO11                        SC_P_FLEXCAN1_TX                   5
#define SC_P_FLEXCAN2_RX_ADMA_FLEXCAN2_RX                       SC_P_FLEXCAN2_RX                   0
#define SC_P_FLEXCAN2_RX_ADMA_SAI3_RXD                          SC_P_FLEXCAN2_RX                   1
#define SC_P_FLEXCAN2_RX_ADMA_UART3_RX                          SC_P_FLEXCAN2_RX                   2
#define SC_P_FLEXCAN2_RX_ADMA_SAI1_RXFS                         SC_P_FLEXCAN2_RX                   3
#define SC_P_FLEXCAN2_RX_LSIO_GPIO1_IO19                        SC_P_FLEXCAN2_RX                   4
#define SC_P_FLEXCAN2_RX_LSIO_GPIO6_IO12                        SC_P_FLEXCAN2_RX                   5
#define SC_P_FLEXCAN2_TX_ADMA_FLEXCAN2_TX                       SC_P_FLEXCAN2_TX                   0
#define SC_P_FLEXCAN2_TX_ADMA_SAI3_RXFS                         SC_P_FLEXCAN2_TX                   1
#define SC_P_FLEXCAN2_TX_ADMA_UART3_TX                          SC_P_FLEXCAN2_TX                   2
#define SC_P_FLEXCAN2_TX_ADMA_SAI1_RXC                          SC_P_FLEXCAN2_TX                   3
#define SC_P_FLEXCAN2_TX_LSIO_GPIO1_IO20                        SC_P_FLEXCAN2_TX                   4
#define SC_P_FLEXCAN2_TX_LSIO_GPIO6_IO13                        SC_P_FLEXCAN2_TX                   5
#define SC_P_UART0_RX_ADMA_UART0_RX                             SC_P_UART0_RX                      0
#define SC_P_UART0_RX_ADMA_MQS_R                                SC_P_UART0_RX                      1
#define SC_P_UART0_RX_ADMA_FLEXCAN0_RX                          SC_P_UART0_RX                      2
#define SC_P_UART0_RX_SCU_UART0_RX                              SC_P_UART0_RX                      3
#define SC_P_UART0_RX_LSIO_GPIO1_IO21                           SC_P_UART0_RX                      4
#define SC_P_UART0_RX_LSIO_GPIO6_IO14                           SC_P_UART0_RX                      5
#define SC_P_UART0_TX_ADMA_UART0_TX                             SC_P_UART0_TX                      0
#define SC_P_UART0_TX_ADMA_MQS_L                                SC_P_UART0_TX                      1
#define SC_P_UART0_TX_ADMA_FLEXCAN0_TX                          SC_P_UART0_TX                      2
#define SC_P_UART0_TX_SCU_UART0_TX                              SC_P_UART0_TX                      3
#define SC_P_UART0_TX_LSIO_GPIO1_IO22                           SC_P_UART0_TX                      4
#define SC_P_UART0_TX_LSIO_GPIO6_IO15                           SC_P_UART0_TX                      5
#define SC_P_UART2_TX_ADMA_UART2_TX                             SC_P_UART2_TX                      0
#define SC_P_UART2_TX_ADMA_FTM_CH1                              SC_P_UART2_TX                      1
#define SC_P_UART2_TX_ADMA_FLEXCAN1_TX                          SC_P_UART2_TX                      2
#define SC_P_UART2_TX_LSIO_GPIO1_IO23                           SC_P_UART2_TX                      4
#define SC_P_UART2_TX_LSIO_GPIO6_IO16                           SC_P_UART2_TX                      5
#define SC_P_UART2_RX_ADMA_UART2_RX                             SC_P_UART2_RX                      0
#define SC_P_UART2_RX_ADMA_FTM_CH0                              SC_P_UART2_RX                      1
#define SC_P_UART2_RX_ADMA_FLEXCAN1_RX                          SC_P_UART2_RX                      2
#define SC_P_UART2_RX_LSIO_GPIO1_IO24                           SC_P_UART2_RX                      4
#define SC_P_UART2_RX_LSIO_GPIO6_IO17                           SC_P_UART2_RX                      5
#define SC_P_JTAG_TRST_B_SCU_JTAG_TRST_B                        SC_P_JTAG_TRST_B                   0
#define SC_P_JTAG_TRST_B_SCU_WDOG0_WDOG_OUT                     SC_P_JTAG_TRST_B                   1
#define SC_P_PMIC_I2C_SCL_SCU_PMIC_I2C_SCL                      SC_P_PMIC_I2C_SCL                  0
#define SC_P_PMIC_I2C_SCL_SCU_GPIO0_IOXX_PMIC_A35_ON            SC_P_PMIC_I2C_SCL                  1
#define SC_P_PMIC_I2C_SCL_LSIO_GPIO2_IO01                       SC_P_PMIC_I2C_SCL                  4
#define SC_P_PMIC_I2C_SDA_SCU_PMIC_I2C_SDA                      SC_P_PMIC_I2C_SDA                  0
#define SC_P_PMIC_I2C_SDA_SCU_GPIO0_IOXX_PMIC_GPU_ON            SC_P_PMIC_I2C_SDA                  1
#define SC_P_PMIC_I2C_SDA_LSIO_GPIO2_IO02                       SC_P_PMIC_I2C_SDA                  4
#define SC_P_PMIC_INT_B_SCU_DSC_PMIC_INT_B                      SC_P_PMIC_INT_B                    0
#define SC_P_SCU_GPIO0_00_SCU_GPIO0_IO00                        SC_P_SCU_GPIO0_00                  0
#define SC_P_SCU_GPIO0_00_SCU_UART0_RX                          SC_P_SCU_GPIO0_00                  1
#define SC_P_SCU_GPIO0_00_M40_UART0_RX                          SC_P_SCU_GPIO0_00                  2
#define SC_P_SCU_GPIO0_00_ADMA_UART3_RX                         SC_P_SCU_GPIO0_00                  3
#define SC_P_SCU_GPIO0_00_LSIO_GPIO2_IO03                       SC_P_SCU_GPIO0_00                  4
#define SC_P_SCU_GPIO0_01_SCU_GPIO0_IO01                        SC_P_SCU_GPIO0_01                  0
#define SC_P_SCU_GPIO0_01_SCU_UART0_TX                          SC_P_SCU_GPIO0_01                  1
#define SC_P_SCU_GPIO0_01_M40_UART0_TX                          SC_P_SCU_GPIO0_01                  2
#define SC_P_SCU_GPIO0_01_ADMA_UART3_TX                         SC_P_SCU_GPIO0_01                  3
#define SC_P_SCU_GPIO0_01_SCU_WDOG0_WDOG_OUT                    SC_P_SCU_GPIO0_01                  4
#define SC_P_SCU_PMIC_STANDBY_SCU_DSC_PMIC_STANDBY              SC_P_SCU_PMIC_STANDBY              0
#define SC_P_SCU_BOOT_MODE1_SCU_DSC_BOOT_MODE1                  SC_P_SCU_BOOT_MODE1                0
#define SC_P_SCU_BOOT_MODE0_SCU_DSC_BOOT_MODE0                  SC_P_SCU_BOOT_MODE0                0
#define SC_P_SCU_BOOT_MODE2_SCU_DSC_BOOT_MODE2                  SC_P_SCU_BOOT_MODE2                0
#define SC_P_SCU_BOOT_MODE2_SCU_DSC_RTC_CLOCK_OUTPUT_32K        SC_P_SCU_BOOT_MODE2                1
#define SC_P_SNVS_TAMPER_OUT1_LSIO_GPIO2_IO05_IN                SC_P_SNVS_TAMPER_OUT1              4
#define SC_P_SNVS_TAMPER_OUT1_LSIO_GPIO6_IO19_IN                SC_P_SNVS_TAMPER_OUT1              5
#define SC_P_SNVS_TAMPER_OUT2_LSIO_GPIO2_IO06_IN                SC_P_SNVS_TAMPER_OUT2              4
#define SC_P_SNVS_TAMPER_OUT2_LSIO_GPIO6_IO20_IN                SC_P_SNVS_TAMPER_OUT2              5
#define SC_P_SNVS_TAMPER_OUT3_ADMA_SAI2_RXC                     SC_P_SNVS_TAMPER_OUT3              2
#define SC_P_SNVS_TAMPER_OUT3_LSIO_GPIO2_IO07_IN                SC_P_SNVS_TAMPER_OUT3              4
#define SC_P_SNVS_TAMPER_OUT3_LSIO_GPIO6_IO21_IN                SC_P_SNVS_TAMPER_OUT3              5
#define SC_P_SNVS_TAMPER_OUT4_ADMA_SAI2_RXD                     SC_P_SNVS_TAMPER_OUT4              2
#define SC_P_SNVS_TAMPER_OUT4_LSIO_GPIO2_IO08_IN                SC_P_SNVS_TAMPER_OUT4              4
#define SC_P_SNVS_TAMPER_OUT4_LSIO_GPIO6_IO22_IN                SC_P_SNVS_TAMPER_OUT4              5
#define SC_P_SNVS_TAMPER_IN0_ADMA_SAI2_RXFS                     SC_P_SNVS_TAMPER_IN0               2
#define SC_P_SNVS_TAMPER_IN0_LSIO_GPIO2_IO09_IN                 SC_P_SNVS_TAMPER_IN0               4
#define SC_P_SNVS_TAMPER_IN0_LSIO_GPIO6_IO23_IN                 SC_P_SNVS_TAMPER_IN0               5
#define SC_P_SNVS_TAMPER_IN1_ADMA_SAI3_RXC                      SC_P_SNVS_TAMPER_IN1               2
#define SC_P_SNVS_TAMPER_IN1_LSIO_GPIO2_IO10_IN                 SC_P_SNVS_TAMPER_IN1               4
#define SC_P_SNVS_TAMPER_IN1_LSIO_GPIO6_IO24_IN                 SC_P_SNVS_TAMPER_IN1               5
#define SC_P_SNVS_TAMPER_IN2_ADMA_SAI3_RXD                      SC_P_SNVS_TAMPER_IN2               2
#define SC_P_SNVS_TAMPER_IN2_LSIO_GPIO2_IO11_IN                 SC_P_SNVS_TAMPER_IN2               4
#define SC_P_SNVS_TAMPER_IN2_LSIO_GPIO6_IO25_IN                 SC_P_SNVS_TAMPER_IN2               5
#define SC_P_SNVS_TAMPER_IN3_ADMA_SAI3_RXFS                     SC_P_SNVS_TAMPER_IN3               2
#define SC_P_SNVS_TAMPER_IN3_LSIO_GPIO2_IO12_IN                 SC_P_SNVS_TAMPER_IN3               4
#define SC_P_SNVS_TAMPER_IN3_LSIO_GPIO6_IO26_IN                 SC_P_SNVS_TAMPER_IN3               5
#define SC_P_SPI1_SCK_ADMA_I2C2_SDA                             SC_P_SPI1_SCK                      2
#define SC_P_SPI1_SCK_ADMA_SPI1_SCK                             SC_P_SPI1_SCK                      3
#define SC_P_SPI1_SCK_LSIO_GPIO3_IO00                           SC_P_SPI1_SCK                      4
#define SC_P_SPI1_SDO_ADMA_I2C2_SCL                             SC_P_SPI1_SDO                      2
#define SC_P_SPI1_SDO_ADMA_SPI1_SDO                             SC_P_SPI1_SDO                      3
#define SC_P_SPI1_SDO_LSIO_GPIO3_IO01                           SC_P_SPI1_SDO                      4
#define SC_P_SPI1_SDI_ADMA_I2C3_SCL                             SC_P_SPI1_SDI                      2
#define SC_P_SPI1_SDI_ADMA_SPI1_SDI                             SC_P_SPI1_SDI                      3
#define SC_P_SPI1_SDI_LSIO_GPIO3_IO02                           SC_P_SPI1_SDI                      4
#define SC_P_SPI1_CS0_ADMA_I2C3_SDA                             SC_P_SPI1_CS0                      2
#define SC_P_SPI1_CS0_ADMA_SPI1_CS0                             SC_P_SPI1_CS0                      3
#define SC_P_SPI1_CS0_LSIO_GPIO3_IO03                           SC_P_SPI1_CS0                      4
#define SC_P_QSPI0A_DATA1_LSIO_QSPI0A_DATA1                     SC_P_QSPI0A_DATA1                  0
#define SC_P_QSPI0A_DATA1_LSIO_GPIO3_IO10                       SC_P_QSPI0A_DATA1                  4
#define SC_P_QSPI0A_DATA0_LSIO_QSPI0A_DATA0                     SC_P_QSPI0A_DATA0                  0
#define SC_P_QSPI0A_DATA0_LSIO_GPIO3_IO09                       SC_P_QSPI0A_DATA0                  4
#define SC_P_QSPI0A_DATA3_LSIO_QSPI0A_DATA3                     SC_P_QSPI0A_DATA3                  0
#define SC_P_QSPI0A_DATA3_LSIO_GPIO3_IO12                       SC_P_QSPI0A_DATA3                  4
#define SC_P_QSPI0A_DATA2_LSIO_QSPI0A_DATA2                     SC_P_QSPI0A_DATA2                  0
#define SC_P_QSPI0A_DATA2_LSIO_GPIO3_IO11                       SC_P_QSPI0A_DATA2                  4
#define SC_P_QSPI0A_SS0_B_LSIO_QSPI0A_SS0_B                     SC_P_QSPI0A_SS0_B                  0
#define SC_P_QSPI0A_SS0_B_LSIO_GPIO3_IO14                       SC_P_QSPI0A_SS0_B                  4
#define SC_P_QSPI0A_DQS_LSIO_QSPI0A_DQS                         SC_P_QSPI0A_DQS                    0
#define SC_P_QSPI0A_DQS_LSIO_GPIO3_IO13                         SC_P_QSPI0A_DQS                    4
#define SC_P_QSPI0A_SCLK_LSIO_QSPI0A_SCLK                       SC_P_QSPI0A_SCLK                   0
#define SC_P_QSPI0A_SCLK_LSIO_GPIO3_IO16                        SC_P_QSPI0A_SCLK                   4
#define SC_P_QSPI0B_SCLK_LSIO_QSPI0B_SCLK                       SC_P_QSPI0B_SCLK                   0
#define SC_P_QSPI0B_SCLK_LSIO_GPIO3_IO17                        SC_P_QSPI0B_SCLK                   4
#define SC_P_QSPI0B_DQS_LSIO_QSPI0B_DQS                         SC_P_QSPI0B_DQS                    0
#define SC_P_QSPI0B_DQS_LSIO_GPIO3_IO22                         SC_P_QSPI0B_DQS                    4
#define SC_P_QSPI0B_DATA1_LSIO_QSPI0B_DATA1                     SC_P_QSPI0B_DATA1                  0
#define SC_P_QSPI0B_DATA1_LSIO_GPIO3_IO19                       SC_P_QSPI0B_DATA1                  4
#define SC_P_QSPI0B_DATA0_LSIO_QSPI0B_DATA0                     SC_P_QSPI0B_DATA0                  0
#define SC_P_QSPI0B_DATA0_LSIO_GPIO3_IO18                       SC_P_QSPI0B_DATA0                  4
#define SC_P_QSPI0B_DATA3_LSIO_QSPI0B_DATA3                     SC_P_QSPI0B_DATA3                  0
#define SC_P_QSPI0B_DATA3_LSIO_GPIO3_IO21                       SC_P_QSPI0B_DATA3                  4
#define SC_P_QSPI0B_DATA2_LSIO_QSPI0B_DATA2                     SC_P_QSPI0B_DATA2                  0
#define SC_P_QSPI0B_DATA2_LSIO_GPIO3_IO20                       SC_P_QSPI0B_DATA2                  4
#define SC_P_QSPI0B_SS0_B_LSIO_QSPI0B_SS0_B                     SC_P_QSPI0B_SS0_B                  0
#define SC_P_QSPI0B_SS0_B_LSIO_GPIO3_IO23                       SC_P_QSPI0B_SS0_B                  4
#define SC_P_QSPI0B_SS0_B_LSIO_QSPI0A_SS1_B                     SC_P_QSPI0B_SS0_B                  5
/*@}*/

/*!
 * @name Fake Pad Mux Definitions
 * format: name padid 0
 */
/*@{*/
#define SC_P_COMP_CTL_GPIO_1V8_3V3_PCIESEP_PAD          SC_P_COMP_CTL_GPIO_1V8_3V3_PCIESEP         0
#define SC_P_COMP_CTL_GPIO_3V3_USB3IO_PAD               SC_P_COMP_CTL_GPIO_3V3_USB3IO              0
#define SC_P_COMP_CTL_GPIO_1V8_3V3_SD1FIX0_PAD          SC_P_COMP_CTL_GPIO_1V8_3V3_SD1FIX0         0
#define SC_P_COMP_CTL_GPIO_1V8_3V3_VSELSEP_PAD          SC_P_COMP_CTL_GPIO_1V8_3V3_VSELSEP         0
#define SC_P_COMP_CTL_GPIO_1V8_3V3_ENET_ENETB0_PAD      SC_P_COMP_CTL_GPIO_1V8_3V3_ENET_ENETB0     0
#define SC_P_COMP_CTL_GPIO_1V8_3V3_ENET_ENETB1_PAD      SC_P_COMP_CTL_GPIO_1V8_3V3_ENET_ENETB1     0
#define SC_P_COMP_CTL_GPIO_1V8_3V3_GPIOCT_PAD           SC_P_COMP_CTL_GPIO_1V8_3V3_GPIOCT          0
#define SC_P_COMP_CTL_GPIO_1V8_3V3_GPIORHB_PAD          SC_P_COMP_CTL_GPIO_1V8_3V3_GPIORHB         0
#define SC_P_COMP_CTL_GPIO_1V8_3V3_GPIORHK_PAD          SC_P_COMP_CTL_GPIO_1V8_3V3_GPIORHK         0
#define SC_P_COMP_CTL_GPIO_1V8_3V3_GPIORHT_PAD          SC_P_COMP_CTL_GPIO_1V8_3V3_GPIORHT         0
#define SC_P_COMP_CTL_GPIO_1V8_3V3_GPIOLH_PAD           SC_P_COMP_CTL_GPIO_1V8_3V3_GPIOLH          0
#define SC_P_COMP_CTL_GPIO_1V8_3V3_GPIORHD_PAD          SC_P_COMP_CTL_GPIO_1V8_3V3_GPIORHD         0
#define SC_P_COMP_CTL_GPIO_1V8_3V3_QSPI0A_PAD           SC_P_COMP_CTL_GPIO_1V8_3V3_QSPI0A          0
#define SC_P_COMP_CTL_GPIO_1V8_3V3_QSPI0B_PAD           SC_P_COMP_CTL_GPIO_1V8_3V3_QSPI0B          0
/*@}*/

#endif				/* SC_PADS_H */
