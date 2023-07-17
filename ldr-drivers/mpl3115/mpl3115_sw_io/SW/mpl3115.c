/*
 *  Copyright (C) 2010-2015 Freescale , Inc. All Rights Reserved.
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 */

#include <linux/module.h>
#include <linux/init.h>
#include <linux/slab.h>
#include <linux/i2c.h>
#include <linux/pm.h>
#include <linux/mutex.h>
#include <linux/delay.h>
#include <linux/interrupt.h>
#include <linux/irq.h>
#include <linux/hwmon-sysfs.h>
#include <linux/err.h>
#include <linux/hwmon.h>
#include <linux/input-polldev.h>

#include "dispatcher.h"

#define MPL3115_DRV_NAME			"mpl3115"
#define ABS_TEMPTERAURE				ABS_MISC

#define INPUT_FUZZ				32
#define INPUT_FLAT				32
#define MPL_ACTIVED    		 		1
#define MPL_STANDBY 				0
#define POLL_INTERVAL_MAX			500
#define POLL_INTERVAL				100
#define POLL_INTERVAL_MIN			1
#define MPL3115_ID				0xc4
#define MPLL_ACTIVE_MASK       			0x01
#define MPL3115_STATUS_DR			0x08

/* MPL3115A register address */
#define MPL3115_STATUS				0x00
#define MPL3115_PRESSURE_DATA			0x01
#define MPL3115_DR_STATUS			0x06
#define MPL3115_DELTA_DATA			0x07
#define MPL3115_WHO_AM_I			0x0c
#define MPL3115_FIFO_STATUS 			0x0d
#define MPL3115_FIFO_DATA 			0x0e
#define MPL3115_FIFO_SETUP 			0x0e
#define MPL3115_TIME_DELAY 			0x10
#define MPL3115_SYS_MODE 			0x11
#define MPL3115_INT_SORCE 			0x12
#define MPL3115_PT_DATA_CFG 			0x13
#define MPL3115_BAR_IN_MSB			0x14
#define MPL3115_P_ARLARM_MSB			0x16
#define MPL3115_T_ARLARM			0x18
#define MPL3115_P_ARLARM_WND_MSB		0x19
#define MPL3115_T_ARLARM_WND			0x1b
#define MPL3115_P_MIN_DATA			0x1c
#define MPL3115_T_MIN_DATA			0x1f
#define MPL3115_P_MAX_DATA			0x21
#define MPL3115_T_MAX_DATA			0x24
#define MPL3115_CTRL_REG1			0x26
#define MPL3115_CTRL_REG2			0x27
#define MPL3115_CTRL_REG3			0x28
#define MPL3115_CTRL_REG4			0x29
#define MPL3115_CTRL_REG5			0x2a
#define MPL3115_OFFSET_P			0x2b
#define MPL3115_OFFSET_T			0x2c
#define MPL3115_OFFSET_H			0x2d

#define DATA_SHIFT_BIT(data, bit)     ((data << bit) & (0xff << bit))

struct mpl3115_data {
	struct i2c_client *client;
	struct input_polled_dev *poll_dev;
	struct mutex data_lock;
	int active;
};

struct mpl3115_data mpl3115_sv;


static int mpl3115_i2c_read(struct i2c_client *client, u8 reg, u8 *values, u8 length)
{
	return i2c_smbus_read_i2c_block_data(client, reg, length, values);
}

static int mpl3115_i2c_write(struct i2c_client *client, u8 reg, const u8 *values, u8 length)
{
	return i2c_smbus_write_i2c_block_data(client, reg, length, values);
}

static ssize_t mpl3115_enable_show(struct device *dev,
				   struct device_attribute *attr, char *buf)
{
	int val;
	u8 sysmode;

	struct mpl3115_data *pdata = &mpl3115_sv;
	struct i2c_client *client = pdata->client;
	mutex_lock(&pdata->data_lock);
	mpl3115_i2c_read(client, MPL3115_CTRL_REG1, &sysmode, 1);
	sysmode &= MPLL_ACTIVE_MASK;
	val = (sysmode ? 1 : 0);
	mutex_unlock(&pdata->data_lock);

