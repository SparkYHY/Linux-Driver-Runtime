/**
 * LDR PTA main source code
 * 
 * 
*/

#include <compiler.h>
#include <stdio.h>
#include <stdlib.h>
#include <trace.h>
#include <kernel/pseudo_ta.h>
#include <kernel/thread.h>
#include <malloc.h>
#include <mm/tee_pager.h>
#include <mm/tee_mm.h>
#include <printk.h>
#include <string.h>
#include <string_ext.h>
#include <trace.h>
#include <kernel/spinlock.h>
#include <kernel/export.h>
#include <ldr/ldr.h>
#include <ldr/state_var.h>
#include <optee_rpc_cmd.h>
#include <drivers/imx_i2c.h>
#include <kernel/cache_helpers.h>
#include <drivers/imx_gpt.h>
#include <ldr/ldr_dac.h>

extern int64_t ktime_get(void);

/**
 * @params[0].u.value.a	driver ID to retrieve the driver's sv
 * @params[0].u.value.b	target linux function address (linux kaddress)
 * @params[0].u.value.c	target linux function type (1-ret, 0-void)
 * 
 * @params[1].u.value.a	target linux function arg type
 * @params[1].u.value.b	1st arguement to the target linux function
 * @params[1].u.value.c	2nd arguement to the target linux function
 * 
 * @params[2].u.value.a	3rd arguement to the target linux function
 * @params[2].u.value.b	4th arguement to the target linux function
 * @params[2].u.value.c	result for return functions [out]
*/

void ldr_redbench_void_0(void) {
	TEE_Result res;
	uint32_t current_driver_id = ldr_sw_get_cur_driver_id();

	if (current_driver_id == 0) {
		EMSG("ERROR: NULL current driver id.");
	}
	struct thread_param params[3];

	params[0].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[1].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[2].attr = THREAD_PARAM_ATTR_VALUE_INOUT;

	params[0].u.value.a = current_driver_id;
	params[0].u.value.b = REDBENCH_VOID_0;
	params[0].u.value.c = 0;

	params[1].u.value.a = 0x00;
	params[1].u.value.b = 0;
	params[1].u.value.c = 0;

	params[2].u.value.a = 0;
	params[2].u.value.b = 0;

	res = thread_rpc_cmd(OPTEE_RPC_CMD_LDR_LINUX_BKWD_RPC, 3, &params);
	if (res != TEE_SUCCESS) {
		EMSG("ERROR: ldr msleep() linux rpc fails.");
	}
}

