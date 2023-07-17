/*
 * This file is provided under a dual BSD/GPLv2 license.  When using or
 * redistributing this file, you may do so under either license.
 *
 * GPL LICENSE SUMMARY
 *
 * Copyright(c) 2018 NXP. All rights reserved.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of version 2 of the GNU General Public License as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St - Fifth Floor, Boston, MA 02110-1301 USA.
 * The full GNU General Public License is included in this distribution
 * in the file called LICENSE.GPL.
 *
 * BSD LICENSE
 *
 * Copyright(c) 2018 NXP. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 *   * Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *   * Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in
 *     the documentation and/or other materials provided with the
 *     distribution.
 *   * Neither the name of Intel Corporation nor the names of its
 *     contributors may be used to endorse or promote products derived
 *     from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#ifndef __VPU_ENCODER_RPC_H__
#define __VPU_ENCODER_RPC_H__

#include "mediasys_types.h"

#define CMD_SIZE 2560
#define MSG_SIZE 25600
#define CODEC_SIZE 0x1000
#define JPEG_SIZE 0x1000
#define SEQ_SIZE 0x1000
#define GOP_SIZE 0x1000
#define PIC_SIZE 0x1000
#define QMETER_SIZE 0x1000
#define DEBUG_SIZE 0x1000
#define ENG_SIZE 0x1000
#define LOCAL_MSG_NUM VID_API_MESSAGE_LIMIT

struct shared_addr {
	pENC_RPC_HOST_IFACE pSharedInterface;
	unsigned long long shared_mem_phy;
	void *shared_mem_vir;
	unsigned long long cmd_mem_phy;
	void *cmd_mem_vir;
	unsigned long long msg_mem_phy;
	void *msg_mem_vir;
	unsigned long long codec_mem_phy;
	void *codec_mem_vir;
	unsigned long long jpeg_mem_phy;
	void *jpeg_mem_vir;
	unsigned long long seq_mem_phy;
	void *seq_mem_vir;
	unsigned long long pic_mem_phy;
	void *pic_mem_vir;
	unsigned long long gop_mem_phy;
	void *gop_mem_vir;
	unsigned long long qmeter_mem_phy;
	void *qmeter_mem_vir;
	unsigned long long base_offset;
};

struct msg_header {
	u32 idx;
	u32 msgnum;
	u32 msgid;
};

void rpc_init_shared_memory_encoder(struct shared_addr *This,
		unsigned long long base_phy_addr,
		void *base_virt_addr,
		u_int32 total_size,
		u32 *actual_size);
void rpc_set_system_cfg_value_encoder(void *Interface, u_int32 regs_base, u_int32 core_id);
void rpc_send_cmd_buf_encoder(struct shared_addr *This,
		u_int32 idx,
		u_int32 cmdid,
		u_int32 cmdnum,
		u_int32 *local_cmddata);
u32 rpc_read_msg_u32(struct shared_addr *shared_mem);
int rpc_read_msg_array(struct shared_addr *shared_mem, u32 *buf, u32 number);
int rpc_get_msg_header(struct shared_addr *shared_mem, struct msg_header *msg);

pMEDIAIP_ENC_YUV_BUFFER_DESC rpc_get_yuv_buffer_desc(
		struct shared_addr *shared_mem, int index);
pBUFFER_DESCRIPTOR_TYPE rpc_get_stream_buffer_desc(
		struct shared_addr *shared_mem, int index);
pMEDIAIP_ENC_EXPERT_MODE_PARAM rpc_get_expert_mode_param(
		struct shared_addr *shared_mem, int index);
pMEDIAIP_ENC_PARAM rpc_get_enc_param(
		struct shared_addr *shared_mem, int index);
pMEDIAIP_ENC_MEM_POOL rpc_get_mem_pool(
		struct shared_addr *shared_mem, int index);
pENC_ENCODING_STATUS rpc_get_encoding_status(
		struct shared_addr *shared_mem, int index);
pENC_DSA_STATUS_t rpc_get_dsa_status(struct shared_addr *shared_mem, int index);
void rpc_set_print_buffer(struct shared_addr *shared_mem,
				unsigned long print_phy_addr, u32 size);

#endif
