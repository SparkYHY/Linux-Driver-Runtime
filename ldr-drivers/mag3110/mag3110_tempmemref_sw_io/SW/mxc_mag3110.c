/*
 *
 * Copyright (C) 2011-2014 Freescale Semiconductor, Inc.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.

 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.

 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/slab.h>
#include <linux/interrupt.h>
#include <linux/delay.h>
#include <linux/i2c.h>
#include <linux/irq.h>
#include <linux/platform_device.h>
#include <linux/input-polldev.h>
#include <linux/hwmon.h>
#include <linux/input.h>
#include <linux/wait.h>
#include <linux/workqueue.h>
#include <linux/of.h>
#include <linux/regulator/consumer.h>

#include <linux/ldr.h>
#include "dispatcher.h"

#define MAG3110_DRV_NAME       "mag3110"
#define MAG3110_ID		(0xC4)
#define MAG3110_XYZ_DATA_LEN	(6)
#define MAG3110_STATUS_ZYXDR	(0x08)
#define MAG3110_AC_MASK		(0x01)
#define MAG3110_AC_OFFSET	(0)
#define MAG3110_DR_MODE_MASK	(0x7 << 5)
#define MAG3110_DR_MODE_OFFSET	(5)

#define POLL_INTERVAL_MAX	(500)
#define POLL_INTERVAL		(100)
#define INT_TIMEOUT		(1000)
#define DEFAULT_POSITION	(2)

/* register enum for mag3110 registers */
enum {
	MAG3110_DR_STATUS = 0x00,
	MAG3110_OUT_X_MSB,
	MAG3110_OUT_X_LSB,
	MAG3110_OUT_Y_MSB,
	MAG3110_OUT_Y_LSB,
	MAG3110_OUT_Z_MSB,
	MAG3110_OUT_Z_LSB,
	MAG3110_WHO_AM_I,

	MAG3110_OFF_X_MSB,
	MAG3110_OFF_X_LSB,
	MAG3110_OFF_Y_MSB,
	MAG3110_OFF_Y_LSB,
	MAG3110_OFF_Z_MSB,
	MAG3110_OFF_Z_LSB,

	MAG3110_DIE_TEMP,

	MAG3110_CTRL_REG1 = 0x10,
	MAG3110_CTRL_REG2,
};

enum {
	MAG_STANDBY,
	MAG_ACTIVED
};

struct mag3110_data {
	struct i2c_client *client;
	struct input_polled_dev *poll_dev;
	struct device *hwmon_dev;
	wait_queue_head_t waitq;
	bool data_ready;
	u8 ctl_reg1;
	int active;
	int position;
	int use_irq;
};

static short MAGHAL[8][3][3] = {
	{ {0, 1, 0}, {-1, 0, 0}, {0, 0, 1} },
	{ {1, 0, 0}, {0, 1, 0}, {0, 0, 1} },
	{ {0, -1, 0}, {1, 0, 0}, {0, 0, 1} },
	{ {-1, 0, 0}, {0, -1, 0}, {0, 0, 1} },

	{ {0, 1, 0}, {1, 0, 0}, {0, 0, -1} },
	{ {1, 0, 0}, {0, -1, 0}, {0, 0, -1} },
	{ {0, -1, 0}, {-1, 0, 0}, {0, 0, -1} },
	{ {-1, 0, 0}, {0, 1, 0}, {0, 0, -1} },
};

static struct mag3110_data *mag3110_pdata;
static DEFINE_MUTEX(mag3110_lock);

struct mag3110_data dum;
// DECLARE_SEC_ELEMENT(dum, dum.client);

/*
 * This function do one mag3110 register read.
 */
static int mag3110_adjust_position(short *x, short *y, short *z)
{
	short rawdata[3], data[3];
	int i, j;
	int position = mag3110_pdata->position;
	if (position < 0 || position > 7)
		position = 0;
	rawdata[0] = *x;
	rawdata[1] = *y;
	rawdata[2] = *z;
	for (i = 0; i < 3; i++) {
		data[i] = 0;
		for (j = 0; j < 3; j++)
			data[i] += rawdata[j] * MAGHAL[position][i][j];
	}
	*x = data[0];
	*y = data[1];
	*z = data[2];
	return 0;
}

