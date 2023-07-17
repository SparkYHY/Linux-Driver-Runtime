/*
 * Copyright 2017 NXP
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */
#include <linux/clk.h>
#include <linux/interrupt.h>
#include <linux/kernel.h>
#include <linux/mfd/syscon.h>
#include <linux/module.h>
#include <linux/of.h>
#include <linux/platform_device.h>
#include <linux/timer.h>
#include <linux/version.h>
#include <linux/workqueue.h>
#include <linux/kthread.h>
#include <linux/freezer.h>
#include <media/cec.h>
#include <soc/imx8/soc.h>

#include "imx-hdp-cec.h"

#define CEC_NAME	"hdp-cec"

#define REG_ADDR_OFF 1

#define MAX_LA_IDX 4
#define MAX_LA_VAL 15

/**
 * Maximum number of Messages in the RX Buffers.
 */
# define CEC_MAX_RX_MSGS 2

#define set_la F_MY_LOG_ADDR0
#define get_la F_MY_LOG_ADDR0_RD
#define set_la_valid F_LOG_ADDR_VALID0
#define get_la_valid F_LOG_ADDR_VALID0_RD

u32 cec_read(struct imx_cec_dev *cec, u32 offset)
{
	u32 addr = (offset << 2) + ADDR_HDP_CEC_BASE;
	u32 value;

	cec->rw->read_reg(cec->mem, addr, &value);
	return value;
}

void cec_write(struct imx_cec_dev *cec, u32 offset, u32 value)
{
	u32 addr = (offset << 2) + ADDR_HDP_CEC_BASE;

	cec->rw->write_reg(cec->mem, addr, value);
}

void cec_clear_rx_buffer(struct imx_cec_dev *cec)
{
	cec_write(cec, RX_CLEAR_BUF, 1);
	cec_write(cec, RX_CLEAR_BUF, 0);
}

void cec_set_divider(struct imx_cec_dev *cec)
{
	/* Set clock divider */
	if (cec->clk_div == 0) {
		dev_warn(cec->dev,
			 "Warning. Clock divider is 0. Changing to 1.\n");
		cec_write(cec, CLK_DIV_MSB, 0);
		cec_write(cec, CLK_DIV_LSB, 1);
	} else {
		cec_write(cec, CLK_DIV_MSB,
			  (cec->clk_div >> 8) & 0xFF);
		cec_write(cec, CLK_DIV_LSB, cec->clk_div & 0xFF);
	}
}

u32 cec_read_message(struct imx_cec_dev *cec)
{
	struct cec_msg *msg = &cec->msg;
	int len;
	int i;

	cec_write(cec, RX_MSG_CMD, CEC_RX_READ);

	len = cec_read(cec, RX_MSG_LENGTH);
	msg->len = len + 1;
	dev_dbg(cec->dev, "RX MSG len =%d\n", len);

	/* Read RX MSG bytes */
	for (i = 0; i < msg->len; ++i) {
		msg->msg[i] = (u8) cec_read(cec, RX_MSG_DATA1 + (i * REG_ADDR_OFF));
		dev_dbg(cec->dev, "RX MSG[%d]=0x%x\n", i, msg->msg[i]);
	}

	cec_write(cec, RX_MSG_CMD, CEC_RX_STOP);

	return true;
}

u32 cec_write_message(struct imx_cec_dev *cec, struct cec_msg *msg)
{
	u8 i;

	cec_write(cec, TX_MSG_CMD, CEC_TX_STOP);

	if (msg->len > CEC_MAX_MSG_SIZE) {
		dev_err(cec->dev, "Invalid MSG size!\n");
		return -EINVAL;
	}

	/* Write Message to register */
	for (i = 0; i < msg->len; ++i) {
		cec_write(cec, TX_MSG_HEADER + (i * REG_ADDR_OFF),
			  msg->msg[i]);
	}
	/* Write Message Length (payload + opcode) */
	cec_write(cec, TX_MSG_LENGTH, msg->len - 1);

	cec_write(cec, TX_MSG_CMD, CEC_TX_TRANSMIT);

	return true;
}

void cec_abort_tx_transfer(struct imx_cec_dev *cec)
{
	cec_write(cec, TX_MSG_CMD, CEC_TX_ABORT);
	cec_write(cec, TX_MSG_CMD, CEC_TX_STOP);
}

u32 imx_cec_set_logical_addr(struct imx_cec_dev *cec, u32 la)
{
	u8 i;
	u8 la_reg;

	if (la >= MAX_LA_VAL) {
		dev_err(cec->dev, "Error logical Addr\n");
		return -EINVAL;
	}

	for (i = 0; i < MAX_LA_IDX; ++i) {
		la_reg =
		    cec_read(cec, LOGICAL_ADDRESS_LA0 + (i * REG_ADDR_OFF));

		if (get_la_valid(la_reg))
			continue;

		if (get_la(la_reg) == la) {
			dev_warn(cec->dev, "Warning. LA already in use.\n");
			return true;
		}

		la = set_la(la) | set_la_valid(1);

		cec_write(cec, LOGICAL_ADDRESS_LA0 + (i * REG_ADDR_OFF), la);
		return true;
	}

	dev_warn(cec->dev, "All LA in use\n");

	return false;
}

