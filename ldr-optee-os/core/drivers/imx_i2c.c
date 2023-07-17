// SPDX-License-Identifier: BSD-2-Clause
/*
 * (c) 2020 Jorge Ramirez <jorge@foundries.io>, Foundries Ltd.
 */
#include <arm.h>
#include <drivers/imx_i2c.h>
#include <initcall.h>
#include <io.h>
#include <kernel/delay.h>
#include <mm/core_memprot.h>
#include <mm/core_mmu.h>
#include <platform_config.h>
#include <stdlib.h>
#include <trace.h>
#include <util.h>

#include <registers/imx6.h>
#include <kernel/cache_helpers.h>
#include <ldr/ldr.h>

#define I2C_CLK_RATE	24000000 /* Bits per second */

static struct io_pa_va i2c_bus[] = {
	{ .pa = I2C1_BASE, },
	{ .pa = I2C2_BASE, },
	{ .pa = I2C3_BASE, },
};

register_phys_mem(MEM_AREA_IO_SEC, CCM_BASE, CCM_SIZE);

#define I2C_CLK_CGR(__x)	BM_CCM_CCGR2_I2C##__x##_SERIAL

static struct imx_i2c_clk {
	struct io_pa_va base;
	uint32_t i2c[ARRAY_SIZE(i2c_bus)];
} i2c_clk = {
	.base.pa = CCM_BASE,
	.i2c = { I2C_CLK_CGR(1), I2C_CLK_CGR(2), I2C_CLK_CGR(3), },
};

#define I2DR				0x10
#define I2SR				0x0C
#define I2CR				0x08
#define IFDR				0x04

#define I2CR_IEN			BIT(7)
#define I2CR_IIEN			BIT(6)
#define I2CR_MSTA			BIT(5)
#define I2CR_MTX			BIT(4)
#define I2CR_TX_NO_AK			BIT(3)
#define I2CR_RSTA			BIT(2)

#define I2SR_ICF			BIT(7)
#define I2SR_IBB			BIT(5)
#define I2SR_IAL			BIT(4)
#define I2SR_IIF			BIT(1)
#define I2SR_RX_NO_AK			BIT(0)

static uint8_t i2c_io_read8(uint8_t bid, uint32_t address)
{
	return io_read8(i2c_bus[bid].va + address);
}

static void i2c_io_write8(uint8_t bid, uint32_t address, uint8_t data)
{
	return io_write8(i2c_bus[bid].va + address, data);
}

static bool bus_is_idle(uint32_t sr)
{
	return (sr & I2SR_IBB) == 0;
}

static bool bus_is_busy(uint32_t sr)
{
	return !bus_is_idle(sr);
}

static bool isr_active(uint32_t sr)
{
	return (sr & I2SR_IIF) == I2SR_IIF;
}

static int i2c_imx_bus_busy(uint8_t bid, int for_busy) {
	unsigned int temp;
	unsigned int count = 1000;
	TEE_Result res = TEE_ERROR_GENERIC;

	while (count--) {
		temp = i2c_io_read8(bid, I2SR);
		if (temp & I2SR_IAL) {
			temp &= ~I2SR_IAL;
			i2c_io_write8(bid, I2SR, temp);
			return TEE_ERROR_GENERIC;
		}

		if (for_busy && (temp & I2SR_IBB)) 
			return TEE_SUCCESS;
		if (!for_busy && !(temp & I2SR_IBB))
			return TEE_SUCCESS;
	}

	return res;
}

