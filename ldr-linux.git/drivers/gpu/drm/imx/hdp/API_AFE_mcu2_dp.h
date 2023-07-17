/******************************************************************************
 *
 * Copyright (C) 2016-2017 Cadence Design Systems, Inc.
 * All rights reserved worldwide.
 *
 * Copyright 2018 NXP
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 *
 * 3. Neither the name of the copyright holder nor the names of its contributors
 * may be used to endorse or promote products derived from this software without
 * specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 * ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. THE SOFTWARE IS PROVIDED "AS IS",
 * WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
 * TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
 * FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
 * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
 * OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 ******************************************************************************
 *
 * API_AFE_mcu2_dp.h
 *
 ******************************************************************************
 */

#ifndef API_AFE_MCU2_DP_H
# define API_AFE_MCU2_DP_H

#define CMN_SSM_BIAS_TMR                0x0022
#define CMN_PLLSM0_PLLEN_TMR            0x0029
#define CMN_PLLSM0_PLLPRE_TMR           0x002A
#define CMN_PLLSM0_PLLVREF_TMR          0x002B
#define CMN_PLLSM0_PLLLOCK_TMR          0x002C
#define CMN_ICAL_INIT_TMR               0x00C4
#define CMN_ICAL_ITER_TMR               0x00C5
#define CMN_ICAL_ADJ_INIT_TMR           0x0102
#define CMN_ICAL_ADJ_ITER_TMR           0x0103
#define CMN_TXPUCAL_INIT_TMR            0x00E4
#define CMN_TXPUCAL_ITER_TMR            0x00E5
#define CMN_TXPU_ADJ_INIT_TMR           0x010A
#define CMN_TXPU_ADJ_ITER_TMR           0x010B
#define CMN_TXPDCAL_INIT_TMR            0x00F4
#define CMN_TXPDCAL_ITER_TMR            0x00F5
#define CMN_TXPD_ADJ_INIT_TMR           0x010E
#define CMN_TXPD_ADJ_ITER_TMR           0x010F
#define CMN_RXCAL_INIT_TMR              0x00D4
#define CMN_RXCAL_ITER_TMR              0x00D5
#define CMN_RX_ADJ_INIT_TMR             0x0106
#define CMN_RX_ADJ_ITER_TMR             0x0107
#define XCVR_PSM_CAL_TMR                0x4002
#define XCVR_PSM_A0IN_TMR               0x4003