	return sprintf(buf, "%d\n", val);
}

EXPORT_SYMBOL(mpl3115_enable_show);

static ssize_t mpl3115_enable_store(struct device *dev,
				    struct device_attribute *attr,
				    const char *buf, size_t count)
{
	unsigned long ret, enable;
	u8 val;
	struct mpl3115_data *pdata = &mpl3115_sv;
	struct i2c_client *client = pdata->client;

	ret = kstrtoul(buf, 10, &enable);
	if (ret) {
		dev_err(dev, "string transform error\n");
		return ret;
	}

	mutex_lock(&pdata->data_lock);
	mpl3115_i2c_read(client, MPL3115_CTRL_REG1, &val, 1);
	if (enable && pdata->active == MPL_STANDBY) {
		val |= MPLL_ACTIVE_MASK;
		ret = i2c_smbus_write_byte_data(client, MPL3115_CTRL_REG1, val);
		if (!ret)
			pdata->active = MPL_ACTIVED;
		printk("mpl3115 set active\n");
	} else if (!enable && pdata->active == MPL_ACTIVED) {
		val &= ~MPLL_ACTIVE_MASK;
		ret = i2c_smbus_write_byte_data(client, MPL3115_CTRL_REG1, val);
		if (!ret)
			pdata->active = MPL_STANDBY;
		printk("mpl3115 set inactive\n");
	}
	mutex_unlock(&pdata->data_lock);

	return count;
}

EXPORT_SYMBOL(mpl3115_enable_store);

static DEVICE_ATTR(enable, S_IWUSR | S_IRUGO, mpl3115_enable_show, mpl3115_enable_store);

static struct attribute *mpl3115_attributes[] = {
	&dev_attr_enable.attr,
	NULL
};

static const struct attribute_group mpl3115_attr_group = {
	.attrs = mpl3115_attributes,
};

static void mpl3115_device_init(struct i2c_client *client)
{
	u8 val[8];
	struct device_node *np = client->dev.of_node;

	/* set interrupt pin as open-drain */
	// if (of_get_property(np, "interrupt-open-drain", NULL)) {
	// 	val[0] = 0x11;
	// 	i2c_smbus_write_byte_data(client, MPL3115_CTRL_REG3, val[0]);
	// }

	val[0] = 0x28;
	i2c_smbus_write_byte_data(client, MPL3115_CTRL_REG1, val[0]);

	val[0] = 0x07;
	i2c_smbus_write_byte_data(client, MPL3115_PT_DATA_CFG, val[0]);

	mpl3115_i2c_read(client, MPL3115_CTRL_REG1, val, 1);
	val[0] |= MPLL_ACTIVE_MASK;
	i2c_smbus_write_byte_data(client, MPL3115_CTRL_REG1, val[0]);
}

static int mpl3115_read_data(struct i2c_client *client, int *pres, short *temp)
{
	u8 tmp[5];
	int result;

	result = i2c_smbus_read_byte_data(client, MPL3115_PT_DATA_CFG);
	// printk("MPL3115_PT_DATA_CFG: 0x%x.\n", result);

	result = i2c_smbus_read_byte_data(client, MPL3115_CTRL_REG1);
	// printk("MPL3115_CTRL_REG1: 0x%x.\n", result);

	// do {
	// 	result = i2c_smbus_read_byte_data(client, MPL3115_DR_STATUS);
	// 	// printk("MPL3115_DR_STATUS: 0x%x.\n", result);
	// 	msleep(1);
	// } while (!(result & 0x08));

	mpl3115_i2c_read(client, MPL3115_PRESSURE_DATA, tmp, 5);
	*pres = (DATA_SHIFT_BIT(tmp[0], 24) | DATA_SHIFT_BIT(tmp[1], 16) | DATA_SHIFT_BIT(tmp[2], 8)) >> 12;
	*temp = (DATA_SHIFT_BIT(tmp[3], 8) | DATA_SHIFT_BIT(tmp[4], 0)) >> 4;
	return 0;
}

