/**
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
#include <optee_rpc_cmd.h>
#include <drivers/imx_i2c.h>
#include <kernel/cache_helpers.h>
#include <drivers/imx_gpt.h>

#include <ldr/ldr.h>

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

int32_t i2c_smbus_read_i2c_block_data(const struct i2c_client *client, uint8_t command,
				  uint8_t length, uint8_t *values)
{
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
	params[0].u.value.b = NW_i2c_smbus_read_i2c_block_data;
	params[0].u.value.c = 1;

	params[1].u.value.a = 0x00;
	params[1].u.value.b = client;
	params[1].u.value.c = command;

	params[2].u.value.a = length;
	params[2].u.value.b = LFC_NW_STACK_ADDR;

	res = thread_rpc_cmd(OPTEE_RPC_CMD_LDR_LINUX_BKWD_RPC, 3, &params);
	if (res != TEE_SUCCESS) {
		EMSG("ERROR: i2c_smbus_read_i2c_block_data().");
	}

	res = params[2].u.value.c;

	return res;
}

int32_t i2c_smbus_read_byte_data(const struct i2c_client *client, uint8_t command) {
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
	params[0].u.value.b = NW_i2c_smbus_read_byte_data;
	params[0].u.value.c = 1;

	params[1].u.value.a = 0x00;
	params[1].u.value.b = client;
	params[1].u.value.c = command;

	params[2].u.value.a = 0;
	params[2].u.value.b = 0;

	res = thread_rpc_cmd(OPTEE_RPC_CMD_LDR_LINUX_BKWD_RPC, 3, &params);
	if (res != TEE_SUCCESS) {
		EMSG("ERROR: i2c_smbus_read_byte_data().");
	}

	res = params[2].u.value.c;

	return res;
}

int32_t i2c_smbus_write_byte_data(const struct i2c_client *client, uint8_t command,
			      uint8_t value)
{
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
	params[0].u.value.b = NW_i2c_smbus_write_byte_data;
	params[0].u.value.c = 1;

	params[1].u.value.a = 0x00;
	params[1].u.value.b = client;
	params[1].u.value.c = command;

	params[2].u.value.a = value;
	params[2].u.value.b = 0;

	res = thread_rpc_cmd(OPTEE_RPC_CMD_LDR_LINUX_BKWD_RPC, 3, &params);
	if (res != TEE_SUCCESS) {
		EMSG("ERROR: i2c_smbus_write_byte_data().");
	}

	res = params[2].u.value.c;

	return res;
}

TEE_EXPORT_SYMBOL(i2c_smbus_read_i2c_block_data);
TEE_EXPORT_SYMBOL(i2c_smbus_read_byte_data);
TEE_EXPORT_SYMBOL(i2c_smbus_write_byte_data);