static struct ifdr_pair {
	uint32_t divider;
	uint8_t prescaler;
} ifdr_table[] = {
	{ 22,	0x20 }, { 24,	0x21 }, { 26,	0x22 }, { 28,	0x23 },
	{ 30,	0x00 }, { 32,	0x24 }, { 36,	0x25 }, { 40,	0x26 },
	{ 42,	0x03 }, { 44,	0x27 }, { 48,	0x28 }, { 52,	0x05 },
	{ 56,	0x29 }, { 60,	0x06 }, { 64,	0x2A }, { 72,	0x2B },
	{ 80,	0x2C }, { 88,	0x09 }, { 96,	0x2D }, { 104,	0x0A },
	{ 112,	0x2E }, { 128,	0x2F }, { 144,	0x0C }, { 160,	0x30 },
	{ 192,	0x31 }, { 224,	0x32 }, { 240,	0x0F }, { 256,	0x33 },
	{ 288,	0x10 }, { 320,	0x34 }, { 384,	0x35 }, { 448,	0x36 },
	{ 480,	0x13 }, { 512,	0x37 }, { 576,	0x14 }, { 640,	0x38 },
	{ 768,	0x39 }, { 896,	0x3A }, { 960,	0x17 }, { 1024,	0x3B },
	{ 1152,	0x18 }, { 1280,	0x3C }, { 1536,	0x3D }, { 1792,	0x3E },
	{ 1920,	0x1B }, { 2048,	0x3F }, { 2304,	0x1C }, { 2560,	0x1D },
	{ 3072,	0x1E }, { 3840,	0x1F }
};

static void i2c_set_prescaler(uint8_t bid, uint32_t bps)
{
	struct ifdr_pair *p = ifdr_table;
	struct ifdr_pair *q = p + ARRAY_SIZE(ifdr_table) - 1;
	uint32_t div = (I2C_CLK_RATE + bps - 1) / bps;

	if (div < p->divider)
		q = p;
	else if (div > q->divider)
		p = q;

	while (p != q) {
		if (div <= p->divider)
			break;
		p++;
	}

	i2c_io_write8(bid, IFDR, p->prescaler);
}

static void i2c_set_bus_speed(uint8_t bid, int bps)
{
	/* Enable the clock */
	uint32_t tmp;

	/* CCM_CCGR2 contains clock contrl info for i2c1, i2c2 and i2c3. */
	tmp = io_read32(i2c_clk.base.va + CCM_CCGR2);

	/* alway-on for all three i2c buses */
	if (bid == 0) {
		io_write32(i2c_clk.base.va + CCM_CCGR2, I2C_CLK_CGR(1) | tmp);
	} else if (bid == 1) {
		io_write32(i2c_clk.base.va + CCM_CCGR2, I2C_CLK_CGR(2) | tmp);
	} else {
		io_write32(i2c_clk.base.va + CCM_CCGR2, I2C_CLK_CGR(3) | tmp);
	}

	i2c_set_prescaler(bid, bps);
}

static TEE_Result i2c_sync_bus(uint8_t bid, bool (*match)(uint32_t),
			       uint32_t *status)
{
	uint64_t tref;
	uint32_t sr = 0;

	// tref = timeout_init_us(100000);
	/* we need enough time for i2c sync */
	size_t count = 5000;

	// while (!timeout_elapsed(tref)) {
	while (count--) {
		// DMSG("remaining count: %d", count);
		sr = i2c_io_read8(bid, I2SR);
		if (sr & I2SR_IAL) {
			EMSG("ERROR: bus arbitration lost");
			i2c_io_write8(bid, I2SR, sr & ~I2SR_IAL);
			return TEE_ERROR_COMMUNICATION;
		}
		if ((*match)(sr)) {
			if (status)
				*status = sr;
			return TEE_SUCCESS;
		}
	}

	return TEE_ERROR_BUSY;
}

static TEE_Result i2c_idle_bus(uint8_t bid)
{
	uint8_t tmp = i2c_io_read8(bid, I2CR) & ~I2CR_MSTA;
	TEE_Result ret = TEE_SUCCESS;

	i2c_io_write8(bid, I2CR, tmp);
	ret = i2c_sync_bus(bid, bus_is_idle, NULL);
	i2c_io_write8(bid, I2SR, 0);

	return ret;
}

static TEE_Result i2c_write_byte(uint8_t bid, uint8_t byte)
{
	TEE_Result ret = TEE_SUCCESS;
	uint32_t status = 0;

	i2c_io_write8(bid, I2DR, byte);
	ret = i2c_sync_bus(bid, isr_active, &status);
	i2c_io_write8(bid, I2SR, 0);

	if (ret == TEE_SUCCESS && (status & I2SR_RX_NO_AK))
		return TEE_ERROR_BAD_STATE;

	return ret;
}