static int cec_poll_worker(void *_cec)
{
	struct imx_cec_dev *cec = (struct imx_cec_dev *)_cec;
	int num_rx_msgs, i;
	int sts;

	set_freezable();

	for (;;) {
		if (kthread_freezable_should_stop(NULL))
			break;

		/* Check TX State */
		sts = cec_read(cec, TX_MSG_STATUS);
		switch (sts) {
		case CEC_STS_SUCCESS:
			cec_transmit_done(cec->adap, CEC_TX_STATUS_OK, 0, 0, 0,
					  0);
			cec_write(cec, TX_MSG_CMD, CEC_TX_STOP);
			break;
		case CEC_STS_ERROR:
			cec_write(cec, TX_MSG_CMD, CEC_TX_STOP);
			cec_transmit_done(cec->adap,
					  CEC_TX_STATUS_MAX_RETRIES |
					  CEC_TX_STATUS_ERROR, 0, 0, 0, 1);
			break;
		case CEC_STS_BUSY:
		default:
			break;
		}

		/* Check RX State */
		sts = cec_read(cec, RX_MSG_STATUS);
		num_rx_msgs = cec_read(cec, NUM_OF_MSG_RX_BUF);
		switch (sts) {
		case CEC_STS_SUCCESS:
			if (num_rx_msgs == 0xf)
				num_rx_msgs = CEC_MAX_RX_MSGS;

			if (num_rx_msgs > CEC_MAX_RX_MSGS) {
				dev_err(cec->dev, "Error rx msg num %d\n",
					num_rx_msgs);
				cec_clear_rx_buffer(cec);
				break;
			}

			/* Rx FIFO Depth 2 RX MSG */
			for (i = 0; i < num_rx_msgs; i++) {
				cec_read_message(cec);
				cec->msg.rx_status = CEC_RX_STATUS_OK;
				cec_received_msg(cec->adap, &cec->msg);
			}
			break;
		default:
			break;
		}

		if (!kthread_should_stop())
			schedule_timeout_idle(20);
	}

	return 0;
}

static int imx_cec_adap_enable(struct cec_adapter *adap, bool enable)
{
	struct imx_cec_dev *cec = adap->priv;

	if (enable) {
		cec_write(cec, DB_L_TIMER, 0x10);
		cec_set_divider(cec);
	} else {
		cec_set_divider(cec);
	}

	return 0;
}

static int imx_cec_adap_log_addr(struct cec_adapter *adap, u8 addr)
{
	struct imx_cec_dev *cec = adap->priv;

	imx_cec_set_logical_addr(cec, addr);
	return 0;
}

static int imx_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
				 u32 signal_free_time, struct cec_msg *msg)
{
	struct imx_cec_dev *cec = adap->priv;

	cec_write_message(cec, msg);

	return 0;
}

static const struct cec_adap_ops imx_cec_adap_ops = {
	.adap_enable = imx_cec_adap_enable,
	.adap_log_addr = imx_cec_adap_log_addr,
	.adap_transmit = imx_cec_adap_transmit,
};

int imx_cec_register(struct imx_cec_dev *cec)
{
	struct device *dev = cec->dev;
	int ret;

	cec->adap = cec_allocate_adapter(&imx_cec_adap_ops, cec,
					 CEC_NAME,
					 CEC_CAP_PHYS_ADDR | CEC_CAP_LOG_ADDRS |
					 CEC_CAP_TRANSMIT | CEC_CAP_PASSTHROUGH
					 | CEC_CAP_RC, 1);
	ret = PTR_ERR_OR_ZERO(cec->adap);
	if (ret)
		return ret;
	ret = cec_register_adapter(cec->adap, dev);
	if (ret) {
		cec_delete_adapter(cec->adap);
		return ret;
	}

	cec->dev = dev;

	cec->cec_worker = kthread_create(cec_poll_worker, cec, "hdp-cec");
	if (IS_ERR(cec->cec_worker))
		dev_err(cec->dev, "failed  create hdp cec thread\n");

	wake_up_process(cec->cec_worker);

	dev_dbg(dev, "CEC successfuly probed\n");
	return 0;
}

int imx_cec_unregister(struct imx_cec_dev *cec)
{
	if (cec->cec_worker) {
		kthread_stop(cec->cec_worker);
		cec->cec_worker = NULL;
	}
	cec_unregister_adapter(cec->adap);
	return 0;
}

MODULE_AUTHOR("Sandor.Yu@NXP.com");
MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("NXP IMX HDP CEC driver");
