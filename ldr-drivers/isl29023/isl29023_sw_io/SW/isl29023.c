/*
 * Copyright (C) 2011-2014 Freescale Semiconductor, Inc. All Rights Reserved.
 */

/*
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
#include <linux/init.h>
#include <linux/slab.h>
#include <linux/i2c.h>
#include <linux/input.h>
#include <linux/interrupt.h>
#include <linux/irq.h>
#include <linux/mutex.h>
#include <linux/delay.h>
#include <linux/of.h>
#include <linux/regulator/consumer.h>
#include <linux/isl29023.h>

#include "dispatcher.h"

#define ISL29023_DRV_NAME		"isl29023"
#define DRIVER_VERSION			"1.0"

#define ISL29023_COMMAND1		(0x00)
#define ISL29023_MODE_SHIFT		(5)
#define ISL29023_MODE_MASK		(0x7 << ISL29023_MODE_SHIFT)
#define ISL29023_INT_FLAG_SHIFT		(2)
#define ISL29023_INT_FLAG_MASK		(0x1 << ISL29023_INT_FLAG_SHIFT)
#define ISL29023_INT_PERSISTS_SHIFT	(0)
#define ISL29023_INT_PERSISTS_MASK	(0x3 << ISL29023_INT_PERSISTS_SHIFT)

#define ISL29023_COMMAND2		(0x01)
#define ISL29023_RES_SHIFT		(2)
#define ISL29023_RES_MASK		(0x3 << ISL29023_RES_SHIFT)
#define ISL29023_RANGE_SHIFT		(0)
#define ISL29023_RANGE_MASK		(0x3 << ISL29023_RANGE_SHIFT)

#define ISL29023_REG_LSB_SENSOR		(0x02)
#define ISL29023_REG_MSB_SENSOR		(0x03)
#define ISL29023_REG_IRQ_TH_LO_LSB	(0x04)
#define ISL29023_REG_IRQ_TH_LO_MSB	(0x05)
#define ISL29023_REG_IRQ_TH_HI_LSB	(0x06)
#define ISL29023_REG_IRQ_TH_HI_MSB	(0x07)

#define ISL29023_NUM_CACHABLE_REGS	8
#define DEF_RANGE			2
#define DEFAULT_REGISTOR_VAL		499

struct isl29023_data {
	struct i2c_client *client;
	struct mutex lock;
	struct input_dev *input;
	struct work_struct work;
	struct workqueue_struct *workqueue;
	char phys[32];
	u8 reg_cache[ISL29023_NUM_CACHABLE_REGS];
	u8 mode_before_suspend;
	u8 mode_before_interrupt;
	u16 rext;
};

struct isl29023_data isl29023_sv;

static int gain_range[] = {
	1000, 4000, 16000, 64000
};

/*
 * register access helpers
 */
static int __isl29023_read_reg(struct i2c_client *client,
			       u32 reg, u8 mask, u8 shift)
{
	struct isl29023_data *data = &isl29023_sv;
	return (data->reg_cache[reg] & mask) >> shift;
}

static int __isl29023_write_reg(struct i2c_client *client,
				u32 reg, u8 mask, u8 shift, u8 val)
{
	struct isl29023_data *data = &isl29023_sv;
	int ret = 0;
	u8 tmp;

	if (reg >= ISL29023_NUM_CACHABLE_REGS)
		return -EINVAL;

	mutex_lock(&data->lock);

	tmp = data->reg_cache[reg];
	tmp &= ~mask;
	tmp |= val << shift;

	ret = i2c_smbus_write_byte_data(client, reg, tmp);
	if (!ret)
		data->reg_cache[reg] = tmp;

	mutex_unlock(&data->lock);
	return ret;
}

/*
 * internally used functions
 */
static int isl29023_get_int_persists(struct i2c_client *client)
{
	return __isl29023_read_reg(client, ISL29023_COMMAND1,
		ISL29023_INT_PERSISTS_MASK, ISL29023_INT_PERSISTS_SHIFT);
}