static TEE_Result i2c_read_byte(uint8_t bid, uint8_t *p)
{
	TEE_Result ret = TEE_SUCCESS;

	*p = i2c_io_read8(bid, I2DR);
	ret = i2c_sync_bus(bid, isr_active, NULL);
	i2c_io_write8(bid, I2SR, 0);

	return ret;
}

static TEE_Result i2c_write_data(uint8_t bid, const uint8_t *buf, int len)
{
	TEE_Result ret = TEE_SUCCESS;
	uint32_t tmp = 0;

	if (!len)
		return TEE_SUCCESS;

	tmp = i2c_io_read8(bid, I2CR) | I2CR_MTX | I2CR_TX_NO_AK;
	i2c_io_write8(bid, I2CR, tmp);

	while (len--) {
		ret = i2c_write_byte(bid, *buf++);
		if (ret != TEE_SUCCESS)
			return ret;
	}

	return ret;
}

static TEE_Result i2c_read_data(uint8_t bid, uint8_t *buf, int len, 
				bool is_lastmsg)
{
	TEE_Result ret = TEE_SUCCESS;
	uint8_t dummy = 0;
	uint32_t tmp = 0;

	if (!len)
		return TEE_SUCCESS;

	tmp = i2c_io_read8(bid, I2CR) & ~I2CR_MTX;
	tmp = (len == 1) ? tmp | I2CR_TX_NO_AK : tmp & ~I2CR_TX_NO_AK;
	i2c_io_write8(bid, I2CR, tmp);
	i2c_io_read8(bid, I2DR);

	ret = i2c_read_byte(bid, &dummy);
	if (ret != TEE_SUCCESS)
		return ret;

	/*
	 * A data transfer ends when the master signals a stop; for a master
	 * receiver to terminate a transfer it must inform the slave transmiter
	 * by not acknowledging the last data byte. This is done by setting the
	 * transmit acknowledge bit before reading the next-to-last byte.
	 */
	do {
		if (len == 2 && is_lastmsg) {
			tmp = i2c_io_read8(bid, I2CR) | I2CR_TX_NO_AK;
			i2c_io_write8(bid, I2CR, tmp);
		}

		ret = i2c_read_byte(bid, buf++);
		if (ret != TEE_SUCCESS)
			return ret;
	} while (len--);

	return ret;
}

TEE_Result imx_i2c_read(uint8_t bid, uint8_t chip, 
			uint8_t *buf, int len, bool is_lastmsg)
{
	TEE_Result ret = TEE_SUCCESS;

	if (bid >= ARRAY_SIZE(i2c_bus))
		return TEE_ERROR_BAD_PARAMETERS;

	if ((len && !buf) || chip > 0x7F)
		return TEE_ERROR_BAD_PARAMETERS;

	ret = i2c_read_data(bid, buf, len, is_lastmsg);

	return ret;
}

TEE_Result imx_i2c_write(uint8_t bid, uint8_t chip, const uint8_t *buf, int len)
{
	TEE_Result ret = TEE_SUCCESS;

	if (bid >= ARRAY_SIZE(i2c_bus))
		return TEE_ERROR_BAD_PARAMETERS;

	if ((len && !buf) || chip > 0x7F)
		return TEE_ERROR_BAD_PARAMETERS;

	ret = i2c_write_data(bid, buf, len);

	return ret;
}

TEE_Result imx_i2c_probe(uint8_t bid, uint8_t chip)
{
	if (bid >= ARRAY_SIZE(i2c_bus))
		return TEE_ERROR_BAD_PARAMETERS;

	if (chip > 0x7F)
		return TEE_ERROR_BAD_PARAMETERS;

	imx_i2c_init(bid, I2C_CLK_RATE);

	// return imx_i2c_write(bid, chip, NULL, 0);
	return 0;
}
TEE_EXPORT_SYMBOL(imx_i2c_probe);

