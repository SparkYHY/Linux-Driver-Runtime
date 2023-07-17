/*
 * Copyright (c) 2015-2016, Linaro Limited
 * All rights reserved.
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
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */
#ifndef IPU_OPTEE_SMC_H
#define IPU_OPTEE_SMC_H

#include <linux/arm-smccc.h>
#include <linux/bitops.h>


#define OPTEE_SMC_FAST_CALL_VAL(func_num) \
	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_32, \
			   ARM_SMCCC_OWNER_TRUSTED_OS, (func_num))

/*
 * Test function to evalute SW ipu driver
 *
 * xxx
 *
 * Call register usage:
 * a0	SMC Function ID, OPTEE_SMC_IPU
 * a1-7	Not used
 *
 * Normal return register usage:
 * a0	OPTEE_SMC_RETURN_OK
 * a1-7	Preserved
 *
 * Not idle return register usage:
 * a0	OPTEE_SMC_RETURN_EBUSY
 * a1-7	Preserved
 */
#define OPTEE_SMC_FUNCID_IPU_DUMP_REG 33
#define OPTEE_SMC_IPU_DUMP_REG \
	OPTEE_SMC_FAST_CALL_VAL(OPTEE_SMC_FUNCID_IPU_DUMP_REG)

/**
 * IPU_INIT_CHANNEL
 * 
 * Initilize IPU CSI_PRP_ENC_MEM channel.
 * 
 * Parameter arrangement:
 * a1 - in_width
 * a2 - in_height
 * a3 - in_pixel_fmt
 * a4 - out_width
 * a5 - out_height
 * a6 - out_pixel_fmt
 * a7 - mipi_id
*/
#define OPTEE_SMC_FUNCID_IPU_INIT_CHANNEL 34
#define OPTEE_SMC_IPU_INIT_CHANNEL \
	OPTEE_SMC_FAST_CALL_VAL(OPTEE_SMC_FUNCID_IPU_INIT_CHANNEL)

/**
 * IPU_INIT_CHANNEL_BUFFER
 * 
 * Initilize IPU CSI_PRP_ENC_MEM channel buffer.
 * 
 * Parameter arrangement:
 * a1 - pixel_fmt
 * a2 - width
 * a3 - height
 * a4 - stride
 * a5 - phyaddr_0
 * a6 - phyaddr_1
*/
#define OPTEE_SMC_FUNCID_IPU_INIT_CHANNEL_BUFFER 35
#define OPTEE_SMC_IPU_INIT_CHANNEL_BUFFER \
	OPTEE_SMC_FAST_CALL_VAL(OPTEE_SMC_FUNCID_IPU_INIT_CHANNEL_BUFFER)

/**
 * IPU_ENABLE_CHANNEL
 * 
 * Enable IPU CSI_PRP_ENC_MEM channel from the SW
 */
#define OPTEE_SMC_FUNCID_IPU_ENABLE_CHANNEL 36
#define OPTEE_SMC_IPU_ENABLE_CHANNEL \
	OPTEE_SMC_FAST_CALL_VAL(OPTEE_SMC_FUNCID_IPU_ENABLE_CHANNEL)

/**
 * IPU_UPDATE_CHANNEL_BUFFER
 * 
 * Update IPU CSI_PRP_ENC_MEM channel buffer.
 * 
 * Parameter arrangement:
 * a1 - bufNum
 * a2 - phyaddr
*/
#define OPTEE_SMC_FUNCID_IPU_UPDATE_CHANNEL_BUFFER 37
#define OPTEE_SMC_IPU_UPDATE_CHANNEL_BUFFER \
	OPTEE_SMC_FAST_CALL_VAL(OPTEE_SMC_FUNCID_IPU_UPDATE_CHANNEL_BUFFER)

/**
 * IPU_SELECT_BUFFER
 * 
 * Select IPU CSI_PRP_ENC_MEM channel buffer number 0 or 1.
 * 
 * Parameter arrangement:
 * a1 - bufNum
*/
#define OPTEE_SMC_FUNCID_IPU_SELECT_BUFFER 38
#define OPTEE_SMC_IPU_SELECT_BUFFER \
	OPTEE_SMC_FAST_CALL_VAL(OPTEE_SMC_FUNCID_IPU_SELECT_BUFFER)

/**
 * IPU_ENABLE_CSI
 * 
 * Enable IPU CSI1 interface from the SW
 */
#define OPTEE_SMC_FUNCID_IPU_ENABLE_CSI 39
#define OPTEE_SMC_IPU_ENABLE_CSI \
	OPTEE_SMC_FAST_CALL_VAL(OPTEE_SMC_FUNCID_IPU_ENABLE_CSI)

/**
 * IPU_DISABLE_CSI
 * 
 * Disable IPU CSI1 interface from the SW
 * 
 * Parameter arrangement:
*/
#define OPTEE_SMC_FUNCID_IPU_DISABLE_CSI 40
#define OPTEE_SMC_IPU_DISABLE_CSI \
	OPTEE_SMC_FAST_CALL_VAL(OPTEE_SMC_FUNCID_IPU_DISABLE_CSI)

/**
 * IPU_DISABLE_CHANNEL
 * 
 * Disable IPU CSI_PRP_ENC_MEM channel.
 * 
 * Parameter arrangement:
*/
#define OPTEE_SMC_FUNCID_IPU_DISABLE_CHANNEL 41
#define OPTEE_SMC_IPU_DISABLE_CHANNEL \
	OPTEE_SMC_FAST_CALL_VAL(OPTEE_SMC_FUNCID_IPU_DISABLE_CHANNEL)

/**
 * IPU_UNINIT_CHANNEL
 * 
 * Uninitilize IPU CSI_PRP_ENC_MEM channel.
 * 
 * Parameter arrangement:
*/
#define OPTEE_SMC_FUNCID_IPU_UNINIT_CHANNEL 42
#define OPTEE_SMC_IPU_UNINIT_CHANNEL \
	OPTEE_SMC_FAST_CALL_VAL(OPTEE_SMC_FUNCID_IPU_UNINIT_CHANNEL)

#endif /* IPU_OPTEE_SMC_H */