/* hello_world.c */ 
#include <linux/init.h> 
#include <linux/module.h> 
#include <linux/kernel.h>

#include <linux/ldr.h>
#include <linux/teek.h>
#include "dispatcher.h"
#include "ldr_pta.h"

struct ldr_ctx {
	TEEK_Context ctx;
	TEEK_Session sess;
};

struct ldr_ctx hw_ctx;

spinlock_t hw_ldr_spin_lock;

unsigned char param_buf[MAX_PARAM_BUF_SIZE];

struct data {
	unsigned int a1;
	unsigned int a2;
	unsigned int a3;
	unsigned int a4;
	unsigned int a5;
	unsigned int a6;
	unsigned int a7;
};

struct driver_state_var {
	struct data data;
	unsigned int regs[10];
	unsigned int a3;
	unsigned int a4;
	unsigned int a5;
	unsigned int a6;
	unsigned int a7;
	struct module *m;
};

struct driver_state_var sv;

extern int printk(const char *fmt, ...);

int test_export(const char *msg) {
	printk("printing msg: %s.\n", msg);

	return 0;
}
EXPORT_SYMBOL(test_export);

static int prepare_tee_session(struct ldr_ctx *ctx)
{
	TEEK_UUID uuid = PTA_LDR_UUID;
	uint32_t origin;
	TEEK_Result res;

	/* Initialize a context connecting us to the TEE */
	res = TEEK_InitializeContext(&hw_ctx.ctx);
	if (res != TEEK_SUCCESS) {
		pr_err("TEEK_InitializeContext failed with code 0x%x", res);
		return -1;
	}

	/* Open a session with the LDR PTA */
	res = TEEK_OpenSession(&hw_ctx.ctx, &hw_ctx.sess, &uuid,
				   TEEK_LOGIN_REE_KERNEL, NULL, NULL, &origin);
	if (res != TEEK_SUCCESS) {
		pr_err("TEEK_Opensession failed with code 0x%x origin 0x%x",
			res, origin);
		return -1;
	}

	return TEEK_SUCCESS;
}

static void terminate_tee_session(struct ldr_ctx *ctx)
{
	TEEK_CloseSession(&hw_ctx.sess);
	TEEK_FinalizeContext(&hw_ctx.ctx);
}

static int sw_probe(void) {
	TEEK_Operation op;
	uint32_t origin;
	TEEK_Result res;
	int ret;
	unsigned int lock_flags;
	spin_lock_irqsave(&hw_ldr_spin_lock, lock_flags);
	uint32_t sv_pa;

	memset(&op, 0, sizeof(op));
	/**
	 * @param 1	driver ID, function ID
	 * @param 2	state variable + nw sv pa
	 * @param 3	none
	 * @param 4	none
	*/
	op.paramTypes = TEEK_PARAM_TYPES(
				TEEK_VALUE_INPUT,
				TEEK_MEMREF_TEMP_INPUT,
				TEEK_NONE,
				TEEK_VALUE_INPUT);

	/* driver ID, function ID */
	op.params[0].value.a = HW_DRIVER_ID;
	op.params[0].value.b = HW_PROBE;

	/* state variable info */
	op.params[1].tmpref.buffer = &sv;
	op.params[1].tmpref.size = sizeof(sv);

	sv_pa = vaddr2paddr(&sv); /* not NULL */
	if (sv_pa == 0) {
		pr_err("error when get nw sv pa.\n");
	}
	op.params[3].value.a = sv_pa;

	/* register basic driver info to nw LDR framework */
	ldr_nw_driver_register(HW_DRIVER_ID, &sv, sizeof(sv));

	res = TEEK_InvokeCommand(&hw_ctx.sess, LDR_CMD_SW_DRIVER_PROBE,
				 &op, &origin);
	if (res != TEEK_SUCCESS) {
		pr_err("TEEK_InvokeCommand(HW_PROBE) failed 0x%x origin 0x%x",
			res, origin);
		return TEEK_ERROR_GENERIC;
	}

	spin_unlock_irqrestore(&hw_ldr_spin_lock, lock_flags);

	return res;
}

static int __init first_init(void) 
{
	/* register driver */
	int res;

	sv.data.a1 = 0x12345678;
	sv.data.a3 = 0x78563412;
	sv.a5 = 0xdeadbeef;
	sv.m = 0xefbeadde;

	spin_lock_init(&hw_ldr_spin_lock);

	res = prepare_tee_session(&hw_ctx);
	if (res != TEEK_SUCCESS) {
		pr_err("ERROR: when open session with ldr pta.\n");
	} else {
		printk("success: hello_world open session with ldr pta.\n");
	}

	res = sw_probe();
	if (res != TEEK_SUCCESS) {
		pr_err("ERROR: when sw_probe().\n");
	} else {
		printk("success: sw_probe().\n");
	}

	return 0; 
}

static void __exit first_exit(void) 
{   
	printk("Bye\n"); 
} 

module_init(first_init);
module_exit(first_exit); 
MODULE_LICENSE("GPL"); 
MODULE_DESCRIPTION("ldr first module"); 