static int imx_xfer_read(uint8_t bid, struct i2c_msg *msgs, bool is_lastmsg) {
	TEE_Result res;
	int i;
	unsigned int temp;
	uint8_t dummy;

	/* write slave address */
	temp = i2c_io_read8(bid, I2CR) | I2CR_MTX | I2CR_TX_NO_AK;
	i2c_io_write8(bid, I2CR, temp);

	res = i2c_write_byte(bid, (msgs->addr << 1) | 0x01);
	if (res != TEE_SUCCESS) {
		EMSG("ERROR: slave address set fail.");
		return res;
	}

	/* setup bus to read data */
	temp = i2c_io_read8(bid, I2CR);
	temp &= ~I2CR_MTX;

	/*
	 * Reset the I2CR_TXAK flag initially for SMBus block read since the
	 * length is unknown
	 */
	if ((msgs->len - 1))
		temp &= ~I2CR_TX_NO_AK;
	else
		temp |= I2CR_TX_NO_AK;
	i2c_io_write8(bid, I2CR, temp);

	/* dummy read */
	i2c_io_read8(bid, I2DR);
	res = i2c_read_byte(bid, &dummy);
	if (res != TEE_SUCCESS) {
		EMSG("ERROR: dummy read fail.");
		return res;
	}

	/* read data */
	for (i = 0; i < msgs->len; i++) {
		if (i == (msgs->len - 2)) {
			temp = i2c_io_read8(bid, I2CR);
			temp |= I2CR_TX_NO_AK;
			i2c_io_write8(bid, I2CR, temp);
		}

		res = i2c_read_byte(bid, &msgs->buf[i]);
		if (res != TEE_SUCCESS) {
			EMSG("ERROR: data read fail.");
			return res;
		}

		// DMSG("%x", msgs->buf[i]);

		// msgs->buf[i] = i2c_io_read8(bid, I2DR);
	}

	// dhex_dump(NULL, 0, 0, msgs->buf, msgs->len);

	return TEE_SUCCESS;
}

static int imx_xfer_write(uint8_t bid, struct i2c_msg *msgs) {
	TEE_Result res;
	int i;
	unsigned int temp;
	uint32_t status = 0;

	/* write slave address */
	temp = i2c_io_read8(bid, I2CR) | I2CR_MTX | I2CR_TX_NO_AK;
	i2c_io_write8(bid, I2CR, temp);

	res = i2c_write_byte(bid, (msgs->addr << 1) | 0x00);
	if (res != TEE_SUCCESS) {
		EMSG("ERROR: slave address set fail.");
		return res;
	}

	/* write data */
	for (i = 0; i < msgs->len; i++) {
		res = i2c_write_byte(bid, msgs->buf[i]);
		if (res != TEE_SUCCESS) {
			EMSG("ERROR: write byte%d fails.", i);
			return res;
		}
	}

	return TEE_SUCCESS;
}

static TEE_Result i2c_init_transfer(uint8_t bid)
{
	TEE_Result res = TEE_SUCCESS;
	uint32_t tmp = 0;

	// res = imx_i2c_init(bid, I2C_CLK_RATE);
	// if (res != TEE_SUCCESS) {
	// 	EMSG("ERROR: imx i2c%d initializaiton fails.", bid + 1);
	// 	return TEE_ERROR_GENERIC;
	// } else {
	// 	IMSG("imx i2c%d initialization success.", bid + 1);
	// }

	res = i2c_imx_bus_busy(bid, 0);
	if (res != TEE_SUCCESS) {
		EMSG("ERROR: bus is busy.");
		return res;
	}

	i2c_io_write8(bid, I2CR, I2CR_IEN);
	i2c_io_write8(bid, I2SR, 0x00);
	res = i2c_imx_bus_busy(bid, 0);
	if (res != TEE_SUCCESS) {
		EMSG("ERROR: bus is busy.");
		return res;
	}

	/* start I2C transaction */
	tmp = i2c_io_read8(bid, I2CR) | I2CR_MSTA;
	i2c_io_write8(bid, I2CR, tmp);
	res = i2c_imx_bus_busy(bid, 1);
	if (res != TEE_SUCCESS) {
		EMSG("ERROR: bus is not active (not busy).");
		return res;
	}

	return TEE_SUCCESS;
}

static TEE_Result i2c_fini_transfer(uint8_t bid) {
	unsigned int temp = 0;
	TEE_Result res = TEE_SUCCESS;

	temp = i2c_io_read8(bid, I2CR);
	temp &= ~(I2CR_MSTA | I2CR_MTX);
	i2c_io_write8(bid, I2CR, temp);

	res = i2c_imx_bus_busy(bid, 0);
	if (res != TEE_SUCCESS) {
		EMSG("ERROR: bus is not idle.");
		return res;
	}

	return TEE_SUCCESS;
}