static int isl29023_set_int_persists(struct i2c_client *client,
				int int_persists)
{
	return __isl29023_write_reg(client, ISL29023_COMMAND1,
		ISL29023_INT_PERSISTS_MASK, ISL29023_INT_PERSISTS_SHIFT,
		int_persists);
}

/*
 * interrupt flag
 */
static int isl29023_get_int_flag(struct i2c_client *client)
{
	return __isl29023_read_reg(client, ISL29023_COMMAND1,
		ISL29023_INT_FLAG_MASK, ISL29023_INT_FLAG_SHIFT);
}

static int isl29023_set_int_flag(struct i2c_client *client, int flag)
{
	return __isl29023_write_reg(client, ISL29023_COMMAND1,
		ISL29023_INT_FLAG_MASK, ISL29023_INT_FLAG_SHIFT, flag);
}

/*
 * interrupt lt
 */
static int isl29023_get_int_lt(struct i2c_client *client)
{
	struct isl29023_data *data = &isl29023_sv;
	int lsb, msb, lt;

	mutex_lock(&data->lock);
	lsb = i2c_smbus_read_byte_data(client, ISL29023_REG_IRQ_TH_LO_LSB);

	if (lsb < 0) {
		mutex_unlock(&data->lock);
		return lsb;
	}

	msb = i2c_smbus_read_byte_data(client, ISL29023_REG_IRQ_TH_LO_MSB);
	mutex_unlock(&data->lock);

	if (msb < 0)
		return msb;

	lt = ((msb << 8) | lsb);

	return lt;
}

static int isl29023_set_int_lt(struct i2c_client *client, int lt)
{
	int ret = 0;
	struct isl29023_data *data = &isl29023_sv;

	mutex_lock(&data->lock);
	ret = i2c_smbus_write_byte_data(client, ISL29023_REG_IRQ_TH_LO_LSB,
					lt & 0xff);
	if (ret < 0) {
		mutex_unlock(&data->lock);
		return ret;
	}

	ret = i2c_smbus_write_byte_data(client, ISL29023_REG_IRQ_TH_LO_MSB,
					(lt >> 8) & 0xff);
	if (ret < 0) {
		mutex_unlock(&data->lock);
		return ret;
	}

	data->reg_cache[ISL29023_REG_IRQ_TH_LO_MSB] = (lt >> 8) & 0xff;
	data->reg_cache[ISL29023_REG_IRQ_TH_LO_LSB] = lt & 0xff;
	mutex_unlock(&data->lock);

	return ret;
}

/*
 * interrupt ht
 */
static int isl29023_get_int_ht(struct i2c_client *client)
{
	struct isl29023_data *data = &isl29023_sv;
	int lsb, msb, ht;

	mutex_lock(&data->lock);
	lsb = i2c_smbus_read_byte_data(client, ISL29023_REG_IRQ_TH_HI_LSB);

	if (lsb < 0) {
		mutex_unlock(&data->lock);
		return lsb;
	}

	msb = i2c_smbus_read_byte_data(client, ISL29023_REG_IRQ_TH_HI_MSB);
	mutex_unlock(&data->lock);

	if (msb < 0)
		return msb;

	ht = ((msb << 8) | lsb);

	return ht;
}

static int isl29023_set_int_ht(struct i2c_client *client, int ht)
{
	int ret = 0;
	struct isl29023_data *data = &isl29023_sv;

	mutex_lock(&data->lock);
	ret = i2c_smbus_write_byte_data(client, ISL29023_REG_IRQ_TH_HI_LSB,
					ht & 0xff);
	if (ret < 0) {
		mutex_unlock(&data->lock);
		return ret;
	}

	ret = i2c_smbus_write_byte_data(client, ISL29023_REG_IRQ_TH_HI_MSB,
					(ht >> 8) & 0xff);
	if (ret < 0) {
		mutex_unlock(&data->lock);
		return ret;
	}

	data->reg_cache[ISL29023_REG_IRQ_TH_HI_MSB] = (ht >> 8) & 0xff;
	data->reg_cache[ISL29023_REG_IRQ_TH_HI_LSB] = ht & 0xff;
	mutex_unlock(&data->lock);

	return ret;
}

/*
 * range
 */