void ldr_redbench_void_1(int arg1) {
	TEE_Result res;
	uint32_t current_driver_id = ldr_sw_get_cur_driver_id();

	if (current_driver_id == 0) {
		EMSG("ERROR: NULL current driver id.");
	}
	struct thread_param params[3];

	params[0].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[1].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[2].attr = THREAD_PARAM_ATTR_VALUE_INOUT;

	params[0].u.value.a = current_driver_id;
	params[0].u.value.b = REDBENCH_VOID_1;
	params[0].u.value.c = 0;

	params[1].u.value.a = 0x00;
	params[1].u.value.b = arg1;
	params[1].u.value.c = 0;

	params[2].u.value.a = 0;
	params[2].u.value.b = 0;

	res = thread_rpc_cmd(OPTEE_RPC_CMD_LDR_LINUX_BKWD_RPC, 3, &params);
	if (res != TEE_SUCCESS) {
		EMSG("ERROR: ldr msleep() linux rpc fails.");
	}
}
void ldr_redbench_void_2(int arg1, int arg2) {
	TEE_Result res;
	uint32_t current_driver_id = ldr_sw_get_cur_driver_id();

	if (current_driver_id == 0) {
		EMSG("ERROR: NULL current driver id.");
	}
	struct thread_param params[3];

	params[0].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[1].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[2].attr = THREAD_PARAM_ATTR_VALUE_INOUT;

	params[0].u.value.a = current_driver_id;
	params[0].u.value.b = REDBENCH_VOID_2;
	params[0].u.value.c = 0;

	params[1].u.value.a = 0x00;
	params[1].u.value.b = arg1;
	params[1].u.value.c = arg2;

	params[2].u.value.a = 0;
	params[2].u.value.b = 0;

	res = thread_rpc_cmd(OPTEE_RPC_CMD_LDR_LINUX_BKWD_RPC, 3, &params);
	if (res != TEE_SUCCESS) {
		EMSG("ERROR: ldr msleep() linux rpc fails.");
	}
}
void ldr_redbench_void_3(int arg1, int arg2, int arg3) {
	TEE_Result res;
	uint32_t current_driver_id = ldr_sw_get_cur_driver_id();

	if (current_driver_id == 0) {
		EMSG("ERROR: NULL current driver id.");
	}
	struct thread_param params[3];

	params[0].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[1].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[2].attr = THREAD_PARAM_ATTR_VALUE_INOUT;

	params[0].u.value.a = current_driver_id;
	params[0].u.value.b = REDBENCH_VOID_3;
	params[0].u.value.c = 0;

	params[1].u.value.a = 0x00;
	params[1].u.value.b = arg1;
	params[1].u.value.c = arg2;

	params[2].u.value.a = arg3;
	params[2].u.value.b = 0;

	res = thread_rpc_cmd(OPTEE_RPC_CMD_LDR_LINUX_BKWD_RPC, 3, &params);
	if (res != TEE_SUCCESS) {
		EMSG("ERROR: ldr msleep() linux rpc fails.");
	}
}
void ldr_redbench_void_4(int arg1, int arg2, int arg3, int arg4) {
	TEE_Result res;
	uint32_t current_driver_id = ldr_sw_get_cur_driver_id();

	if (current_driver_id == 0) {
		EMSG("ERROR: NULL current driver id.");
	}
	struct thread_param params[3];

	params[0].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[1].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[2].attr = THREAD_PARAM_ATTR_VALUE_INOUT;

	params[0].u.value.a = current_driver_id;
	params[0].u.value.b = REDBENCH_VOID_4;
	params[0].u.value.c = 0;

	params[1].u.value.a = 0x00;
	params[1].u.value.b = arg1;
	params[1].u.value.c = arg2;

	params[2].u.value.a = arg3;
	params[2].u.value.b = arg4;

	res = thread_rpc_cmd(OPTEE_RPC_CMD_LDR_LINUX_BKWD_RPC, 3, &params);
	if (res != TEE_SUCCESS) {
		EMSG("ERROR: ldr msleep() linux rpc fails.");
	}
}

