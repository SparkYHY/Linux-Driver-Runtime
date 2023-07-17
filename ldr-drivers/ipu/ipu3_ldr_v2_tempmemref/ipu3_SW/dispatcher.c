#include <linux/busfreq-imx.h>
#include <linux/clk.h>
#include <linux/clk-provider.h>
#include <linux/delay.h>
#include <linux/err.h>
#include <linux/init.h>
#include <linux/interrupt.h>
#include <linux/io.h>
#include <linux/ipu-v3.h>
#include <linux/irq.h>
#include <linux/irqdesc.h>
#include <linux/module.h>
#include <linux/mod_devicetable.h>
#include <linux/of_device.h>
#include <linux/platform_device.h>
#include <linux/pm_runtime.h>
#include <linux/reset.h>
#include <linux/spinlock.h>
#include <linux/types.h>

#include "dispatcher.h"

int dispatch(unsigned int func_id, unsigned char *param_buf) {
	int res = 0;

	switch (func_id) {
	case IPU_PROBE:
		pr_debug("dispatching inside sw_probe().\n");
		res = sw_probe(param_buf);
		break;

	case IPU_INIT_CHANNEL:
		pr_debug("dispatching inside sw_ipu_init_channel().\n");
		res = sw_ipu_init_channel(param_buf);
		break;

	case IPU_UNINIT_CHANNEL:
		pr_debug("dispatching inside sw_ipu_uninit_channel().\n");
		res = sw_ipu_uninit_channel(param_buf);
		break;

	case IPU_INIT_CHANNEL_BUFFER:
		pr_debug("dispatching inside sw_ipu_init_channel_buffer().\n");
		res = sw_ipu_init_channel_buffer(param_buf);
		break;

	case IPU_UPDATE_CHANNEL_BUFFER:
		pr_debug("dispatching inside sw_ipu_update_channel_buffer().\n");
		res = sw_ipu_update_channel_buffer(param_buf);
		break;

	case IPU_SELECT_BUFFER:
		pr_debug("dispatching inside sw_ipu_select_buffer().\n");
		res = sw_ipu_select_buffer(param_buf);
		break;

	case IPU_ENABLE_CHANNEL:
		pr_debug("dispatching inside sw_ipu_enable_channel().\n");
		res = sw_ipu_enable_channel(param_buf);
		break;

	case IPU_DISABLE_CHANNEL:
		pr_debug("dispatching inside sw_ipu_disable_channel().\n");
		res = sw_ipu_disable_channel(param_buf);
		break;

	case IPU_ENABLE_CSI:
		pr_debug("dispatching inside sw_ipu_enable_csi().\n");
		res = sw_ipu_enable_csi(param_buf);
		break;

	case IPU_DISABLE_CSI:
		pr_debug("dispatching inside sw_ipu_disable_csi().\n");
		res = sw_ipu_disable_csi(param_buf);
		break;

	case IPU_REQUEST_IRQ:
		pr_debug("dispatching inside sw_ipu_request_irq().\n");
		res = sw_ipu_request_irq(param_buf);
		break;

	case IPU_FREE_IRQ:
		pr_debug("dispatching inside sw_ipu_free_irq().\n");
		res = sw_ipu_free_irq(param_buf);
		break;

	default:
		pr_err("ERROR: Unknown function.\n");
		break;
	}

	return res;
}