static int isl29023_get_range(struct i2c_client *client)
{
	return __isl29023_read_reg(client, ISL29023_COMMAND2,
		ISL29023_RANGE_MASK, ISL29023_RANGE_SHIFT);
}

static int isl29023_set_range(struct i2c_client *client, int range)
{
	return __isl29023_write_reg(client, ISL29023_COMMAND2,
		ISL29023_RANGE_MASK, ISL29023_RANGE_SHIFT, range);
}

/*
 * resolution
 */
static int isl29023_get_resolution(struct i2c_client *client)
{
	return __isl29023_read_reg(client, ISL29023_COMMAND2,
		ISL29023_RES_MASK, ISL29023_RES_SHIFT);
}

static int isl29023_set_resolution(struct i2c_client *client, int res)
{
	return __isl29023_write_reg(client, ISL29023_COMMAND2,
		ISL29023_RES_MASK, ISL29023_RES_SHIFT, res);
}

/*
 * mode
 */
static int isl29023_get_mode(struct i2c_client *client)
{
	return __isl29023_read_reg(client, ISL29023_COMMAND1,
		ISL29023_MODE_MASK, ISL29023_MODE_SHIFT);
}

static int isl29023_set_mode(struct i2c_client *client, int mode)
{
	return __isl29023_write_reg(client, ISL29023_COMMAND1,
		ISL29023_MODE_MASK, ISL29023_MODE_SHIFT, mode);
}

/*
 * power_state
 */
static int isl29023_set_power_state(struct i2c_client *client, int state)
{
	return __isl29023_write_reg(client, ISL29023_COMMAND1,
				ISL29023_MODE_MASK, ISL29023_MODE_SHIFT,
				state ?
				ISL29023_ALS_ONCE_MODE : ISL29023_PD_MODE);
}

static int isl29023_get_power_state(struct i2c_client *client)
{
	struct isl29023_data *data = &isl29023_sv;
	u8 cmdreg = data->reg_cache[ISL29023_COMMAND1];

	if (cmdreg & ISL29023_MODE_MASK)
		return 1;
	else
		return 0;
}

static int isl29023_get_adc_value(struct i2c_client *client)
{
	struct isl29023_data *data = &isl29023_sv;
	int lsb, msb, range, bitdepth;

	mutex_lock(&data->lock);
	lsb = i2c_smbus_read_byte_data(client, ISL29023_REG_LSB_SENSOR);

	if (lsb < 0) {
		mutex_unlock(&data->lock);
		return lsb;
	}

	msb = i2c_smbus_read_byte_data(client, ISL29023_REG_MSB_SENSOR);
	mutex_unlock(&data->lock);

	if (msb < 0)
		return msb;

	range = isl29023_get_range(client);
	bitdepth = (4 - isl29023_get_resolution(client)) * 4;
	return (((msb << 8) | lsb) * ((gain_range[range] * 499) / data->rext))
		>> bitdepth;
}

static int sw_isl29023_get_adc_value(void) {
	return isl29023_get_adc_value(isl29023_sv.client);
}
EXPORT_SYMBOL(sw_isl29023_get_adc_value);

static int isl29023_get_int_lt_value(struct i2c_client *client)
{
	struct isl29023_data *data = &isl29023_sv;
	int lsb, msb, range, bitdepth;

	mutex_lock(&data->lock);
	lsb = i2c_smbus_read_byte_data(client, ISL29023_REG_IRQ_TH_LO_LSB);

	if (lsb < 0) {
		mutex_unlock(&data->lock);
		return lsb;
	}

	msb = i2c_smbus_read_byte_data(client, ISL29023_REG_IRQ_TH_LO_MSB);
	mutex_unlock(&data->lock);

	if (msb < 0)
		return msb;

	range = isl29023_get_range(client);
	bitdepth = (4 - isl29023_get_resolution(client)) * 4;
	return (((msb << 8) | lsb) * ((gain_range[range] * 499) / data->rext))
		>> bitdepth;
}