int ldr_redbench_ret_0(void) {
	TEE_Result res;

	uint32_t current_driver_id = ldr_sw_get_cur_driver_id();

	if (current_driver_id == 0) {
		EMSG("ERROR: NULL current driver id.");
	}
	struct thread_param params[3];

	params[0].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[1].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[2].attr = THREAD_PARAM_ATTR_VALUE_INOUT;

	params[0].u.value.a = current_driver_id;
	params[0].u.value.b = REDBENCH_RET_0;
	params[0].u.value.c = 1;

	params[1].u.value.a = 0x00;
	params[1].u.value.b = 0;
	params[1].u.value.c = 0;

	params[2].u.value.a = 0;
	params[2].u.value.b = 0;

	res = thread_rpc_cmd(OPTEE_RPC_CMD_LDR_LINUX_BKWD_RPC, 3, &params);
	if (res != TEE_SUCCESS) {
		EMSG("ERROR: ldr msleep() linux rpc fails.");
	}

	res = params[2].u.value.c;

	return res;
}
int ldr_redbench_ret_1(int arg1) {
	TEE_Result res;

	uint32_t current_driver_id = ldr_sw_get_cur_driver_id();

	if (current_driver_id == 0) {
		EMSG("ERROR: NULL current driver id.");
	}
	struct thread_param params[3];

	params[0].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[1].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[2].attr = THREAD_PARAM_ATTR_VALUE_INOUT;

	params[0].u.value.a = current_driver_id;
	params[0].u.value.b = REDBENCH_RET_1;
	params[0].u.value.c = 1;

	params[1].u.value.a = 0x00;
	params[1].u.value.b = arg1;
	params[1].u.value.c = 0;

	params[2].u.value.a = 0;
	params[2].u.value.b = 0;

	res = thread_rpc_cmd(OPTEE_RPC_CMD_LDR_LINUX_BKWD_RPC, 3, &params);
	if (res != TEE_SUCCESS) {
		EMSG("ERROR: ldr msleep() linux rpc fails.");
	}

	res = params[2].u.value.c;

	return res;
}
int ldr_redbench_ret_2(int arg1, int arg2) {
	TEE_Result res;

	uint32_t current_driver_id = ldr_sw_get_cur_driver_id();

	if (current_driver_id == 0) {
		EMSG("ERROR: NULL current driver id.");
	}
	struct thread_param params[3];

	params[0].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[1].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[2].attr = THREAD_PARAM_ATTR_VALUE_INOUT;

	params[0].u.value.a = current_driver_id;
	params[0].u.value.b = REDBENCH_RET_2;
	params[0].u.value.c = 1;

	params[1].u.value.a = 0x00;
	params[1].u.value.b = arg1;
	params[1].u.value.c = arg2;

	params[2].u.value.a = 0;
	params[2].u.value.b = 0;

	res = thread_rpc_cmd(OPTEE_RPC_CMD_LDR_LINUX_BKWD_RPC, 3, &params);
	if (res != TEE_SUCCESS) {
		EMSG("ERROR: ldr msleep() linux rpc fails.");
	}

	res = params[2].u.value.c;

	return res;
}
int ldr_redbench_ret_3(int arg1, int arg2, int arg3) {
	TEE_Result res;

	uint32_t current_driver_id = ldr_sw_get_cur_driver_id();

	if (current_driver_id == 0) {
		EMSG("ERROR: NULL current driver id.");
	}
	struct thread_param params[3];

	params[0].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[1].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[2].attr = THREAD_PARAM_ATTR_VALUE_INOUT;

	params[0].u.value.a = current_driver_id;
	params[0].u.value.b = REDBENCH_RET_3;
	params[0].u.value.c = 1;

	params[1].u.value.a = 0x00;
	params[1].u.value.b = arg1;
	params[1].u.value.c = arg2;

	params[2].u.value.a = arg3;
	params[2].u.value.b = 0;

	res = thread_rpc_cmd(OPTEE_RPC_CMD_LDR_LINUX_BKWD_RPC, 3, &params);
	if (res != TEE_SUCCESS) {
		EMSG("ERROR: ldr msleep() linux rpc fails.");
	}

	res = params[2].u.value.c;

	return res;
}

int ldr_redbench_ret_4(int arg1, int arg2, int arg3, int arg4) { 
	TEE_Result res;

	uint32_t current_driver_id = ldr_sw_get_cur_driver_id();

	if (current_driver_id == 0) {
		EMSG("ERROR: NULL current driver id.");
	}
	struct thread_param params[3];

	params[0].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[1].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[2].attr = THREAD_PARAM_ATTR_VALUE_INOUT;

	params[0].u.value.a = current_driver_id;
	params[0].u.value.b = REDBENCH_RET_4;
	params[0].u.value.c = 1;

	params[1].u.value.a = 0x00;
	params[1].u.value.b = arg1;
	params[1].u.value.c = arg2;

	params[2].u.value.a = arg3;
	params[2].u.value.b = arg4;

	res = thread_rpc_cmd(OPTEE_RPC_CMD_LDR_LINUX_BKWD_RPC, 3, &params);
	if (res != TEE_SUCCESS) {
		EMSG("ERROR: ldr msleep() linux rpc fails.");
	}

	res = params[2].u.value.c;

	return res;
}