static void sw_mpl3115_read_data(int *pres, short *temp) {
	mpl3115_read_data(mpl3115_sv.client, pres, temp);
}
EXPORT_SYMBOL(sw_mpl3115_read_data);

static void report_abs(struct mpl3115_data *pdata)
{
	struct input_dev *idev;
	int pressure = 0;
	short temperature = 0;

	mutex_lock(&pdata->data_lock);
	if (pdata->active == MPL_STANDBY)
		goto out;
	idev = pdata->poll_dev->input;
	mpl3115_read_data(pdata->client, &pressure, &temperature);
	input_report_abs(idev, ABS_PRESSURE, pressure);
	input_report_abs(idev, ABS_TEMPTERAURE, temperature);
	input_sync(idev);
out:
	mutex_unlock(&pdata->data_lock);
}

static void mpl3115_dev_poll(struct input_polled_dev *dev)
{
     struct mpl3115_data *pdata = (struct mpl3115_data *)dev->private;

     report_abs(pdata);
}

static int mpl3115_stop_chip(struct i2c_client *client)
{
	u8 val;
	int ret;

	mpl3115_i2c_read(client, MPL3115_CTRL_REG1, &val, 1);
	val &= ~MPLL_ACTIVE_MASK;
	ret = mpl3115_i2c_write(client, MPL3115_CTRL_REG1, &val, 1);

	return 0;
}

static const struct i2c_device_id mpl3115_id[] = {
	{MPL3115_DRV_NAME, 0},
	{ /* sentinel */ }
};
MODULE_DEVICE_TABLE(i2c, mpl3115_id);

// static SIMPLE_DEV_PM_OPS(mpl3115_pm_ops, mpl3115_suspend, mpl3115_resume);
static struct i2c_driver mpl3115_driver = {
	.driver = {
		   .name = MPL3115_DRV_NAME,
		   .owner = THIS_MODULE,
		//    .pm = &mpl3115_pm_ops,
		   },
	// .probe = mpl3115_probe,
	// .remove = mpl3115_remove,
	.id_table = mpl3115_id,
};

#define MPL3115_I2C_ADDR	0x60

extern void *ldr_malloc(unsigned int size);
extern int imx_i2c_probe(uint8_t bid, uint8_t chip);

int sw_probe(unsigned char *param_buf) {
	/* copy sv from nw */
	int res;

	memcpy(&mpl3115_sv, param_buf, sizeof(struct mpl3115_data));

	/* mutex initialization */
	memset(&mpl3115_sv.data_lock, NULL, sizeof(mpl3115_sv.data_lock));
	mutex_init(&mpl3115_sv.data_lock);

	/* i2c client initialization */
	mpl3115_sv.client = ldr_malloc(sizeof(struct i2c_client));
	mpl3115_sv.client->flags = 0;
	mpl3115_sv.client->addr = MPL3115_I2C_ADDR;
	*((unsigned short *)(mpl3115_sv.client) + 2) = 2; /* 2 -> i2c3 */

	res = imx_i2c_probe(2, MPL3115_I2C_ADDR);

	// mpl3115_device_init(mpl3115_sv.client);

	if (0 != res){
		pr_err("ERROR: mpl3115 i2c probe fails. err code: 0x%08x.\n",
			res);
	} else {
		printk("success: mpl3115 sw_probe().\n");
	}

	return 0;
}

static int __init mpl3115_init(void)
{
	int res;
	
	ldr_sw_driver_register(MPL3115_DRIVER_ID, dispatch, &mpl3115_sv);

	return res;
}

static void __exit mpl3115_exit(void)
{
}

MODULE_AUTHOR("Freescale Semiconductor, Inc.");
MODULE_DESCRIPTION("MPL3115 Smart Pressure Sensor driver");
MODULE_LICENSE("GPL");

module_init(mpl3115_init);
module_exit(mpl3115_exit);