static int isl29023_get_int_ht_value(struct i2c_client *client)
{
	struct isl29023_data *data = &isl29023_sv;
	int lsb, msb, range, bitdepth;

	mutex_lock(&data->lock);
	lsb = i2c_smbus_read_byte_data(client, ISL29023_REG_IRQ_TH_HI_LSB);

	if (lsb < 0) {
		mutex_unlock(&data->lock);
		return lsb;
	}

	msb = i2c_smbus_read_byte_data(client, ISL29023_REG_IRQ_TH_HI_MSB);
	mutex_unlock(&data->lock);

	if (msb < 0)
		return msb;

	range = isl29023_get_range(client);
	bitdepth = (4 - isl29023_get_resolution(client)) * 4;
	return (((msb << 8) | lsb) * ((gain_range[range] * 499) / data->rext))
		>> bitdepth;
}

/*
 * sysfs layer
 */

/*
 * interrupt persists
 */
static ssize_t isl29023_show_int_persists(struct device *dev,
					  struct device_attribute *attr,
					  char *buf)
{
	struct i2c_client *client = to_i2c_client(dev);
	return sprintf(buf, "%i\n", isl29023_get_int_persists(client));
}

static ssize_t isl29023_store_int_persists(struct device *dev,
					   struct device_attribute *attr,
					   const char *buf, size_t count)
{
	struct i2c_client *client = to_i2c_client(dev);
	unsigned long val;
	int ret;

	if ((kstrtoul(buf, 10, &val) < 0) ||
	    (val > ISL29023_INT_PERSISTS_16))
		return -EINVAL;

	ret = isl29023_set_int_persists(client, val);
	if (ret < 0)
		return ret;

	return count;
}

static DEVICE_ATTR(int_persists, S_IWUSR | S_IRUGO,
		   isl29023_show_int_persists, isl29023_store_int_persists);

/*
 *interrupt flag
 */
static ssize_t isl29023_show_int_flag(struct device *dev,
					  struct device_attribute *attr,
					  char *buf)
{
	struct i2c_client *client = to_i2c_client(dev);
	return sprintf(buf, "%i\n", isl29023_get_int_flag(client));
}

static ssize_t isl29023_store_int_flag(struct device *dev,
					   struct device_attribute *attr,
					   const char *buf, size_t count)
{
	struct i2c_client *client = to_i2c_client(dev);
	unsigned long val;
	int ret;

	if ((kstrtoul(buf, 10, &val) < 0) || (val > 1))
		return -EINVAL;

	ret = isl29023_set_int_flag(client, val);
	if (ret < 0)
		return ret;

	return count;
}

static DEVICE_ATTR(int_flag, S_IWUSR | S_IRUGO,
		   isl29023_show_int_flag, isl29023_store_int_flag);

/*
 * interrupt lt
 */
static ssize_t isl29023_show_int_lt(struct device *dev,
				   struct device_attribute *attr, char *buf)
{
	struct i2c_client *client = to_i2c_client(dev);
	return sprintf(buf, "%i\n", isl29023_get_int_lt(client));
}

static ssize_t isl29023_store_int_lt(struct device *dev,
				    struct device_attribute *attr,
				    const char *buf, size_t count)
{
	struct i2c_client *client = to_i2c_client(dev);
	unsigned long val;
	int ret;

	if ((kstrtoul(buf, 16, &val) < 0) || (val > 0xffff))
		return -EINVAL;

	ret = isl29023_set_int_lt(client, val);
	if (ret < 0)
		return ret;

	return count;
}

static DEVICE_ATTR(int_lt, S_IWUSR | S_IRUGO,
		   isl29023_show_int_lt, isl29023_store_int_lt);

/*
 *interrupt ht
 */
static ssize_t isl29023_show_int_ht(struct device *dev,
				   struct device_attribute *attr, char *buf)
{
	struct i2c_client *client = to_i2c_client(dev);
	return sprintf(buf, "%i\n", isl29023_get_int_ht(client));
}

static ssize_t isl29023_store_int_ht(struct device *dev,
				    struct device_attribute *attr,
				    const char *buf, size_t count)
{
	struct i2c_client *client = to_i2c_client(dev);
	unsigned long val;
	int ret;

	if ((kstrtoul(buf, 16, &val) < 0) || (val > 0xffff))
		return -EINVAL;

	ret = isl29023_set_int_ht(client, val);
	if (ret < 0)
		return ret;

	return count;
}

