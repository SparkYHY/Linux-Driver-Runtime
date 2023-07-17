/* hello_world.c */ 
#include <linux/init.h> 
#include <linux/module.h> 
#include <linux/kernel.h>

#include "export.h"
#include "dispatcher.h"

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
DECLARE_SEC_ELEMENT(sv, sv.data.a1);
DECLARE_SEC_ELEMENT(sv, sv.data.a3);
DECLARE_SEC_ELEMENT(sv, sv.regs);
DECLARE_SEC_ELEMENT(sv, sv.m);

extern int printk(const char *fmt, ...);

int test_export(const char *msg) {
	printk("printing msg: %s.\n", msg);

	return 0;
}
EXPORT_SYMBOL(test_export);

static struct driver_state_var *get_sw_sv(void) {
	return &sv;
}

int sw_probe(unsigned char *param_buf) {
	int res;

	/* copy sv from nw */
	memcpy(get_sw_sv(), param_buf, sizeof(struct driver_state_var));

	return 0;
}

static int __init first_init(void) 
{
	/* register driver */
	int i;

	printk("first_init addr: 0x%08x.\n", first_init);
	printk("inside %s.\n", __func__);
	ldr_sw_driver_register(HW_DRIVER_ID, dispatch, get_sw_sv());

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