TEE_EXPORT_SYMBOL(ldr_redbench_void_0);
TEE_EXPORT_SYMBOL(ldr_redbench_void_1);
TEE_EXPORT_SYMBOL(ldr_redbench_void_2);
TEE_EXPORT_SYMBOL(ldr_redbench_void_3);
TEE_EXPORT_SYMBOL(ldr_redbench_void_4);
TEE_EXPORT_SYMBOL(ldr_redbench_ret_0);
TEE_EXPORT_SYMBOL(ldr_redbench_ret_1);
TEE_EXPORT_SYMBOL(ldr_redbench_ret_2);
TEE_EXPORT_SYMBOL(ldr_redbench_ret_3);
TEE_EXPORT_SYMBOL(ldr_redbench_ret_4);

/* benchmark for state variable synchronization */
void ldr_redbench_sync_0(int clean) { 
	TEE_Result res;

	uint32_t current_driver_id = ldr_sw_get_cur_driver_id();

	if (current_driver_id == 0) {
		EMSG("ERROR: NULL current driver id.");
	}
	struct thread_param params[3];

	params[0].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[1].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[2].attr = THREAD_PARAM_ATTR_VALUE_INOUT;

	params[0].u.value.a = current_driver_id;
	params[0].u.value.b = REDBENCH_SYNC_1;
	params[0].u.value.c = 0;

	params[1].u.value.a = LDR_RPC_ARG_TYPES(0,0,0,0);
	params[1].u.value.b = 0;
	params[1].u.value.c = 0;

	params[2].u.value.a = 0;
	params[2].u.value.b = 0;

	sv_shadow_id(current_driver_id);

	res = thread_rpc_cmd(OPTEE_RPC_CMD_LDR_LINUX_BKWD_RPC, 3, &params);
	if (res != TEE_SUCCESS) {
		EMSG("ERROR: ldr msleep() linux rpc fails.");
	}

	sv_sync_id(current_driver_id, clean);
}

void ldr_redbench_sync_1(void *arg1, int clean) { 
	TEE_Result res;

	uint32_t current_driver_id = ldr_sw_get_cur_driver_id();

	if (current_driver_id == 0) {
		EMSG("ERROR: NULL current driver id.");
	}
	struct thread_param params[3];

	params[0].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[1].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[2].attr = THREAD_PARAM_ATTR_VALUE_INOUT;

	params[0].u.value.a = current_driver_id;
	params[0].u.value.b = REDBENCH_SYNC_1;
	params[0].u.value.c = 0;

	params[1].u.value.a = LDR_RPC_ARG_TYPES(1,0,0,0);
	params[1].u.value.b = rpc_get_arg(current_driver_id, (uint32_t)arg1);
	params[1].u.value.c = 0;

	params[2].u.value.a = 0;
	params[2].u.value.b = 0;

	sv_shadow_id(current_driver_id);

	res = thread_rpc_cmd(OPTEE_RPC_CMD_LDR_LINUX_BKWD_RPC, 3, &params);
	if (res != TEE_SUCCESS) {
		EMSG("ERROR: ldr msleep() linux rpc fails.");
	}

	sv_sync_id(current_driver_id, clean);
}