static DEVICE_ATTR(int_ht, S_IWUSR | S_IRUGO,
		   isl29023_show_int_ht, isl29023_store_int_ht);

/*
 * range
 */
static ssize_t isl29023_show_range(struct device *dev,
				   struct device_attribute *attr, char *buf)
{
	struct i2c_client *client = to_i2c_client(dev);
	return sprintf(buf, "%i\n", isl29023_get_range(client));
}

static ssize_t isl29023_store_range(struct device *dev,
				    struct device_attribute *attr,
				    const char *buf, size_t count)
{
	struct i2c_client *client = to_i2c_client(dev);
	unsigned long val;
	int ret;

	if ((kstrtoul(buf, 10, &val) < 0) || (val > ISL29023_RANGE_64K))
		return -EINVAL;

	ret = isl29023_set_range(client, val);
	if (ret < 0)
		return ret;

	return count;
}

static DEVICE_ATTR(range, S_IWUSR | S_IRUGO,
		   isl29023_show_range, isl29023_store_range);


/*
 * resolution
 */
static ssize_t isl29023_show_resolution(struct device *dev,
					struct device_attribute *attr,
					char *buf)
{
	struct i2c_client *client = to_i2c_client(dev);
	return sprintf(buf, "%d\n", isl29023_get_resolution(client));
}

static ssize_t isl29023_store_resolution(struct device *dev,
					 struct device_attribute *attr,
					 const char *buf, size_t count)
{
	struct i2c_client *client = to_i2c_client(dev);
	unsigned long val;
	int ret;

	if ((kstrtoul(buf, 10, &val) < 0) || (val > ISL29023_RES_4))
		return -EINVAL;

	ret = isl29023_set_resolution(client, val);
	if (ret < 0)
		return ret;

	return count;
}

static DEVICE_ATTR(resolution, S_IWUSR | S_IRUGO,
		   isl29023_show_resolution, isl29023_store_resolution);

/*
 *mode
 */
static ssize_t isl29023_show_mode(struct device *dev,
				  struct device_attribute *attr, char *buf)
{
	struct i2c_client *client = isl29023_sv.client;
	return sprintf(buf, "%d\n", isl29023_get_mode(client));
}
EXPORT_SYMBOL(isl29023_show_mode);

static ssize_t isl29023_store_mode(struct device *dev,
		struct device_attribute *attr, const char *buf, size_t count)
{
	struct i2c_client *client = isl29023_sv.client;
	unsigned long val;
	int ret;

	if ((kstrtoul(buf, 10, &val) < 0) ||
	    (val > ISL29023_IR_CONT_MODE))
		return -EINVAL;

	/* clear the interrupt flag */
	i2c_smbus_read_byte_data(client, ISL29023_COMMAND1);
	ret = isl29023_set_mode(client, val);
	if (ret < 0)
		return ret;

	return count;
}

static DEVICE_ATTR(mode, S_IWUSR | S_IRUGO,
		   isl29023_show_mode, isl29023_store_mode);
EXPORT_SYMBOL(isl29023_store_mode);

/*
 *power state
 */
static ssize_t isl29023_show_power_state(struct device *dev,
					 struct device_attribute *attr,
					 char *buf)
{
	struct i2c_client *client = isl29023_sv.client;
	return sprintf(buf, "%d\n", isl29023_get_power_state(client));
}
EXPORT_SYMBOL(isl29023_show_power_state);

static ssize_t isl29023_store_power_state(struct device *dev,
					  struct device_attribute *attr,
					  const char *buf, size_t count)
{
	struct i2c_client *client = isl29023_sv.client;
	unsigned long val;
	int ret;

	if ((kstrtoul(buf, 10, &val) < 0) || (val > 1))
		return -EINVAL;

	ret = isl29023_set_power_state(client, val);
	return ret ? ret : count;
}

static DEVICE_ATTR(power_state, S_IWUSR | S_IRUGO,
		   isl29023_show_power_state, isl29023_store_power_state);
