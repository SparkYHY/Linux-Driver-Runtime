
#include <arm.h>
#include <drivers/imx_i2c.h>
#include <initcall.h>
#include <io.h>
#include <kernel/delay.h>
#include <kernel/export.h>
#include <mm/core_memprot.h>
#include <mm/core_mmu.h>
#include <platform_config.h>
#include <stdlib.h>
#include <string.h>
#include <string_ext.h>
#include <trace.h>
#include <util.h>
#include <ldr/ldr_dac.h>

static int32_t i2c_smbus_xfer_emulated(uint16_t bid, uint16_t addr, unsigned short flags,
				   char read_write, uint8_t command, 
				   int protocol, union i2c_smbus_data *data) 
{
	unsigned char msgbuf0[I2C_SMBUS_BLOCK_MAX+3];
	unsigned char msgbuf1[I2C_SMBUS_BLOCK_MAX+2];
	int num = read_write == I2C_SMBUS_READ ? 2 : 1;
	int i;
	int status;
	struct i2c_msg msg[2] = {
		{
			.addr = addr,
			.flags = flags,
			.len = 1,
			.buf = msgbuf0,
		}, {
			.addr = addr,
			.flags = flags | I2C_M_RD,
			.len = 0,
			.buf = msgbuf1,
		},
	};

	msgbuf0[0] = command;
	switch (protocol) {
	case I2C_SMBUS_BYTE_DATA:
		if (read_write == I2C_SMBUS_READ)
			msg[1].len = 1;
		else {
			msg[0].len = 2;
			msgbuf0[1] = data->byte;
		}
		break;

	case I2C_SMBUS_I2C_BLOCK_DATA:
		if (data->block[0] > I2C_SMBUS_BLOCK_MAX) {
			EMSG("Invalid block %s size %d\n",
				read_write == I2C_SMBUS_READ ? "read" : "write",
				data->block[0]);
			return TEE_ERROR_BAD_PARAMETERS;
		}

		if (read_write == I2C_SMBUS_READ) {
			msg[1].len = data->block[0];
		} else {
			msg[0].len = data->block[0] + 1;
			for (i = 1; i <= data->block[0]; i++)
				msgbuf0[i] = data->block[i];
		}
		break;

	default:
		EMSG("ERROR: Unsupported transaction %d.", protocol);
		return TEE_ERROR_BAD_PARAMETERS;
	}

	status = imx_i2c_transfer(bid, msg, num);
	if (status < 0)
		return status;

	if (read_write == I2C_SMBUS_READ)
		switch (protocol) {
		case I2C_SMBUS_BYTE_DATA:
			data->byte = msgbuf1[0];
			break;
		case I2C_SMBUS_I2C_BLOCK_DATA:
			for (i = 0; i < data->block[0]; i++)
				data->block[i+1] = msgbuf1[i];
			break;
		}

	return 0;
}

// int32_t i2c_smbus_read_i2c_block_data(const struct i2c_client *client, uint8_t command,
// 				  uint8_t length, uint8_t *values)
// {
// 	union i2c_smbus_data data;
// 	int status;
// 	int32_t res;

// 	if (length > I2C_SMBUS_BLOCK_MAX)
// 		length = I2C_SMBUS_BLOCK_MAX;
// 	data.block[0] = length;
// 	status = i2c_smbus_xfer_emulated(client->bid, client->addr, client->flags,
// 				I2C_SMBUS_READ, command,
// 				I2C_SMBUS_I2C_BLOCK_DATA, &data);
// 	if (status < 0)
// 		return status;

// 	memcpy(values, &data.block[1], data.block[0]);

// 	res = data.block[0];

// 	return res;
// }

// int32_t i2c_smbus_read_byte_data(const struct i2c_client *client, uint8_t command)
// {
// 	union i2c_smbus_data data;
// 	int status;
// 	int32_t res;

// 	status = i2c_smbus_xfer_emulated(client->bid, client->addr, client->flags,
// 				I2C_SMBUS_READ, command,
// 				I2C_SMBUS_BYTE_DATA, &data);
// 	res = (status < 0) ? status : data.byte;

// 	return res;
// }

// int32_t i2c_smbus_write_byte_data(const struct i2c_client *client, uint8_t command,
// 			      uint8_t value)
// {
// 	union i2c_smbus_data data;
// 	int32_t res;

// 	data.byte = value;
// 	res = i2c_smbus_xfer_emulated(client->bid, client->addr, client->flags,
// 			      I2C_SMBUS_WRITE, command,
// 			      I2C_SMBUS_BYTE_DATA, &data);

// 	return res;
// }

// TEE_EXPORT_SYMBOL(i2c_smbus_read_i2c_block_data);
// TEE_EXPORT_SYMBOL(i2c_smbus_read_byte_data);
// TEE_EXPORT_SYMBOL(i2c_smbus_write_byte_data);