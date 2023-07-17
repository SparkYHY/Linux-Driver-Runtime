/* hello_world.c */ 
#include <linux/init.h> 
#include <linux/module.h> 
#include <linux/kernel.h>
#include <linux/mutex.h>

#include "export.h"

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


struct mutex m;

static int __init first_init(void) 
{
   printk("ldr module says: Hello world!\n");
   printk("kernel va of printk(): 0x%08x.\n", printk); 

   printk("mutex size: %d.\n", sizeof(m));
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