EXPORT_SYMBOL(isl29023_store_power_state);
/*
 * lux
 */
static ssize_t isl29023_show_lux(struct device *dev,
				 struct device_attribute *attr, char *buf)
{
	struct i2c_client *client = isl29023_sv.client;

	/* No LUX data if not operational */
	if (!isl29023_get_power_state(client))
		return -EBUSY;

	return sprintf(buf, "%d\n", isl29023_get_adc_value(client));
}

static DEVICE_ATTR(lux, S_IRUGO, isl29023_show_lux, NULL);

EXPORT_SYMBOL(isl29023_show_lux);

/*
 * lux interrupt low threshold
 */
static ssize_t isl29023_show_int_lt_lux(struct device *dev,
				 struct device_attribute *attr, char *buf)
{
	struct i2c_client *client = to_i2c_client(dev);

	/* No LUX data if not operational */
	if (isl29023_get_mode(client) != ISL29023_ALS_ONCE_MODE &&
	    isl29023_get_mode(client) != ISL29023_ALS_CONT_MODE)
		return -EIO;

	return sprintf(buf, "%d\n", isl29023_get_int_lt_value(client));
}

static ssize_t isl29023_store_int_lt_lux(struct device *dev,
		struct device_attribute *attr, const char *buf, size_t count)
{
	struct i2c_client *client = to_i2c_client(dev);
	struct isl29023_data *data = &isl29023_sv;
	unsigned long val, lux_data;
	int range, bitdepth, ret;
	u8 lsb, msb;

	if ((kstrtoul(buf, 10, &val) < 0))
		return -EINVAL;

	/* No LUX data if not operational */
	if (isl29023_get_mode(client) != ISL29023_ALS_ONCE_MODE &&
	    isl29023_get_mode(client) != ISL29023_ALS_CONT_MODE)
		return -EIO;

	if (val > (gain_range[isl29023_get_range(client)]*499/data->rext))
		return -EINVAL;

	range = isl29023_get_range(client);
	bitdepth = (4 - isl29023_get_resolution(client)) * 4;
	lux_data = ((unsigned long)(val << bitdepth)) /
		((gain_range[range] * 499) / data->rext);
	lux_data &= 0xffff;

	msb = lux_data >> 8;
	lsb = lux_data & 0xff;

	mutex_lock(&data->lock);
	ret = i2c_smbus_write_byte_data(client, ISL29023_REG_IRQ_TH_LO_LSB,
					lsb);
	if (ret < 0) {
		mutex_unlock(&data->lock);
		return ret;
	}

	ret = i2c_smbus_write_byte_data(client, ISL29023_REG_IRQ_TH_LO_MSB,
					msb);
	if (ret < 0) {
		mutex_unlock(&data->lock);
		return ret;
	}

	data->reg_cache[ISL29023_REG_IRQ_TH_LO_MSB] = msb;
	data->reg_cache[ISL29023_REG_IRQ_TH_LO_LSB] = lsb;
	mutex_unlock(&data->lock);

	return count;
}

static DEVICE_ATTR(int_lt_lux, S_IWUSR | S_IRUGO,
		isl29023_show_int_lt_lux, isl29023_store_int_lt_lux);

/*
 * lux interrupt high threshold
 */
static ssize_t isl29023_show_int_ht_lux(struct device *dev,
				 struct device_attribute *attr, char *buf)
{
	struct i2c_client *client = to_i2c_client(dev);

	/* No LUX data if not operational */
	if (isl29023_get_mode(client) != ISL29023_ALS_ONCE_MODE &&
	    isl29023_get_mode(client) != ISL29023_ALS_CONT_MODE)
		return -EIO;

	return sprintf(buf, "%d\n", isl29023_get_int_ht_value(client));
}

static ssize_t isl29023_store_int_ht_lux(struct device *dev,
		struct device_attribute *attr, const char *buf, size_t count)
{
	struct i2c_client *client = to_i2c_client(dev);
	struct isl29023_data *data = &isl29023_sv;
	unsigned long val, lux_data;
	int range, bitdepth, ret;
	u8 lsb, msb;

	if ((kstrtoul(buf, 10, &val) < 0))
		return -EINVAL;

