/******************************************************************************
 *
 * Copyright (C) 2016-2017 Cadence Design Systems, Inc.
 * All rights reserved worldwide.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation and/or
 * other materials provided with the distribution.
 *
 * 3. Neither the name of the copyright holder nor the names of its contributors
 * may be used to endorse or promote products derived from this software without
 * specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
 * INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
 * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
 * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
 * OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 * Copyright 2017 NXP
 *
 ******************************************************************************
 *
 * API_HDMITX.h
 *
 ******************************************************************************
 */

#ifndef _API_HDMITX_H_
#define _API_HDMITX_H_

#include "API_General.h"
#include "hdmi.h"

/**
 * \addtogroup HDMI_TX_API
 * \{
 */

# define HDMI_TX_EVENT_CODE_HPD_HIGH                  0x01
# define HDMI_TX_EVENT_CODE_HPD_LOW                   0x02
# define HDMI_TX_EVENT_CODE_HPD_STATE_LOW             0x00
# define HDMI_TX_EVENT_CODE_HPD_STATE_HIGH            0x08
typedef struct {
    /** if used to return data, this pointer is set (instead of being a destination to copy data to */
	u8 *buff;
	HDMI_I2C_STATUS status;
	u16 len;
	u8 slave;
	u8 offset;
} HDMITX_TRANS_DATA;

typedef enum {
	HDMI_TX_MODE_DVI,
	HDMI_TX_MODE_HDMI_1_4,
	HDMI_TX_MODE_HDMI_2_0,
} HDMI_TX_MAIL_HANDLER_PROTOCOL_TYPE;

/**
 * \brief I2C read transaction
 * \param [in]  data_in  - fields used: len, slave, offset
 * \param [out] data_out - fields used: all
 * \returns status
 */
CDN_API_STATUS CDN_API_HDMITX_DDC_READ(state_struct *state,
				       HDMITX_TRANS_DATA *data_in,
				       HDMITX_TRANS_DATA *data_out);
CDN_API_STATUS CDN_API_HDMITX_DDC_READ_blocking(state_struct *state,
						HDMITX_TRANS_DATA *data_in,
						HDMITX_TRANS_DATA *data_out);

/**
 * \brief I2C write transaction
 * \param [in]  data_in  - fields used: len, slave, offset, buff
 * \param [out] data_out - fields used: status, len, slave, offset
 * \returns status
 */
CDN_API_STATUS CDN_API_HDMITX_DDC_WRITE(state_struct *state,
					HDMITX_TRANS_DATA *data_in,
					HDMITX_TRANS_DATA *data_out);
CDN_API_STATUS CDN_API_HDMITX_DDC_WRITE_blocking(state_struct *state,
						 HDMITX_TRANS_DATA *data_in,
						 HDMITX_TRANS_DATA *data_out);

/**
 * \brief I2C update read
 * \param [out] data_out - fields used: status, buff
 * \returns status
 */
CDN_API_STATUS CDN_API_HDMITX_DDC_UPDATE_READ(state_struct *state,
					      HDMITX_TRANS_DATA *data_out);
CDN_API_STATUS CDN_API_HDMITX_DDC_UPDATE_READ_blocking(state_struct *state,
						       HDMITX_TRANS_DATA *
						       data_out);

/**
 * \brief I2C read edid
 * \param [in]  block    - EDID block
 * \pram  [in]  segment  - EDID segment
 * \param [out] data_out - fields used: status, buff, slave (as block), offset (as segment), len
 * \returns status
 */
CDN_API_STATUS CDN_API_HDMITX_READ_EDID(state_struct *state, u8 block,
					u8 segment,
					HDMITX_TRANS_DATA *data_out);
CDN_API_STATUS CDN_API_HDMITX_READ_EDID_blocking(state_struct *state, u8 block,
						 u8 segment,
						 HDMITX_TRANS_DATA *data_out);

/**
 * \brief set hdmi protocol type (DVI,1.x,2.x) (send scrambler command over scdc and set bits in controller)
 * \param [in]  protocol    - type
 * \returns status
 */
CDN_API_STATUS
CDN_API_HDMITX_Set_Mode_blocking(state_struct *state,
				 HDMI_TX_MAIL_HANDLER_PROTOCOL_TYPE protocol,
				 u32 character_rate);

/**
 * \brief init hdmi registers
 * \returns status
 */
CDN_API_STATUS CDN_API_HDMITX_Init_blocking(state_struct *state);

/**
 * \brief change to vid id vicMode
 * \returns status
 */
CDN_API_STATUS CDN_API_HDMITX_SetVic_blocking(state_struct *state,
					      struct drm_display_mode *mode, int bpp,
					      VIC_PXL_ENCODING_FORMAT format);

/**
 * \brief option to force color depth in the gcp or not force (HW mode)
 * \returns status
 */
CDN_API_STATUS CDN_API_HDMITX_ForceColorDepth_blocking(state_struct *state,
						       u8 force, u8 val);
CDN_API_STATUS CDN_API_HDMITX_ReadEvents(state_struct *state, u32 *events);
CDN_API_STATUS CDN_API_HDMITX_ReadEvents_blocking(state_struct *state,
						  u32 *events);
CDN_API_STATUS CDN_API_HDMITX_GetHpdStatus(state_struct *state, u8 *hpd_sts);
CDN_API_STATUS CDN_API_HDMITX_GetHpdStatus_blocking(state_struct *state,
						    u8 *hpd_sts);
CDN_API_STATUS CDN_API_HDMITX_Disable_GCP(state_struct *state);
#endif
