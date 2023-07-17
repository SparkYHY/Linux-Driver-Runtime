/* SPDX-License-Identifier: BSD-2-Clause */
/**
 * The abbreviation "ldr" stands for "Linux Driver Runtime".
 * 
 * 
*/

#ifndef LDR_H
#define LDR_H

#include <inttypes.h>
#include <trace.h>
#include <utee_defines.h>
#include <kernel/thread.h>
#include <drivers/imx_gpt.h>
#include <ldr/state_var.h>
#include <ldr/ldr_gate.h>

/* LDR magic code */
#define LDR_MAGIC 0xBA0E9C3D

#define LDR_ENABLE LDR_MAGIC
#define LDR_DISABLE 0xDEADBEEF

/**
 * reference by code for checking whether LDR framework is enabled 
 * LDR_DISABLE: disabled
 * LDR_ENABLE : enabled
 * 
 * The ldr_magic var is statically initialized to LDR_MAGIC during booting.
*/
static unsigned int __maybe_unused ldr_magic = LDR_DISABLE;

/* check whether the fdt is valid for LDR framework */
int ldr_check_fdt(vaddr_t fdt);

/* convert dtb to dts and print the extracted dts to console */
#ifdef CFG_LDR_DEBUG
void ldr_fdt2dts(vaddr_t fdt_va);
#else
void ldr_fdt2dts(vaddr_t fdt_va) {}
#endif /* CFG_LDR_DEBUG */

/* Linux kernel exported function addresses */
#define NW_CLK_ENABLE		0x80463130
#define NW_CLK_DISABLE		0x80463054
#define NW_CLK_PREPARE		0x80463798
#define NW_CLK_UNPREPARE	0x8046376c
#define NW_MSLEEP		0x80184b20
#define NW_KTIME_GET		0x801874e4
#define NW_KTIME_GET_REAL_SECONDS	0x80187124


#define NW_i2c_smbus_read_i2c_block_data	0x8068e820
#define NW_i2c_smbus_read_byte_data		0x8068e65c
#define NW_i2c_smbus_write_byte_data		0x8068e69c

#define LFC_NW_ENTRY		0x807b6ac8
#define LFC_NW_STACK_ADDR	0x884d9000
#define LFC_STACK_SIZE		1024

#define REDBENCH_VOID_0		0x807b5930
#define REDBENCH_VOID_1		0x807b5934
#define REDBENCH_VOID_2		0x807b5938
#define REDBENCH_VOID_3		0x807b593c
#define REDBENCH_VOID_4		0x807b5940

#define REDBENCH_RET_0		0x807b5944
#define REDBENCH_RET_1		0x807b594c
#define REDBENCH_RET_2		0x807b5954
#define REDBENCH_RET_3		0x807b595c
#define REDBENCH_RET_4		0x807b5964

#define REDBENCH_SYNC_1		0x807b596c
#define REDBENCH_SYNC_2		0x807b5970
#define REDBENCH_SYNC_3		0x807b5974
#define REDBENCH_SYNC_4		0x807b5978
#define REDBENCH_SYNC_0		0x807b597c

#define MAX_ARG_COUNT		4
#define LDR_RPC_ARG_TYPE_MASK(n)	0x01 << n
#define LDR_RPC_ARG_TYPES(t0,t1,t2,t3) \
   ((t0) | ((t1) << 4) | ((t2) << 8) | ((t3) << 12))

typedef int (*dispatch)(unsigned int func_id, unsigned char *param_buf);

struct ldr_driver_shm_info {
	paddr_t shm_pa;
	vaddr_t shm_va;
	uint32_t shm_size;
};

struct ldr_driver_info {
	uint32_t id;
	dispatch disp;
	uint32_t *sv;	/* quick ref to sv buffer */
	struct state_var *state_var; /* secure ele bitmap */
	struct ldr_driver_shm_info shm_info;
	struct hook_info *hook_info;

	struct module *mod;
	uint32_t ied_num; /* 1 or 2 */
};

/**
 * Parameter arrangements:
 * @mod:	pointer to the module binary inside the shared memory
 * @len:	size of the module binary
*/
int ldr_init_module(void *mod, unsigned long len);

/**
 * Parameter arrangements:
 * @driver_id:	driver identifier
 * @dispatch:	driver SW stub dispatching entry point
 * @id:		driver SW state variable
*/
int ldr_sw_driver_register(uint32_t driver_id, dispatch disp, void *sv);

/**
 * Parameter arrangements:
 * @driver_id:	driver identifier
 * @shm_pa:	pa of the driver shm allocated by nw
 * @shm_size:	size of the driver shm allocated by nw
*/
uint32_t ldr_register_shm(uint32_t driver_id, 
			  paddr_t shm_pa, uint32_t shm_size);

/**
 * Parameter arrangements:
 * @driver_id:	driver identifier
*/
struct ldr_driver_info *ldr_get_driver_info(uint32_t driver_id);
dispatch ldr_get_dispatcher(uint32_t driver_id);
uint32_t *ldr_get_sv(uint32_t driver_id);
vaddr_t ldr_get_shm(uint32_t driver_id);

/**
 * Parameter arrangements:
 * @driver_id:	driver identifier
*/
uint32_t ldr_sw_set_cur_driver_id(uint32_t driver_id);
uint32_t ldr_sw_get_cur_driver_id(void);

/**
 * Get the hook_info (driver info) that the callsite va belongs to.
*/
struct hook_info *get_hook_info(vaddr_t callsite_va);

/**
 * sttribute show & store
*/
uint32_t attr_show_str(const char *func_name, char *buf);
uint32_t attr_store_str(const char *func_name, char *buf, size_t count);
uint32_t attr_show_addr(vaddr_t addr, char *buf);
uint32_t attr_store_addr(vaddr_t addr, char *buf, size_t count);

/**
 * find va of an exported function
*/
vaddr_t find_sym_addr(const char *func_name);

/**
 * char device operations
*/
TEE_Result cdev_open(uint32_t type, TEE_Param p[TEE_NUM_PARAMS]);
TEE_Result cdev_release(uint32_t type, TEE_Param p[TEE_NUM_PARAMS]);
TEE_Result cdev_write(uint32_t type, TEE_Param p[TEE_NUM_PARAMS]);
TEE_Result cdev_read(uint32_t type, TEE_Param p[TEE_NUM_PARAMS]);

void msleep(unsigned long msec);

#endif /* LDR_H */