	/* No LUX data if not operational */
	if (isl29023_get_mode(client) != ISL29023_ALS_ONCE_MODE &&
	    isl29023_get_mode(client) != ISL29023_ALS_CONT_MODE)
		return -EIO;

	if (val > (gain_range[isl29023_get_range(client)]*499/data->rext))
		return -EINVAL;

	range = isl29023_get_range(client);
	bitdepth = (4 - isl29023_get_resolution(client)) * 4;
	lux_data = ((unsigned long)(val << bitdepth)) /
		((gain_range[range] * 499) / data->rext);
	lux_data &= 0xffff;

	msb = lux_data >> 8;
	lsb = lux_data & 0xff;

	mutex_lock(&data->lock);
	ret = i2c_smbus_write_byte_data(client, ISL29023_REG_IRQ_TH_HI_LSB,
					lsb);
	if (ret < 0) {
		mutex_unlock(&data->lock);
		return ret;
	}

	ret = i2c_smbus_write_byte_data(client, ISL29023_REG_IRQ_TH_HI_MSB,
					msb);
	if (ret < 0) {
		mutex_unlock(&data->lock);
		return ret;
	}

	data->reg_cache[ISL29023_REG_IRQ_TH_HI_MSB] = msb;
	data->reg_cache[ISL29023_REG_IRQ_TH_HI_LSB] = lsb;
	mutex_unlock(&data->lock);

	return count;
}

static DEVICE_ATTR(int_ht_lux, S_IWUSR | S_IRUGO,
		isl29023_show_int_ht_lux, isl29023_store_int_ht_lux);

static struct attribute *isl29023_attributes[] = {
	&dev_attr_int_persists.attr,
	&dev_attr_range.attr,
	&dev_attr_resolution.attr,
	&dev_attr_mode.attr,
	&dev_attr_power_state.attr,
	&dev_attr_lux.attr,
	&dev_attr_int_lt_lux.attr,
	&dev_attr_int_ht_lux.attr,
	&dev_attr_int_lt.attr,
	&dev_attr_int_ht.attr,
	&dev_attr_int_flag.attr,
	NULL
};

static const struct attribute_group isl29023_attr_group = {
	.attrs = isl29023_attributes,
};

static int isl29023_init_client(struct i2c_client *client)
{
	struct isl29023_data *data = &isl29023_sv;
	int i;

	/* read all the registers once to fill the cache.
	 * if one of the reads fails, we consider the init failed */
	for (i = 0; i < ARRAY_SIZE(data->reg_cache); i++) {
		int v = i2c_smbus_read_byte_data(client, i);
		if (v < 0)
			return -ENODEV;

		data->reg_cache[i] = v;
	}

	/* set defaults */
	isl29023_set_int_persists(client, ISL29023_INT_PERSISTS_8);
	isl29023_set_int_ht(client, 0xffff);
	isl29023_set_int_lt(client, 0x0);
	isl29023_set_range(client, ISL29023_RANGE_16K);
	isl29023_set_resolution(client, ISL29023_RES_16);
	isl29023_set_mode(client, ISL29023_ALS_ONCE_MODE);
	isl29023_set_int_flag(client, 0);
	isl29023_set_power_state(client, 0);

	return 0;
}

static void isl29023_work(struct work_struct *work)
{
	struct isl29023_data *data =
			container_of(work, struct isl29023_data, work);
	struct i2c_client *client = data->client;
	int lux;

	/* Clear interrupt flag */
	isl29023_set_int_flag(client, 0);

	data->mode_before_interrupt = isl29023_get_mode(client);
	lux = isl29023_get_adc_value(client);

	/* To clear the interrpt status */
	isl29023_set_power_state(client, ISL29023_PD_MODE);
	isl29023_set_mode(client, data->mode_before_interrupt);

	msleep(100);

	input_report_abs(data->input, ABS_MISC, lux);
	input_sync(data->input);
}

