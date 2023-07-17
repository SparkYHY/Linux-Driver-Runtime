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
	case MAG3110_PROBE:
		pr_debug("inside sw_probe().\n");
		res = sw_probe(param_buf);
		break;

	default:
		pr_err("ERROR: Unknown function.\n");
		break;
	}

	return res;
}
