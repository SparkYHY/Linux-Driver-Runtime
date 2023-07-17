/* LDR linux subsystem function invocation redirection benchmarks */

#include <linux/delay.h>
#include <linux/device.h>
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

#include <linux/ldr.h>
#include <linux/ldr_redbench.h>

/* regular types */
void ldr_redbench_void_0(void) {}
void ldr_redbench_void_1(int arg1) {}
void ldr_redbench_void_2(int arg1, int arg2) {}
void ldr_redbench_void_3(int arg1, int arg2, int arg3) {}
void ldr_redbench_void_4(int arg1, int arg2, int arg3, int arg4) {}

int ldr_redbench_ret_0(void) { return 0; }
int ldr_redbench_ret_1(int arg1) { return 1; }
int ldr_redbench_ret_2(int arg1, int arg2) { return 2; }
int ldr_redbench_ret_3(int arg1, int arg2, int arg3) { return 3; }
int ldr_redbench_ret_4(int arg1, int arg2, int arg3, int arg4) { return 4; }

EXPORT_SYMBOL(ldr_redbench_void_0);
EXPORT_SYMBOL(ldr_redbench_void_1);
EXPORT_SYMBOL(ldr_redbench_void_2);
EXPORT_SYMBOL(ldr_redbench_void_3);
EXPORT_SYMBOL(ldr_redbench_void_4);
EXPORT_SYMBOL(ldr_redbench_ret_0);
EXPORT_SYMBOL(ldr_redbench_ret_1);
EXPORT_SYMBOL(ldr_redbench_ret_2);
EXPORT_SYMBOL(ldr_redbench_ret_3);
EXPORT_SYMBOL(ldr_redbench_ret_4);

void ldr_redbench_sync_0(void) {}
void ldr_redbench_sync_1(struct dummy *dummy1) {}
void ldr_redbench_sync_2(struct dummy *dummy1, struct dummy *dummy2) {}
void ldr_redbench_sync_3(struct dummy *dummy1, struct dummy *dummy2, 
			 struct dummy *dummy3) {}
void ldr_redbench_sync_4(struct dummy *dummy1, struct dummy *dummy2, 
			 struct dummy *dummy3, struct dummy *dummy4) {}
EXPORT_SYMBOL(ldr_redbench_sync_0);
EXPORT_SYMBOL(ldr_redbench_sync_1);
EXPORT_SYMBOL(ldr_redbench_sync_2);
EXPORT_SYMBOL(ldr_redbench_sync_3);
EXPORT_SYMBOL(ldr_redbench_sync_4);