static irqreturn_t isl29023_irq_handler(int irq, void *handle)
{
	struct isl29023_data *data = handle;
	int cmd_1;
	cmd_1 = i2c_smbus_read_byte_data(data->client, ISL29023_COMMAND1);
	if (!(cmd_1 & ISL29023_INT_FLAG_MASK))
		return IRQ_NONE;

	queue_work(data->workqueue, &data->work);
	return IRQ_HANDLED;
}


static const struct i2c_device_id isl29023_id[] = {
	{ ISL29023_DRV_NAME, 0 },
	{}
};
MODULE_DEVICE_TABLE(i2c, isl29023_id);

static struct i2c_driver isl29023_driver = {
	.driver = {
		.name	= ISL29023_DRV_NAME,
		.owner	= THIS_MODULE,
		// .pm	= &isl29023_pm_ops,
	},
	// .probe	= isl29023_probe,
	// .remove	= isl29023_remove,
	.id_table = isl29023_id,
};

// struct isl29023_data isl29023_sv;

#define ISL29023_I2C_ADDR	0x44

extern void *ldr_malloc(unsigned int size);
extern int imx_i2c_probe(uint8_t bid, uint8_t chip);
char buf[32];

static int test(void) 
{
	size_t i, j = 0;
	int lux, pre_lux;
	ktime_t start, end;
	s64 interval;
	int count = 1;
	int c = 0;

	pre_lux = 0;
	lux = 0;

	printk("test isl29023 sw I/O.\n");

	pre_lux = 1;
	lux = 1;

	/* show isl29023 power state */
	isl29023_show_power_state(NULL, NULL, buf);
	printk("isl29023 power state: %s.\n", buf);

	/* activate isl29023 */
	buf[0] = '1';
	buf[1] = '\0';
	isl29023_store_power_state(NULL, NULL, buf, 1);

	/* show isl29023 power state */
	isl29023_show_power_state(NULL, NULL, buf);
	printk("isl29023 power state: %s.\n", buf);

	/* show isl29023 mode */
	isl29023_show_mode(NULL, NULL, buf);
	printk("isl29023 mode: %s.\n", buf);

	/* set isl29023 to polling mode */
	buf[0] = '5';
	buf[1] = '\0';
	isl29023_store_mode(NULL, NULL, buf, 1);

	/* show isl29023 mode */
	isl29023_show_mode(NULL, NULL, buf);
	printk("isl29023 mode: %s.\n", buf);

	/* read data from isl29023 */
	for (j = 0; j < 20; j++) {
		start = ktime_get();

		count = 0;

		while (1) {
			lux = sw_isl29023_get_adc_value();

			if (lux != pre_lux) {
				count++;
				pre_lux = lux;

				// printk("count %d: lux: %d.\n", count, lux);

				if (count >= 33) {
					break;
				}
			}
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
	/* copy sv from nw */
	int res;

	memcpy(&isl29023_sv, param_buf, sizeof(struct isl29023_data));

	/* mutex initialization */
	memset(&isl29023_sv.lock, NULL, sizeof(isl29023_sv.lock));
	mutex_init(&isl29023_sv.lock);

	/* i2c client initialization */
	isl29023_sv.client = ldr_malloc(sizeof(struct i2c_client));
	isl29023_sv.client->flags = 0;
	isl29023_sv.client->addr = ISL29023_I2C_ADDR;
	*((unsigned short *)(isl29023_sv.client) + 2) = 2; /* 0 -> i2c1 */

	res = imx_i2c_probe(0, ISL29023_I2C_ADDR);

	if (0 != res){
		pr_err("ERROR: isl29023 i2c probe fails. err code: 0x%08x.\n",
			res);
	} else {
		printk("success: isl29023 sw_probe().\n");
	}

	test();

	return 0;
}

static int __init isl29023_init(void)
{
	/* register driver */
	ldr_sw_driver_register(ISL29023_DRIVER_ID, dispatch, &isl29023_sv);

	return 0;
}

static void __exit isl29023_exit(void)
{
}

MODULE_AUTHOR("Freescale Semiconductor, Inc.");
MODULE_DESCRIPTION("ISL29023 ambient light sensor driver");
MODULE_LICENSE("GPL");
MODULE_VERSION(DRIVER_VERSION);

module_init(isl29023_init);
module_exit(isl29023_exit);