#define PHY_PMA_CMN_CTRL1               0xC800
#define XCVR_DIAG_LANE_FCM_EN_MGN_TMR   0x40F2
#define XCVR_DIAG_LANE_FCM_EN_MGN_TMR_0 0x40F2
#define XCVR_DIAG_LANE_FCM_EN_MGN_TMR_1 0x42F2
#define XCVR_DIAG_LANE_FCM_EN_MGN_TMR_2 0x44F2
#define XCVR_DIAG_LANE_FCM_EN_MGN_TMR_3 0x46F2
#define TX_RCVDET_EN_TMR                0x4122
#define TX_RCVDET_EN_TMR_0              0x4122
#define TX_RCVDET_EN_TMR_1              0x4322
#define TX_RCVDET_EN_TMR_2              0x4522
#define TX_RCVDET_EN_TMR_3              0x4722
#define TX_RCVDET_ST_TMR                0x4123
#define TX_RCVDET_ST_TMR_0              0x4123
#define TX_RCVDET_ST_TMR_1              0x4323
#define TX_RCVDET_ST_TMR_2              0x4523
#define TX_RCVDET_ST_TMR_3              0x4723
#define PHY_HDP_CLK_CTL                 0xC009
#define CMN_DIAG_HSCLK_SEL              0x01E0
#define XCVR_DIAG_HSCLK_SEL             0x40E1
#define XCVR_DIAG_HSCLK_SEL_0           0x40E1
#define XCVR_DIAG_HSCLK_SEL_1           0x42E1
#define XCVR_DIAG_HSCLK_SEL_2           0x44E1
#define XCVR_DIAG_HSCLK_SEL_3           0x46E1
#define CMN_PLL0_VCOCAL_START           0x0081
#define CMN_PLLSM0_USER_DEF_CTRL        0x002F
#define CMN_DIAG_PLL0_V2I_TUNE          0x01C5
#define CMN_DIAG_PLL0_PTATIS_TUNE1      0x01C8
#define CMN_DIAG_PLL0_PTATIS_TUNE2      0x01C9
#define CMN_DIAG_PLL0_CP_TUNE           0x01C6
#define CMN_DIAG_PER_CAL_ADJ            0x01EC
#define CMN_DIAG_CAL_CTRL               0x01ED
#define CMN_DIAG_ACYA                   0x01ff
#define CMN_DIAG_PLL0_LF_PROG           0x01C7
#define CMN_PLL0_VCOCAL_INIT_TMR        0x0084
#define CMN_PLL0_VCOCAL_ITER_TMR        0x0085
#define CMN_PLL0_INTDIV                 0x0094
#define CMN_PLL0_FRACDIV                0x0095
#define CMN_PLL0_HIGH_THR               0x0096
#define CMN_PLL0_SS_CTRL1               0x0098
#define CMN_PLL0_SS_CTRL2               0x0099
#define CMN_PLL0_DSM_DIAG               0x0097
#define CMN_DIAG_PLL0_OVRD              0x01C2
#define CMN_DIAG_PLL0_FBH_OVRD          0x01C0
#define CMN_DIAG_PLL0_FBL_OVRD          0x01C1
#define XCVR_DIAG_PLLDRC_CTRL           0x40E0
#define XCVR_DIAG_PLLDRC_CTRL_0         0x40E0
#define XCVR_DIAG_PLLDRC_CTRL_1         0x42E0
#define XCVR_DIAG_PLLDRC_CTRL_2         0x44E0
#define XCVR_DIAG_PLLDRC_CTRL_3         0x46E0
#define CMN_DIAG_PLL0_TEST_MODE         0x01C4
#define PHY_HDP_MODE_CTRL               0xC008
#define XCVR_PSM_RCTRL                  0x4001
#define XCVR_PSM_RCTRL_0                0x4001
#define XCVR_PSM_RCTRL_1                0x4201
#define XCVR_PSM_RCTRL_2                0x4401
#define XCVR_PSM_RCTRL_3                0x4601
#define TX_PSC_A0                       0x4100
#define TX_PSC_A0_0                     0x4100
#define TX_PSC_A0_1                     0x4300
#define TX_PSC_A0_2                     0x4500
#define TX_PSC_A0_3                     0x4700
#define TX_PSC_A1                       0x4101
#define TX_PSC_A1_0                     0x4101
#define TX_PSC_A1_1                     0x4301
#define TX_PSC_A1_2                     0x4501
#define TX_PSC_A1_3                     0x4701
#define TX_PSC_A2                       0x4102
#define TX_PSC_A2_0                     0x4102
#define TX_PSC_A2_1                     0x4302
#define TX_PSC_A2_2                     0x4502
#define TX_PSC_A2_3                     0x4702
#define TX_PSC_A3                       0x4103
#define TX_PSC_A3_0                     0x4103
#define TX_PSC_A3_1                     0x4303
#define TX_PSC_A3_2                     0x4503
#define TX_PSC_A3_3                     0x4703
#define TX_DIAG_TX_DRV                  0x41E1
#define TX_DIAG_TX_DRV_0                0x41E1
#define TX_DIAG_TX_DRV_1                0x43E1
#define TX_DIAG_TX_DRV_2                0x45E1
#define TX_DIAG_TX_DRV_3                0x47E1
#define TX_DIAG_BGREF_PREDRV_DELAY      0x41E7
#define PHY_HDP_MODE_CTRL               0xC008
#define TX_DIAG_ACYA_0                  0x41ff
#define TX_DIAG_ACYA_1                  0x43ff
#define TX_DIAG_ACYA_2                  0x45ff
#define TX_DIAG_ACYA_3                  0x47ff

#define RX_PSC_A0                       0x8000
#define RX_PSC_CAL                      0x8006
#define TX_TXCC_MGNFS_MULT_000_0        0x4050
#define TX_TXCC_MGNFS_MULT_000_1        0x4250
#define TX_TXCC_MGNFS_MULT_000_2        0x4450
#define TX_TXCC_MGNFS_MULT_000_3        0x4650

#define TX_TXCC_CPOST_MULT_00_0         0x404C
#define TX_TXCC_CPOST_MULT_00_1         0x424C
#define TX_TXCC_CPOST_MULT_00_2         0x444C
#define TX_TXCC_CPOST_MULT_00_3         0x464C

#define TX_ANA_CTRL_REG_1               0x5020
#define TX_ANA_CTRL_REG_2               0x5021
#define TX_ANA_CTRL_REG_3               0x5026
#define TX_ANA_CTRL_REG_4               0x5027
#define TX_ANA_CTRL_REG_5               0x5029

#define TX_DIG_CTRL_REG_2               0x5024
#define TX_DIG_CTRL_REG_1               0x5023
#define TXDA_CYA_AUXDA_CYA              0x5025
#define CMN_TXPUCAL_CTRL                0x00E0
#define CMN_TXPDCAL_CTRL                0x00F0
#define CMN_TXPU_ADJ_CTRL               0x0108
#define CMN_TXPD_ADJ_CTRL               0x010c
#define TXDA_COEFF_CALC                 0x5022
#define CMN_PSM_CLK_CTRL                0x0061

#define PHY_HDP_TX_CTL_L0               0xC408
#define PHY_HDP_TX_CTL_L1               0xC448
#define PHY_HDP_TX_CTL_L2               0xC488
#define PHY_HDP_TX_CTL_L3               0xC4C8

#endif //API_AFE_MCU2_DP_H