static int mag3110_read_reg(struct i2c_client *client, u8 reg)
{
	return i2c_smbus_read_byte_data(client, reg);
}

/*
 * This function do one mag3110 register write.
 */
static int mag3110_write_reg(struct i2c_client *client, u8 reg, char value)
{
	int ret;

	ret = i2c_smbus_write_byte_data(client, reg, value);
	if (ret < 0)
		dev_err(&client->dev, "i2c write failed\n");
	return ret;
}

/*
 * This function do multiple mag3110 registers read.
 */
static int mag3110_read_block_data(struct i2c_client *client, u8 reg,
				   int count, u8 *addr)
{
	if (i2c_smbus_read_i2c_block_data(client, reg, count, addr) < count) {
		dev_err(&client->dev, "i2c block read failed\n");
		return -1;
	}

	return count;
}

/*
 * Initialization function
 */
static int mag3110_init_client(struct i2c_client *client)
{
	int val, ret;

	/* enable automatic resets */
	val = 0x80;
	ret = mag3110_write_reg(client, MAG3110_CTRL_REG2, val);

	/* set default data rate to 10HZ */
	val = mag3110_read_reg(client, MAG3110_CTRL_REG1);
	val |= (0x0 << MAG3110_DR_MODE_OFFSET);
	ret = mag3110_write_reg(client, MAG3110_CTRL_REG1, val);

	return ret;
}

extern void ldr_dump(void *addr, size_t len);

/*
 * read sensor data from mag3110
 */
static int mag3110_read_data(short *x, short *y, short *z)
{
	struct mag3110_data *data;
	u8 tmp_data[MAG3110_XYZ_DATA_LEN];
	int retry = 3;
	int result;

	if (!mag3110_pdata || mag3110_pdata->active == MAG_STANDBY)
		return -EINVAL;

	data = mag3110_pdata;
	// if (data->use_irq && !wait_event_interruptible_timeout
	//     (data->waitq, data->data_ready != 0,
	//      msecs_to_jiffies(INT_TIMEOUT))) {
	// 	dev_dbg(&data->client->dev, "interrupt not received\n");
	// 	return -ETIME;
	// }

	do {
		// msleep(1);
		result = i2c_smbus_read_byte_data(data->client,
						  MAG3110_DR_STATUS);
		// printk("retry count: %d.\n", retry);
		// retry--;
	} while (!(result & MAG3110_STATUS_ZYXDR)); // && retry > 0
	/* Clear data_ready flag after data is read out */
	if (retry == 0) {
		pr_err("ERROR: time out for mag data.\n");
		return -EINVAL;
	}

	data->data_ready = 0;

	while (i2c_smbus_read_byte_data(data->client, MAG3110_DR_STATUS)) {
		if (mag3110_read_block_data(data->client,
				    MAG3110_OUT_X_MSB, MAG3110_XYZ_DATA_LEN,
				    tmp_data) < 0)
			return -1;
	}

	*x = ((tmp_data[0] << 8) & 0xff00) | tmp_data[1];
	*y = ((tmp_data[2] << 8) & 0xff00) | tmp_data[3];
	*z = ((tmp_data[4] << 8) & 0xff00) | tmp_data[5];

	// ldr_dump(tmp_data, 6);

	return 0;
}
EXPORT_SYMBOL(mag3110_read_data);

static void report_abs(void)
{
	struct input_dev *idev;
	short x, y, z;

	mutex_lock(&mag3110_lock);
	if (mag3110_read_data(&x, &y, &z) != 0)
		goto out;
	mag3110_adjust_position(&x, &y, &z);
	idev = mag3110_pdata->poll_dev->input;
	input_report_abs(idev, ABS_X, x);
	input_report_abs(idev, ABS_Y, y);
	input_report_abs(idev, ABS_Z, z);
	input_sync(idev);
out:
	mutex_unlock(&mag3110_lock);
}

