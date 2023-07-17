#include <linux/arm-smccc.h>
#include <linux/delay.h>
#include <linux/device.h>
#include <linux/export.h>
#include <linux/mm.h>
#include <linux/list.h>
#include <linux/slab.h>
#include <linux/teek.h>
#include <linux/tee_drv.h>
#include <linux/clk.h>
#include <linux/clk-provider.h>
#include "optee_private.h"
#include "optee_smc.h"
#include "optee_msg.h"

#include <linux/kobject.h>
#include <linux/kernel.h>
#include <linux/interrupt.h>

#include <asm/setup.h>

#include <linux/ldr.h>

#define LFC_STACK_SIZE	1024


spinlock_t ldr_lfc_spin_lock;

volatile int ldr_fiq_callback_on = 0;
EXPORT_SYMBOL(ldr_fiq_callback_on);

typedef int (*ldr_callback)(unsigned int a0,
			    unsigned int a1,
			    unsigned int a2,
			    unsigned int a3);

/* only called from sm */
static void ldr_fiq_callback(void) {
	/**
	 * target linux function address (linux kaddress)
	 * 1st arguement to the target linux function
	 * 2nd arguement to the target linux function 
	 * 3rd arguement to the target linux function
	 * 4th arguement to the target linux function
	*/
	unsigned int lock_flags;

	spin_lock_irqsave(&ldr_lfc_spin_lock, lock_flags);

	pr_debug("inside %s().\n", __func__);

	ldr_fiq_callback_on = 1;

	ldr_callback callback;
	unsigned int a0;
	unsigned int a1;
	unsigned int a2;
	unsigned int a3;
	unsigned char *param_buf = ldr_nw_get_driver_shm(1);

	if (param_buf == NULL) {
		pr_err("ERROR: NULL param buffer ptr.\n");
		return -1;
	}

	int res;

	callback = *(unsigned int *)param_buf;
	param_buf += sizeof(unsigned int);

	a0 = *(unsigned int *)param_buf;
	param_buf += sizeof(a0);

	a1 = *(unsigned int *)param_buf;
	param_buf += sizeof(a1);

	a2 = *(unsigned int *)param_buf;
	param_buf += sizeof(a2);

	a3 = *(unsigned int *)param_buf;
	param_buf += sizeof(a3);

	pr_debug("callback: 0x%08x.\n a0: 0x%08x.\n a1: 0x%08x.\n "
		"a2: 0x%08x.\n a3: 0x%08x.\n",
		callback, a0, a1, a2, a3);

	if (callback == NULL) {
		pr_err("ERROR: callback address is NULL.\n");
	}

	/* execute the callback function */
	res = (*callback)(a0, a1, a2, a3);

	/* save the callback invocation result into the param buf */
	param_buf = ldr_nw_get_driver_shm(1);	/* reset the buffer ptr */
	*(int *)param_buf = res;

	ldr_fiq_callback_on = 0;

	spin_unlock_irqrestore(&ldr_lfc_spin_lock, lock_flags);

	/**
	 * Indicate SM that this is the end of LFC. Such an indicator is
	 * really important cause there may be std secure function 
	 * invocation inside LFC NW callbacks.
	*/
	arm_smccc_smc(OPTEE_SMC_RETURN_LDR_CALLBACK_FIQ, 
		      0, 0, 0, 0, 0, 0, 0, NULL);

	pr_err("ERROR: ldr_fiq_callback() should never return.\n");
}
EXPORT_SYMBOL(ldr_fiq_callback);