int imx_i2c_transfer(uint8_t bid, struct i2c_msg *msgs, int num) {
	unsigned int i, temp;
	int result;
	bool is_lastmsg = false;

	uint32_t exceptions = thread_mask_exceptions(THREAD_EXCP_ALL);

	result = i2c_init_transfer(bid);
	if (result != TEE_SUCCESS) {
		EMSG("ERROR: i2c_init_transfer() fails.");
		return TEE_ERROR_GENERIC;
	}

	/* read/write data */
	for (i = 0; i < num; i++) {
		if (i == num - 1) {
			is_lastmsg = true;
		}

		if (i) {
			temp = i2c_io_read8(bid, I2CR);
			temp |= I2CR_RSTA;
			i2c_io_write8(bid, I2CR, temp);
			result = i2c_imx_bus_busy(bid, 1);
			if (result)
				goto ret;
		}

		if (msgs[i].flags & I2C_M_RD) {
			result = imx_xfer_read(bid, &msgs[i], is_lastmsg);
		} else {
			result = imx_xfer_write(bid, &msgs[i]);
		}

		if (result != TEE_SUCCESS) {
			EMSG("ERROR: during imx i2c %s for msg%d.", 
			      msgs[i].flags & I2C_M_RD ? "read" : "write", i);
			goto ret;
		}
	}

ret:
	result = i2c_fini_transfer(bid);
	if (result != TEE_SUCCESS) {
		EMSG("ERROR: i2c_fini_transfer() fails.");
		return TEE_ERROR_GENERIC;
	}

	thread_set_exceptions(exceptions);

	return result;
}

/*
 * I2C bus initialization: configure the IOMUX and enable the clock.
 * @bid: Bus ID: (0=I2C1), (1=I2C2), (2=I2C3).
 * @bps: Bus baud rate, in bits per second.
 */
TEE_Result imx_i2c_init(uint8_t bid, int bps)
{
	if (bid >= ARRAY_SIZE(i2c_bus))
		return TEE_ERROR_BAD_PARAMETERS;

	if (!bps)
		return TEE_ERROR_BAD_PARAMETERS;

	/* Baud rate in bits per second */
	i2c_set_bus_speed(bid, bps);

	return TEE_SUCCESS;
}

static TEE_Result get_va(paddr_t pa, vaddr_t *va)
{
	if (!core_mmu_add_mapping(MEM_AREA_IO_SEC, pa, 0x10000))
		return TEE_ERROR_GENERIC;

	*va = (vaddr_t)phys_to_virt(pa, MEM_AREA_IO_SEC);
	if (*va)
		return TEE_SUCCESS;

	return TEE_ERROR_GENERIC;
}

static TEE_Result i2c_init(void)
{
	size_t n = 0;
	TEE_Result res;

	if (get_va(i2c_clk.base.pa, &i2c_clk.base.va) != TEE_SUCCESS)
		return TEE_ERROR_GENERIC;

	for (n = 0; n < ARRAY_SIZE(i2c_bus); n++) {
		if (get_va(i2c_bus[n].pa, &i2c_bus[n].va) != TEE_SUCCESS)
			return TEE_ERROR_GENERIC;
	}

	res = imx_i2c_init(0, I2C_CLK_RATE);
	if (res != TEE_SUCCESS) {
		EMSG("ERROR: imx i2c1 initializaiton fails.");
		return TEE_ERROR_GENERIC;
	} else {
		IMSG("imx i2c1 initialization success.");
	}

	res = imx_i2c_init(1, I2C_CLK_RATE);
	if (res != TEE_SUCCESS) {
		EMSG("ERROR: imx i2c2 initializaiton fails.");
		return TEE_ERROR_GENERIC;
	} else {
		IMSG("imx i2c2 initialization success.");
	}

	res = imx_i2c_init(2, I2C_CLK_RATE);
	if (res != TEE_SUCCESS) {
		EMSG("ERROR: imx i2c3 initializaiton fails.");
		return TEE_ERROR_GENERIC;
	} else {
		IMSG("imx i2c3 initialization success.");
	}

	return TEE_SUCCESS;
}

driver_init(i2c_init);