static void mag3110_dev_poll(struct input_polled_dev *dev)
{
	report_abs();
}

static irqreturn_t mag3110_irq_handler(int irq, void *dev_id)
{
	int result;
	u8 tmp_data[MAG3110_XYZ_DATA_LEN];
	result = i2c_smbus_read_byte_data(mag3110_pdata->client,
						  MAG3110_DR_STATUS);
	if (!(result & MAG3110_STATUS_ZYXDR))
		return IRQ_NONE;

	mag3110_pdata->data_ready = 1;

	if (mag3110_pdata->active == MAG_STANDBY)
		/*
		 * Since the mode will be changed, sometimes irq will
		 * be handled in StandBy mode because of interrupt latency.
		 * So just clear the interrutp flag via reading block data.
		 */
		mag3110_read_block_data(mag3110_pdata->client,
					MAG3110_OUT_X_MSB,
					MAG3110_XYZ_DATA_LEN, tmp_data);
	else
		wake_up_interruptible(&mag3110_pdata->waitq);

	return IRQ_HANDLED;
}

static ssize_t mag3110_enable_show(struct device *dev,
				   struct device_attribute *attr, char *buf)
{
	struct i2c_client *client;
	int val;
	mutex_lock(&mag3110_lock);
	client = mag3110_pdata->client;
	val = mag3110_read_reg(client, MAG3110_CTRL_REG1) & MAG3110_AC_MASK;

	mutex_unlock(&mag3110_lock);
	return sprintf(buf, "%d\n", val);
}
EXPORT_SYMBOL(mag3110_enable_show);

static ssize_t mag3110_enable_store(struct device *dev,
				    struct device_attribute *attr,
				    const char *buf, size_t count)
{
	struct i2c_client *client;
	int reg, ret;
	long enable;
	u8 tmp_data[MAG3110_XYZ_DATA_LEN];

	ret = kstrtol(buf, 10, &enable);
	if (ret) {
		dev_err(dev, "string to long error\n");
		return ret;
	}

	mutex_lock(&mag3110_lock);
	client = mag3110_pdata->client;

	printk("enable: %d.\n", enable);
	printk("mag_status before enable: %s.\n", mag3110_pdata->active ? "ACTIVED" : "STANDBY");

	reg = mag3110_read_reg(client, MAG3110_CTRL_REG1);
	if (enable && mag3110_pdata->active == MAG_STANDBY) {
		reg |= MAG3110_AC_MASK;
		ret = mag3110_write_reg(client, MAG3110_CTRL_REG1, reg);
		if (!ret)
			mag3110_pdata->active = MAG_ACTIVED;
	} else if (!enable && mag3110_pdata->active == MAG_ACTIVED) {
		reg &= ~MAG3110_AC_MASK;
		ret = mag3110_write_reg(client, MAG3110_CTRL_REG1, reg);
		if (!ret)
			mag3110_pdata->active = MAG_STANDBY;
	}

	printk("mag_status: %s.\n", mag3110_pdata->active ? "ACTIVED" : "STANDBY");

	/* Read out MSB data to clear interrupt flag */
	msleep(100);
	mag3110_read_block_data(mag3110_pdata->client, MAG3110_OUT_X_MSB,
					MAG3110_XYZ_DATA_LEN, tmp_data);
	mutex_unlock(&mag3110_lock);

	return count;
}
EXPORT_SYMBOL(mag3110_enable_store);

static DEVICE_ATTR(enable, S_IWUSR | S_IRUGO,
		   mag3110_enable_show, mag3110_enable_store);

static ssize_t mag3110_dr_mode_show(struct device *dev,
				    struct device_attribute *attr, char *buf)
{
	struct i2c_client *client;
	int val;