void ldr_redbench_sync_2(void *arg1, void *arg2, int clean) { 
	TEE_Result res;

	uint32_t current_driver_id = ldr_sw_get_cur_driver_id();

	if (current_driver_id == 0) {
		EMSG("ERROR: NULL current driver id.");
	}
	struct thread_param params[3];

	params[0].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[1].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[2].attr = THREAD_PARAM_ATTR_VALUE_INOUT;

	params[0].u.value.a = current_driver_id;
	params[0].u.value.b = REDBENCH_SYNC_2;
	params[0].u.value.c = 0;

	params[1].u.value.a = LDR_RPC_ARG_TYPES(1,1,0,0);
	params[1].u.value.b = rpc_get_arg(current_driver_id, (uint32_t)arg1);
	params[1].u.value.c = rpc_get_arg(current_driver_id, (uint32_t)arg2);

	params[2].u.value.a = 0;
	params[2].u.value.b = 0;

	sv_shadow_id(current_driver_id);

	res = thread_rpc_cmd(OPTEE_RPC_CMD_LDR_LINUX_BKWD_RPC, 3, &params);
	if (res != TEE_SUCCESS) {
		EMSG("ERROR: ldr msleep() linux rpc fails.");
	}

	sv_sync_id(current_driver_id, clean);
}

void ldr_redbench_sync_3(void *arg1, void *arg2, void *arg3, int clean) { 
	TEE_Result res;

	uint32_t current_driver_id = ldr_sw_get_cur_driver_id();

	if (current_driver_id == 0) {
		EMSG("ERROR: NULL current driver id.");
	}
	struct thread_param params[3];

	params[0].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[1].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[2].attr = THREAD_PARAM_ATTR_VALUE_INOUT;

	params[0].u.value.a = current_driver_id;
	params[0].u.value.b = REDBENCH_SYNC_3;
	params[0].u.value.c = 0;

	params[1].u.value.a = LDR_RPC_ARG_TYPES(1,1,1,0);
	params[1].u.value.b = rpc_get_arg(current_driver_id, (uint32_t)arg1);
	params[1].u.value.c = rpc_get_arg(current_driver_id, (uint32_t)arg2);

	params[2].u.value.a = rpc_get_arg(current_driver_id, (uint32_t)arg3);
	params[2].u.value.b = 0;

	sv_shadow_id(current_driver_id);

	res = thread_rpc_cmd(OPTEE_RPC_CMD_LDR_LINUX_BKWD_RPC, 3, &params);
	if (res != TEE_SUCCESS) {
		EMSG("ERROR: ldr msleep() linux rpc fails.");
	}

	sv_sync_id(current_driver_id, clean);
}

void ldr_redbench_sync_4(void *arg1, void *arg2, void *arg3, void *arg4, int clean) { 
	TEE_Result res;

	uint32_t current_driver_id = ldr_sw_get_cur_driver_id();

	if (current_driver_id == 0) {
		EMSG("ERROR: NULL current driver id.");
	}
	struct thread_param params[3];

	params[0].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[1].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[2].attr = THREAD_PARAM_ATTR_VALUE_INOUT;

	params[0].u.value.a = current_driver_id;
	params[0].u.value.b = REDBENCH_SYNC_4;
	params[0].u.value.c = 0;

	params[1].u.value.a = LDR_RPC_ARG_TYPES(1,1,1,1);
	params[1].u.value.b = rpc_get_arg(current_driver_id, (uint32_t)arg1);
	params[1].u.value.c = rpc_get_arg(current_driver_id, (uint32_t)arg2);

	params[2].u.value.a = rpc_get_arg(current_driver_id, (uint32_t)arg3);
	params[2].u.value.b = rpc_get_arg(current_driver_id, (uint32_t)arg4);

	sv_shadow_id(current_driver_id);

	res = thread_rpc_cmd(OPTEE_RPC_CMD_LDR_LINUX_BKWD_RPC, 3, &params);
	if (res != TEE_SUCCESS) {
		EMSG("ERROR: ldr msleep() linux rpc fails.");
	}

	sv_sync_id(current_driver_id, clean);
}
TEE_EXPORT_SYMBOL(ldr_redbench_sync_0);
TEE_EXPORT_SYMBOL(ldr_redbench_sync_1);
TEE_EXPORT_SYMBOL(ldr_redbench_sync_2);
TEE_EXPORT_SYMBOL(ldr_redbench_sync_3);
TEE_EXPORT_SYMBOL(ldr_redbench_sync_4);