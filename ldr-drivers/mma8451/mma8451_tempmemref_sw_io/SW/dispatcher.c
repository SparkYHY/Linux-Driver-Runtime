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
#include <linux/of.h>
#include <linux/regulator/consumer.h>

#include "dispatcher.h"

int dispatch(unsigned int func_id, unsigned char *param_buf) {
	int res = 0;

	switch (func_id) {
	case MAX8451_PROBE:
		pr_debug("inside sw_probe().\n");
		res = sw_probe(param_buf);
		break;

	case MAX8451_READ_DATA:
		pr_debug("inside sw_mma8451_read_data().\n");
		res = sw_mma8451_read_data(param_buf);
		pr_debug("sw_mma8451_read_data() success.\n");
		break;

	default:
		pr_err("ERROR: Unknown function.\n");
		break;
	}

	return res;
}