	client = mag3110_pdata->client;
	val = (mag3110_read_reg(client, MAG3110_CTRL_REG1)
	       & MAG3110_DR_MODE_MASK) >> MAG3110_DR_MODE_OFFSET;

	return sprintf(buf, "%d\n", val);
}

static ssize_t mag3110_dr_mode_store(struct device *dev,
				     struct device_attribute *attr,
				     const char *buf, size_t count)
{
	struct i2c_client *client;
	int reg, ret;
	unsigned long val;

	/* This must be done when mag3110 is disabled */
	if ((kstrtoul(buf, 10, &val) < 0) || (val > 7))
		return -EINVAL;

	client = mag3110_pdata->client;
	reg = mag3110_read_reg(client, MAG3110_CTRL_REG1) &
	    ~MAG3110_DR_MODE_MASK;
	reg |= (val << MAG3110_DR_MODE_OFFSET);
	/* MAG3110_CTRL_REG1 bit 5-7: data rate mode */
	ret = mag3110_write_reg(client, MAG3110_CTRL_REG1, reg);
	if (ret < 0)
		return ret;

	return count;
}

static DEVICE_ATTR(dr_mode, S_IWUSR | S_IRUGO,
		   mag3110_dr_mode_show, mag3110_dr_mode_store);

static ssize_t mag3110_position_show(struct device *dev,
				     struct device_attribute *attr, char *buf)
{
	int val;
	mutex_lock(&mag3110_lock);
	val = mag3110_pdata->position;
	mutex_unlock(&mag3110_lock);
	return sprintf(buf, "%d\n", val);
}

static ssize_t mag3110_position_store(struct device *dev,
				      struct device_attribute *attr,
				      const char *buf, size_t count)
{
	long position;
	int ret;
	ret = kstrtol(buf, 10, &position);
	if (ret) {
		dev_err(dev, "string to long error\n");
		return ret;
	}

	mutex_lock(&mag3110_lock);
	mag3110_pdata->position = (int)position;
	mutex_unlock(&mag3110_lock);
	return count;
}

static DEVICE_ATTR(position, S_IWUSR | S_IRUGO,
		   mag3110_position_show, mag3110_position_store);

static struct attribute *mag3110_attributes[] = {
	&dev_attr_enable.attr,
	&dev_attr_dr_mode.attr,
	&dev_attr_position.attr,
	NULL
};

static const struct attribute_group mag3110_attr_group = {
	.attrs = mag3110_attributes,
};

#ifdef CONFIG_PM
static int mag3110_suspend(struct device *dev)
{
	int ret = 0;
	struct i2c_client *client = to_i2c_client(dev);
	struct mag3110_data *data = i2c_get_clientdata(client);

	if (data->active == MAG_ACTIVED) {
		data->ctl_reg1 = mag3110_read_reg(client, MAG3110_CTRL_REG1);
		ret = mag3110_write_reg(client, MAG3110_CTRL_REG1,
					data->ctl_reg1 & ~MAG3110_AC_MASK);
	}
	return ret;
}

static int mag3110_resume(struct device *dev)
{
	int ret = 0;
	struct i2c_client *client = to_i2c_client(dev);
	struct mag3110_data *data = i2c_get_clientdata(client);
	u8 tmp_data[MAG3110_XYZ_DATA_LEN];

	if (data->active == MAG_ACTIVED) {
		ret = mag3110_write_reg(client, MAG3110_CTRL_REG1,
					data->ctl_reg1);

		if (data->ctl_reg1 & MAG3110_AC_MASK) {
			/* Read out MSB data to clear interrupt
			 flag automatically */
			mag3110_read_block_data(client, MAG3110_OUT_X_MSB,
						MAG3110_XYZ_DATA_LEN, tmp_data);
		}
	}
	return ret;
}

static const struct dev_pm_ops mag3110_dev_pm_ops = {
	.suspend	= mag3110_suspend,
	.resume		= mag3110_resume,
};
#define MAG3110_DEV_PM_OPS (&mag3110_dev_pm_ops)

