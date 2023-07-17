/* SPDX-License-Identifier: BSD-2-Clause */
/*
 * Copyright (C) 2020 Foundries.io
 * Jorge Ramirez-Ortiz <jorge@foundries.io>
 */
#ifndef __DRIVERS_IMX_I2C_H
#define __DRIVERS_IMX_I2C_H

#include <stdint.h>
#include <tee_api_types.h>

struct i2c_client {
	unsigned short flags;		/* div., see below		*/
	unsigned short addr;		/* chip address - NOTE: 7bit	*/
					/* addresses are stored in the	*/
					/* _LOWER_ 7 bits		*/
	unsigned short bid;		/* bus id			*/
};

struct i2c_msg {
	uint16_t addr;	/* slave address			*/
	uint16_t flags;
#define I2C_M_RD		0x0001	/* read data, from slave to master */
					/* I2C_M_RD is guaranteed to be 0x0001! */
#define I2C_M_TEN		0x0010	/* this is a ten bit chip address */
#define I2C_M_RECV_LEN		0x0400	/* length will be first received byte */
#define I2C_M_NO_RD_ACK		0x0800	/* if I2C_FUNC_PROTOCOL_MANGLING */
#define I2C_M_IGNORE_NAK	0x1000	/* if I2C_FUNC_PROTOCOL_MANGLING */
#define I2C_M_REV_DIR_ADDR	0x2000	/* if I2C_FUNC_PROTOCOL_MANGLING */
#define I2C_M_NOSTART		0x4000	/* if I2C_FUNC_NOSTART */
#define I2C_M_STOP		0x8000	/* if I2C_FUNC_PROTOCOL_MANGLING */
	uint16_t len;		/* msg length				*/
	uint8_t *buf;		/* pointer to msg data			*/
};

/*
 * Data for SMBus Messages
 */
#define I2C_SMBUS_BLOCK_MAX	32	/* As specified in SMBus standard */
union i2c_smbus_data {
	uint8_t byte;
	uint16_t word;
	uint8_t block[I2C_SMBUS_BLOCK_MAX + 2]; /* block[0] is used for length */
			       /* and one more for user-space compatibility */
};

/* i2c_smbus_xfer read or write markers */
#define I2C_SMBUS_READ	1
#define I2C_SMBUS_WRITE	0

/* SMBus transaction types (size parameter in the above functions)
   Note: these no longer correspond to the (arbitrary) PIIX4 internal codes! */
#define I2C_SMBUS_QUICK		    0
#define I2C_SMBUS_BYTE		    1
#define I2C_SMBUS_BYTE_DATA	    2
#define I2C_SMBUS_WORD_DATA	    3
#define I2C_SMBUS_PROC_CALL	    4
#define I2C_SMBUS_BLOCK_DATA	    5
#define I2C_SMBUS_I2C_BLOCK_BROKEN  6
#define I2C_SMBUS_BLOCK_PROC_CALL   7		/* SMBus 2.0 */
#define I2C_SMBUS_I2C_BLOCK_DATA    8

TEE_Result imx_i2c_write(uint8_t bid, uint8_t chip, const uint8_t *p, int l);
TEE_Result imx_i2c_read(uint8_t bid, uint8_t chip, 
			uint8_t *buf, int len, bool is_lastmsg);
TEE_Result imx_i2c_probe(uint8_t bid, uint8_t chip);
TEE_Result imx_i2c_init(uint8_t bid, int bps);
int imx_i2c_transfer(uint8_t bid, struct i2c_msg *msgs, int num);

#endif /*__DRIVERS_IMX_I2C_H*/