#else
#define MAG3110_DEV_PM_OPS NULL
#endif /* CONFIG_PM */

static const struct i2c_device_id mag3110_id[] = {
	{MAG3110_DRV_NAME, 0},
	{}
};

MODULE_DEVICE_TABLE(i2c, mag3110_id);
static struct i2c_driver mag3110_driver = {
	.driver = {
		.name	= MAG3110_DRV_NAME,
		.owner	= THIS_MODULE,
		.pm	= MAG3110_DEV_PM_OPS,
	},
	// .probe = mag3110_probe,
	// .remove = mag3110_remove,
	.id_table = mag3110_id,
};

static struct mag3110_data *get_sw_sv(void) {
	return mag3110_pdata;
}

extern void *ldr_malloc(unsigned int size);
extern int imx_i2c_probe(uint8_t bid, uint8_t chip);

#define MAG3110_I2C_ADDR	0x0E
char buf[32];

static int test(void) 
{
	size_t i, j = 0;
	short x, y, z;
	ktime_t start, end;
	s64 interval;

	printk("test mag3110 sw I/O.\n");

	/* show mag3110 enable state */
	mag3110_enable_show(NULL, NULL, buf);
	printk("mag3110 enable state: %s.\n", buf);

	/* enable mag3110 */
	buf[0] = '1';
	buf[1] = '\0';
	mag3110_enable_store(NULL, NULL, buf, 1);

	/* show mag3110 enable state */
	mag3110_enable_show(NULL, NULL, buf);
	printk("mag3110 enable state: %s.\n", buf);

	/* read data from mag3110 */

	for (j = 0; j < 30; j++) {
		start = ktime_get();

		for (i = 0; i < 240; i++) {
			mag3110_read_data(&x, &y, &z);
		}

		end = ktime_get();
		if (end < start)
			end += 0xffffffff;
		interval = ktime_to_ms(ktime_sub(end, start));
		printk("round %d: %ld\n", j, interval);
	}

	return 0; 
}

int sw_probe(unsigned char *param_buf) {
	int res;

	/* copy sv from nw */
	mag3110_pdata = ldr_malloc(sizeof(struct mag3110_data));
	if (mag3110_pdata == NULL) {
		return -1;
	}
	memcpy(get_sw_sv(), param_buf, sizeof(struct mag3110_data));

	/* mutex initialization */
	memset(&mag3110_lock, NULL, sizeof(mag3110_lock));
	mutex_init(&mag3110_lock);

	/* i2c client initialization */
	mag3110_pdata->client = ldr_malloc(sizeof(struct i2c_client));
	mag3110_pdata->client->flags = 0;
	mag3110_pdata->client->addr = MAG3110_I2C_ADDR;
	*((unsigned short *)(mag3110_pdata->client) + 2) = 2; /* 2 -> i2c3 */

	res = imx_i2c_probe(2, MAG3110_I2C_ADDR);
	if (0 != res){
		pr_err("ERROR: mag3110 i2c probe fails. err code: 0x%08x.\n",
			res);
	}

	res = mag3110_read_reg(mag3110_pdata->client, MAG3110_WHO_AM_I);
	if (MAG3110_ID != res) {
		pr_err("read chip ID 0x%x is not equal to 0x%x!\n", res,
			MAG3110_ID);
		return -EINVAL;
	}

	test();

	return 0;
}

static int __init mag3110_init(void)
{
	/* register driver */
	int res;
	printk("inside %s.\n", __func__);

	ldr_sw_driver_register(MAG3110_DRIVER_ID, dispatch, &dum);

	res = 10;
	pr_debug("%d", res);
}

static void __exit mag3110_exit(void)
{
	
}

module_init(mag3110_init);
module_exit(mag3110_exit);
MODULE_AUTHOR("Freescale Semiconductor, Inc.");
MODULE_DESCRIPTION("Freescale mag3110 3-axis magnetometer driver");
MODULE_LICENSE("GPL");
