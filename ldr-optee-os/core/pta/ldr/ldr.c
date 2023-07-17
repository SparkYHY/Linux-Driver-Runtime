/**
 * LDR PTA main source code
 * 
 * 
*/

#include <compiler.h>
#include <stdio.h>
#include <stdlib.h>
#include <trace.h>
#include <kernel/pseudo_ta.h>
#include <kernel/thread.h>
#include <malloc.h>
#include <mm/tee_pager.h>
#include <mm/tee_mm.h>
#include <printk.h>
#include <string.h>
#include <string_ext.h>
#include <trace.h>
#include <kernel/spinlock.h>
#include <kernel/export.h>
#include <optee_rpc_cmd.h>
#include <drivers/imx_i2c.h>
#include <kernel/cache_helpers.h>
#include <drivers/imx_gpt.h>

#include <ldr/ldr.h>
#include <ldr/state_var.h>
#include <ldr/ldr_dac.h>

#define TA_NAME	"ldr.pta"

/* 13e7ebe3-121c-48e0-b9ee-9f2ad2261080 */
#define LDR_UUID \
	{ 0x13e7ebe3, 0x121c, 0x48e0, \
	{ 0xb9, 0xee, 0x9f, 0x2a, 0xd2, 0x26, 0x10, 0x80 } }

#define LDR_CMD_LOAD_MODULE		0
#define LDR_CMD_SW_DRIVER_PROBE		1
#define LDR_CMD_INVOKE_FUNCTION		2

/* char device commands */
#define LDR_CMD_CDEV_OPEN		0x21
#define LDR_CMD_CDEV_RELEASE		0x22
#define LDR_CMD_CDEV_READ		0x23
#define LDR_CMD_CDEV_WRITE		0x24

/**
 * Seems like we can not remove such function. Thus we have to live 
 * with it.
*/
#ifndef CFG_TEE_CORE_DEBUG
void *__aeabi_unwind_cpp_pr0() {}
#else
extern void *__aeabi_unwind_cpp_pr0();
#endif
typedef struct { int quot; int rem; } idiv_return;
extern idiv_return __aeabi_idivmod(int numerator, int denominator);
extern int __aeabi_idiv(int numerator, int denominator);
// void __stack_chk_fail(void) {
// 	EMSG("Error: Kernel stack is corrupted\n");
// }
extern void __stack_chk_fail(void);
extern void __aeabi_uidiv(void);
extern void __aeabi_uidivmod(void);
void __do_div64(void) {}

TEE_EXPORT_SYMBOL(__aeabi_unwind_cpp_pr0);
TEE_EXPORT_SYMBOL(__aeabi_idivmod);
TEE_EXPORT_SYMBOL(__aeabi_idiv);
TEE_EXPORT_SYMBOL(__stack_chk_fail);
TEE_EXPORT_SYMBOL(__aeabi_uidiv);
TEE_EXPORT_SYMBOL(__aeabi_uidivmod);
TEE_EXPORT_SYMBOL(__do_div64);

/*------------------------Debug Output------------------------*/

extern int printk(const char *fmt, ...);
extern void ldr_printf(const char *fmt, va_list ap);

void warn_slowpath_fmt(const char *file, const int line, unsigned taint,
		       const char *fmt, ...) {
	va_list ap;

	va_start(ap, fmt);
	trace_vprintf(file, line, taint, true, fmt, ap);
	va_end(ap);
}

void warn_slowpath_null(const char *file, int line) {}

void dev_warn(const unsigned char *dev, const char *fmt, ...) {
	va_list ap;

	va_start(ap, fmt);
	ldr_printf(fmt, ap);
	va_end(ap);
}

void dev_err(const unsigned char *dev, const char *fmt, ...) {
	va_list ap;

	va_start(ap, fmt);
	ldr_printf(fmt, ap);
	va_end(ap);
}

void __dynamic_dev_dbg(unsigned char *descriptor,
			  const unsigned char *dev, const char *fmt, ...) {
	va_list ap;

	va_start(ap, fmt);
	ldr_printf(fmt, ap);
	va_end(ap);
}

void __dynamic_pr_debug(unsigned char *descriptor, const char *fmt, ...) {
	va_list ap;

	va_start(ap, fmt);
	ldr_printf(fmt, ap);
	va_end(ap);
}

void dump_stack() {}

void ldr_dump(void *addr, size_t len) {
	dhex_dump(NULL, 0, 0, addr, len);
}

extern void __gnu_mcount_nc(void) {}

TEE_EXPORT_SYMBOL(printk);
TEE_EXPORT_SYMBOL(warn_slowpath_fmt);
TEE_EXPORT_SYMBOL(warn_slowpath_null);
TEE_EXPORT_SYMBOL(dev_warn);
TEE_EXPORT_SYMBOL(dev_err);
TEE_EXPORT_SYMBOL(__dynamic_dev_dbg);
TEE_EXPORT_SYMBOL(__dynamic_pr_debug);
TEE_EXPORT_SYMBOL(dump_stack);
TEE_EXPORT_SYMBOL(ldr_dump);
TEE_EXPORT_SYMBOL(__gnu_mcount_nc);

/*
  mm functions to be tested:
  memset() - wrap core memset()
  kfree() - wrap core free()
  __kmalloc() - wrap core malloc()
  kmem_cache_alloc_trace() - new func
  Involved linux global kernel data structure:
  kmalloc_caches - new dummy pointer
*/

void *kmalloc_caches; // dummy symbol

/**
 * This function can only be used by SW drivers. Any IED-specific
 * memory allocation should use ldr_malloc_ied().
*/
void *ldr_malloc(size_t size) {
	struct ldr_driver_info *drv_info;
	int ied_num;
	uint32_t current_driver_id = ldr_sw_get_cur_driver_id();

	/* get the current ldr_driver_info */
	drv_info = ldr_get_driver_info(current_driver_id);

	/* get the IED the current driver reside */
	ied_num = drv_info->ied_num;

	/* invoke the corresponding memory allocator to allocate memory */
	return ldr_malloc_ied(size, ied_num);
}

void *kmem_cache_alloc_trace
(void *s, size_t gfpflags, size_t size) {
	void * buf;

	buf = ldr_malloc(size);

	return buf;
}

void *__kmalloc(size_t size, size_t flags) {
	void * buf;

	buf = ldr_malloc(size);

	return buf;
}

/**
 * This function can only be used by SW drivers. Any IED-specific
 * memory allocation should use ldr_free_ied().
*/
void *ldr_free(void *ptr) {
	struct ldr_driver_info *drv_info;
	int ied_num;
	uint32_t current_driver_id = ldr_sw_get_cur_driver_id();

	/* get the current ldr_driver_info */
	drv_info = ldr_get_driver_info(current_driver_id);

	/* get the IED the current driver reside */
	ied_num = drv_info->ied_num;

	/* invoke the corresponding memory allocator to allocate memory */
	ldr_free_ied(ptr, ied_num);
}

void kfree(void *ptr){
	ldr_free(ptr);
}

void __memzero(void *ptr, size_t n) {
	memset(ptr, '\0', n);
}

extern int memcmp(const void *__s1, const void *__s2, size_t __n);
extern void *memset(void *s, int c, size_t n);
extern void *memcpy(void *__restrict s1, const void *__restrict s2, size_t n);
extern size_t strlen(const char *s);
extern int sprintf(char *str, const char *fmt, ...);

int _kstrtoul(const char *s, unsigned int base, long *res) {
	char *endptr;

	*res = strtoul(s, &endptr, base);

	return 0;
}

int _kstrtol(const char *s, unsigned int base, long *res) {
	char *endptr;

	*res = strtoul(s, &endptr, base);

	return 0;
}

TEE_EXPORT_SYMBOL(kmalloc_caches);
TEE_EXPORT_SYMBOL(kmem_cache_alloc_trace);
TEE_EXPORT_SYMBOL(ldr_malloc);
TEE_EXPORT_SYMBOL(__kmalloc);
TEE_EXPORT_SYMBOL(kfree);
TEE_EXPORT_SYMBOL(__memzero);
TEE_EXPORT_SYMBOL(memset);
TEE_EXPORT_SYMBOL(memcpy);
TEE_EXPORT_SYMBOL(memcmp);
TEE_EXPORT_SYMBOL(strlen);
TEE_EXPORT_SYMBOL(sprintf);
TEE_EXPORT_SYMBOL(_kstrtoul);
TEE_EXPORT_SYMBOL(_kstrtol);

/**
 * TODO: concurrency
*/

/* semaphor */
int down_interruptible(void *sem) {
	return 0;
}
void up(void *sem) {}

/* raw spin lock */
void _raw_spin_unlock_irqrestore(uint32_t *lock, unsigned long flags) {
	cpu_spin_unlock_xrestore(lock, flags);
}

unsigned long _raw_spin_lock_irqsave(uint32_t *lock) {
	long res;

	res = cpu_spin_lock_xsave(lock);

	return res;
}

void _raw_spin_lock(uint32_t *lock) {
	cpu_spin_lock(lock);
}

void _raw_spin_unlock(uint32_t *lock) {
	cpu_spin_unlock(lock);
}

/* mutex - linux mutex structure fed to SW mutex functions */
extern void mutex_init(struct mutex *m);
extern void mutex_unlock(struct mutex *m);
extern void mutex_lock(struct mutex *m);

void __mutex_init(struct mutex *m, const char *name, uint32_t *key) {
	mutex_init(m);
}

TEE_EXPORT_SYMBOL(down_interruptible);
TEE_EXPORT_SYMBOL(up);
TEE_EXPORT_SYMBOL(_raw_spin_unlock_irqrestore);
TEE_EXPORT_SYMBOL(_raw_spin_lock_irqsave);
TEE_EXPORT_SYMBOL(_raw_spin_unlock);
TEE_EXPORT_SYMBOL(_raw_spin_lock);
TEE_EXPORT_SYMBOL(__mutex_init);
TEE_EXPORT_SYMBOL(mutex_unlock);
TEE_EXPORT_SYMBOL(mutex_lock);

/* PM related functions - empty */
int __pm_runtime_suspend(unsigned char *dev, int rpmflags) {
	return 0;
}
int __pm_runtime_resume(unsigned char *dev, int rpmflags) {
	return 0;
}
void release_bus_freq(unsigned int mode) {}
void request_bus_freq(unsigned int mode) {}

TEE_EXPORT_SYMBOL(__pm_runtime_suspend);
TEE_EXPORT_SYMBOL(__pm_runtime_resume);
TEE_EXPORT_SYMBOL(release_bus_freq);
TEE_EXPORT_SYMBOL(request_bus_freq);

static int is_member_ptr(uint32_t member, uint32_t sv, uint32_t sv_size) {
	if (member >= sv &&
	    member < sv + sv_size &&
	    member % 4 == 0) {
		/* a ptr to some sv member */
		return 1;
	} else {
		/* just some value (linux ptr or some regular value) */
		return 0;
	}
}

/* clk framework functions using backward linux function invocation */
int clk_enable(uint32_t *clk) {
	TEE_Result res;

	uint32_t current_driver_id = ldr_sw_get_cur_driver_id();

	/**
	 * @params[0].u.value.a	driver ID to retrieve the driver's sv
	 * @params[0].u.value.b	target linux function address (linux kaddress)
	 * @params[0].u.value.c	target linux function type (1-ret, 0-void)
	 * 
	 * @params[1].u.value.a	target linux function arg type
	 * @params[1].u.value.b	1st arguement to the target linux function
	 * @params[1].u.value.c	2nd arguement to the target linux function
	 * 
	 * @params[2].u.value.a	3rd arguement to the target linux function
	 * @params[2].u.value.b	4th arguement to the target linux function
	 * @params[2].u.value.c	result for return functions [out]
	*/

	if (current_driver_id == 0) {
		EMSG("ERROR: NULL current driver id.");
	}

	uint32_t *current_sv = ldr_get_sv(current_driver_id);
	if (!current_sv) {
		EMSG("ERROR: empty sv for current driver%d", current_driver_id);
	}

	struct thread_param params[3];

	// DMSG("sw: ipu sv address: 0x%08x.", current_sv);
	// DMSG("sw: ipu->clk address: 0x%08x.", clk);
	// DMSG("sw: &ipu->clk ptr address: 0x%08x.", &clk);

	params[0].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[1].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[2].attr = THREAD_PARAM_ATTR_VALUE_INOUT;

	params[0].u.value.a = current_driver_id;
	params[0].u.value.b = NW_CLK_ENABLE;
	params[0].u.value.c = 1;

	params[1].u.value.a = 0x00;
	params[1].u.value.b = clk;
	params[1].u.value.c = 0;

	params[2].u.value.a = 0;
	params[2].u.value.b = 0;

	// DMSG("clk offset: %d", (uint32_t)&clk - (uint32_t)current_sv);

	res = thread_rpc_cmd(OPTEE_RPC_CMD_LDR_LINUX_BKWD_RPC, 3, &params);
	if (res != TEE_SUCCESS) {
		EMSG("ERROR: ldr backward linux rpc fails.");
	}

	res = params[2].u.value.c;

	return res;
}

void clk_disable(uint32_t *clk) {
	TEE_Result res;

	uint32_t current_driver_id = ldr_sw_get_cur_driver_id();

	if (current_driver_id == 0) {
		EMSG("ERROR: NULL current driver id.");
	}

	uint32_t *current_sv = ldr_get_sv(current_driver_id);
	if (!current_sv) {
		EMSG("ERROR: empty sv for current driver%d", current_driver_id);
	}

	struct thread_param params[3];

	params[0].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[1].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[2].attr = THREAD_PARAM_ATTR_VALUE_INOUT;

	params[0].u.value.a = current_driver_id;
	params[0].u.value.b = NW_CLK_DISABLE;
	params[0].u.value.c = 0;

	params[1].u.value.a = 0x00;
	params[1].u.value.b = clk;
	params[1].u.value.c = 0;

	params[2].u.value.a = 0;
	params[2].u.value.b = 0;

	res = thread_rpc_cmd(OPTEE_RPC_CMD_LDR_LINUX_BKWD_RPC, 3, &params);
	if (res != TEE_SUCCESS) {
		EMSG("ERROR: ldr backward linux rpc fails.");
	}
}

/* other clock framework functions - temporary stubs for POC */
uint32_t *clk_register(uint32_t *dev, uint32_t *hw) {
	return NULL;
}
int clk_prepare(uint32_t *clk) {
	TEE_Result res;

	uint32_t current_driver_id = ldr_sw_get_cur_driver_id();

	/**
	 * @params[0].u.value.a	driver ID to retrieve the driver's sv
	 * @params[0].u.value.b	target linux function address (linux kaddress)
	 * @params[0].u.value.c	target linux function type (1-ret, 0-void)
	 * 
	 * @params[1].u.value.a	target linux function arg type
	 * @params[1].u.value.b	1st arguement to the target linux function
	 * @params[1].u.value.c	2nd arguement to the target linux function
	 * 
	 * @params[2].u.value.a	3rd arguement to the target linux function
	 * @params[2].u.value.b	4th arguement to the target linux function
	 * @params[2].u.value.c	result for return functions [out]
	*/

	if (current_driver_id == 0) {
		EMSG("ERROR: NULL current driver id.");
	}

	uint32_t *current_sv = ldr_get_sv(current_driver_id);
	if (!current_sv) {
		EMSG("ERROR: empty sv for current driver%d", current_driver_id);
	}

	struct thread_param params[3];

	params[0].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[1].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[2].attr = THREAD_PARAM_ATTR_VALUE_INOUT;

	params[0].u.value.a = current_driver_id;
	params[0].u.value.b = NW_CLK_PREPARE;
	params[0].u.value.c = 1;

	params[1].u.value.a = 0x00;
	params[1].u.value.b = clk;
	params[1].u.value.c = 0;

	params[2].u.value.a = 0;
	params[2].u.value.b = 0;

	res = thread_rpc_cmd(OPTEE_RPC_CMD_LDR_LINUX_BKWD_RPC, 3, &params);
	if (res != TEE_SUCCESS) {
		EMSG("ERROR: ldr backward linux rpc fails.");
	}

	res = params[2].u.value.c;

	return res;
}

void clk_unprepare(uint32_t *clk) {
	TEE_Result res;

	uint32_t current_driver_id = ldr_sw_get_cur_driver_id();

	if (current_driver_id == 0) {
		EMSG("ERROR: NULL current driver id.");
	}

	uint32_t *current_sv = ldr_get_sv(current_driver_id);
	if (!current_sv) {
		EMSG("ERROR: empty sv for current driver%d", current_driver_id);
	}

	struct thread_param params[3];

	params[0].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[1].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[2].attr = THREAD_PARAM_ATTR_VALUE_INOUT;

	params[0].u.value.a = current_driver_id;
	params[0].u.value.b = NW_CLK_UNPREPARE;
	params[0].u.value.c = 0;

	params[1].u.value.a = 0x00;
	params[1].u.value.b = clk;
	params[1].u.value.c = 0;

	params[2].u.value.a = 0;
	params[2].u.value.b = 0;

	res = thread_rpc_cmd(OPTEE_RPC_CMD_LDR_LINUX_BKWD_RPC, 3, &params);
	if (res != TEE_SUCCESS) {
		EMSG("ERROR: ldr backward linux rpc fails.");
	}
}

unsigned long clk_get_rate(uint32_t *clk) {
	return 0;
}

TEE_EXPORT_SYMBOL(clk_enable);
TEE_EXPORT_SYMBOL(clk_disable);
TEE_EXPORT_SYMBOL(clk_register);
TEE_EXPORT_SYMBOL(clk_prepare);
TEE_EXPORT_SYMBOL(clk_unprepare);
TEE_EXPORT_SYMBOL(clk_get_rate);

extern TEE_Result imx_i2c_probe(uint8_t bid, uint8_t chip);

TEE_EXPORT_SYMBOL(imx_i2c_probe);

/* delay ops */
struct arm_delay_ops {
	void (*delay)(unsigned long);
	void (*const_udelay)(unsigned long);
	void (*udelay)(unsigned long);
	unsigned long ticks_per_jiffy;
} arm_delay_ops;

void msleep(unsigned long msec) {
	TEE_Result res;

	uint32_t current_driver_id = ldr_sw_get_cur_driver_id();

	if (current_driver_id == 0) {
		EMSG("ERROR: NULL current driver id.");
	}
	struct thread_param params[3];

	params[0].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[1].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[2].attr = THREAD_PARAM_ATTR_VALUE_INOUT;

	params[0].u.value.a = current_driver_id;
	params[0].u.value.b = NW_MSLEEP;
	params[0].u.value.c = 0;

	params[1].u.value.a = 0x00;
	params[1].u.value.b = msec;
	params[1].u.value.c = 0;

	params[2].u.value.a = 0;
	params[2].u.value.b = 0;

	res = thread_rpc_cmd(OPTEE_RPC_CMD_LDR_LINUX_BKWD_RPC, 3, &params);
	if (res != TEE_SUCCESS) {
		EMSG("ERROR: ldr msleep() linux rpc fails.");
	}
}

int64_t ktime_get(void) {
	TEE_Result res;

	uint32_t current_driver_id = ldr_sw_get_cur_driver_id();

	if (current_driver_id == 0) {
		EMSG("ERROR: NULL current driver id.");
	}
	struct thread_param params[3];

	params[0].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[1].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[2].attr = THREAD_PARAM_ATTR_VALUE_INOUT;

	params[0].u.value.a = current_driver_id;
	params[0].u.value.b = NW_KTIME_GET;
	params[0].u.value.c = 1;

	params[1].u.value.a = 0x00;
	params[1].u.value.b = 0;
	params[1].u.value.c = 0;

	params[2].u.value.a = 0;
	params[2].u.value.b = 0;

	res = thread_rpc_cmd(OPTEE_RPC_CMD_LDR_LINUX_BKWD_RPC, 3, &params);
	if (res != TEE_SUCCESS) {
		EMSG("ERROR: ldr msleep() linux rpc fails.");
	}

	res = params[2].u.value.c;

	return res;
}

int64_t ktime_get_real_seconds(void) {
	TEE_Result res;

	uint32_t current_driver_id = ldr_sw_get_cur_driver_id();

	if (current_driver_id == 0) {
		EMSG("ERROR: NULL current driver id.");
	}
	struct thread_param params[3];

	params[0].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[1].attr = THREAD_PARAM_ATTR_VALUE_INOUT;
	params[2].attr = THREAD_PARAM_ATTR_VALUE_INOUT;

	params[0].u.value.a = current_driver_id;
	params[0].u.value.b = NW_KTIME_GET_REAL_SECONDS;
	params[0].u.value.c = 1;

	params[1].u.value.a = 0x00;
	params[1].u.value.b = 0;
	params[1].u.value.c = 0;

	params[2].u.value.a = 0;
	params[2].u.value.b = 0;

	res = thread_rpc_cmd(OPTEE_RPC_CMD_LDR_LINUX_BKWD_RPC, 3, &params);
	if (res != TEE_SUCCESS) {
		EMSG("ERROR: ldr msleep() linux rpc fails.");
	}

	res = params[2].u.value.c;

	return res;
}

TEE_EXPORT_SYMBOL(arm_delay_ops);
TEE_EXPORT_SYMBOL(msleep);
TEE_EXPORT_SYMBOL(ktime_get);
TEE_EXPORT_SYMBOL(ktime_get_real_seconds);

void arm_heavy_mb(void) {
	dsb_ishst();
	dmb();
}
TEE_EXPORT_SYMBOL(arm_heavy_mb);

static TEE_Result 
load_module(uint32_t type, TEE_Param p[TEE_NUM_PARAMS]) {
	if (TEE_PARAM_TYPES(TEE_PARAM_TYPE_VALUE_INOUT,
			    TEE_PARAM_TYPE_MEMREF_INOUT,
			    TEE_PARAM_TYPE_NONE,
			    TEE_PARAM_TYPE_NONE) != type) {
		return TEE_ERROR_BAD_PARAMETERS;
	}

	#ifdef LDR_DEBUG_SYMBOL_SUBSYSTEM
	struct core_symbol_node *csym_node;
	extern struct sym_queue core_sym_queue;
	TAILQ_FOREACH(csym_node, &core_sym_queue, link) {
		if (strcmp(csym_node->sym.name, "printk") == 0) {
			printk_ptr = csym_node->sym.value;
		}
	}
	#endif

	int a; // unused for now
	int module_size;
	unsigned char *module_elf;
	long buf_size;

	/**
	 * TEE_Param[0].value.a		unused
	 * TEE_Param[0].value.b 	actual module .ko size
	 * 
	 * TEE_Param[1].memref.buffer	module buffer
	 * TEE_Param[1].memref.size   	module buffer size
	*/
	a = p[0].value.a;
	module_size = p[0].value.b;

	module_elf = p[1].memref.buffer;
	buf_size = p[1].memref.size;

	// simple sanitizing checking
	if (module_size > buf_size) {
		EMSG("ERROR: Invalid buffer size.");
		return TEE_ERROR_BAD_PARAMETERS;
	}

	#ifdef LDR_DEBUG_NW_MODULE_READ
	dhex_dump(NULL, 0, 0, (void *)module_elf, 0x10);
	#endif

	ldr_init_module(module_elf, module_size);

	return TEE_SUCCESS;
}

static TEE_Result 
ldr_invoke_driver_function(uint32_t type, TEE_Param p[TEE_NUM_PARAMS]) {
	// if (TEE_PARAM_TYPES(TEE_PARAM_TYPE_VALUE_INPUT,
	// 		    TEE_PARAM_TYPE_MEMREF_INPUT,
	// 		    TEE_PARAM_TYPE_NONE,
	// 		    TEE_PARAM_TYPE_NONE) != type) {
	// 	return TEE_ERROR_BAD_PARAMETERS;
	// }

	uint32_t res;
	uint32_t driver_id;
	uint32_t function_id;
	unsigned char *params;
	uint32_t param_buf_size;
	dispatch disp = NULL;
	struct ldr_driver_info *drv_info;

	driver_id = p[0].value.a;
	function_id = p[0].value.b;
	params = p[1].memref.buffer;
	param_buf_size = p[1].memref.size;

	// DMSG("runnning driver %d dispatcher ...", driver_id);

	drv_info = ldr_get_driver_info(driver_id);
	if (drv_info == NULL) {
		EMSG("ERROR: no driver info for driver %d.", driver_id);
		return TEE_ERROR_BAD_PARAMETERS;
	}

	disp = drv_info->disp;

	/* indicate which driver is invoking sw driver */
	ldr_sw_set_cur_driver_id(driver_id);

	/* CAUTION: we MUST clean cache before brute jump */
	icache_inv_all();
	dcache_op_all(DCACHE_OP_CLEAN_INV);

	/* entering LDR */
	res = invoke_drv_dispatch(disp, function_id, params, drv_info->ied_num);
	// res = (*disp)(function_id, params);

	return res;
}

static TEE_Result 
ldr_sw_driver_probe(uint32_t type, TEE_Param p[TEE_NUM_PARAMS]) {
	TEE_Result res;
	uint32_t driver_id;
	uint32_t function_id;
	unsigned char *state_var;
	uint32_t state_var_size;
	uint32_t nw_sv_pa;
	uint32_t nw_sv_tee_va;
	dispatch disp = NULL;
	uint32_t shm_pa;
	uint32_t shm_size;

	struct ldr_driver_info *ldr_driver_info;
	struct state_var *sv; 

	if (TEE_PARAM_TYPE_GET(type, 0) == TEE_PARAM_TYPE_VALUE_INPUT) {
		/* driver ID, function ID */
		driver_id = p[0].value.a;
		function_id = p[0].value.b;
	} else {
		return TEE_ERROR_BAD_PARAMETERS;
	}

	if (TEE_PARAM_TYPE_GET(type, 1) == TEE_PARAM_TYPE_MEMREF_INPUT) {
		/* state variable info */
		state_var = p[1].memref.buffer;
		state_var_size = p[1].memref.size;
	} else {
		return TEE_ERROR_BAD_PARAMETERS;
	}

	if (TEE_PARAM_TYPE_GET(type, 2) == TEE_PARAM_TYPE_VALUE_INPUT) {
		/* shared memory info */
		shm_pa = p[2].value.a;
		shm_size = p[2].value.b;

		/* shared memory is generic for all ldr drivers */
		res = ldr_register_shm(driver_id, shm_pa, shm_size);
		if (res != TEE_SUCCESS) {
			EMSG("ERROR: when registering shm for driver %d", driver_id);
		}
	}

	if (TEE_PARAM_TYPE_GET(type, 3) == TEE_PARAM_TYPE_VALUE_INPUT) {
		/* normal world state variable info */
		nw_sv_pa = p[3].value.a;
	} else {
		return TEE_ERROR_BAD_PARAMETERS;
	}

	// DMSG("runnning driver %d sw_probe() ...", driver_id);
	ldr_driver_info = ldr_get_driver_info(driver_id);
	if (ldr_driver_info == NULL) {
		EMSG("ERROR: no driver info for driver %d.", driver_id);
		return TEE_ERROR_BAD_PARAMETERS;
	}

	disp = ldr_driver_info->disp;

	/* indicate which driver is invoking sw driver */
	ldr_sw_set_cur_driver_id(driver_id);

	/* CAUTION: we MUST clean cache before brute jump */
	icache_inv_all();
	dcache_op_all(DCACHE_OP_CLEAN_INV);

	/* state var is driver specific */
	/* state var copy needs protection */
	res = invoke_drv_dispatch(disp, function_id, state_var, 
				  ldr_driver_info->ied_num);
	// res = (*disp)(function_id, state_var);
	if (res) {
		EMSG("driver %d sw_probe() fails with err code 0x%08x",
			driver_id, res);
	}

	/* build secure element bitmap */
	sv = ldr_alloc_sv(ldr_driver_info, state_var_size,
			get_current_se_sec_array(),
			get_current_se_sec_array_size());
	if (sv == NULL) {
		EMSG("ERROR: driver %d se bitmap allocation fails.", driver_id);
		return TEE_ERROR_BAD_STATE;
	}
	ldr_driver_info->state_var = sv;

	/* map normal driver state variable into secure world */
	if (!core_mmu_add_mapping(MEM_AREA_RAM_NSEC, nw_sv_pa, state_var_size)) {
		EMSG("ERROR: nw_sv mapping failed for driver %d.", driver_id);
	}

	nw_sv_tee_va = phys_to_virt(nw_sv_pa, MEM_AREA_RAM_NSEC);
	if (nw_sv_tee_va == NULL) {
		EMSG("ERROR: nw_sv NULL va for driver %d.", driver_id);
	}

	ldr_driver_info->state_var->nw_sv = nw_sv_tee_va;
	set_ldr_dac_desc(nw_sv_tee_va, nw_sv_tee_va + state_var_size,
			 get_cur_ied_num());

	/* initially synchronize normal world state var */
	res = sv_init_sync(ldr_driver_info);

	#ifdef LDR_STATE_VAR_DEBUG
	DMSG("driver %d se bitmap allocation success.", driver_id);
	DMSG("bitmap addr: 0x%08x, size: 0x%08x", sv->bitmap, sv->size);
	dhex_dump(NULL, 0, 0, sv->bitmap, sv->size);

	DMSG("Dumping initialized secure world state variable ...");
	dhex_dump(NULL, 0, 0, sv->drv_sv, sv->size);
	DMSG("Dumping mapped normal world state variable ...");
	dhex_dump(NULL, 0, 0, sv->nw_sv, sv->size);
	#endif

	return res;
}

/*
 * Trusted Application Entry Points
 */
static TEE_Result invoke_command(void *psess __unused,
				 uint32_t cmd, uint32_t ptypes,
				 TEE_Param params[TEE_NUM_PARAMS]) {
	switch (cmd) {
	case LDR_CMD_LOAD_MODULE:
		return load_module(ptypes, params);
		break;
	
	case LDR_CMD_SW_DRIVER_PROBE:
		return ldr_sw_driver_probe(ptypes, params);
		break;

	case LDR_CMD_INVOKE_FUNCTION:
		return ldr_invoke_driver_function(ptypes, params);
		break;

	case LDR_CMD_CDEV_OPEN:
		return cdev_open(ptypes, params);
		break;

	case LDR_CMD_CDEV_RELEASE:
		return cdev_release(ptypes, params);
		break;

	case LDR_CMD_CDEV_READ:
		return cdev_read(ptypes, params);
		break;

	case LDR_CMD_CDEV_WRITE:
		return cdev_write(ptypes, params);
		break;

	default:
		break;
	}

	return TEE_ERROR_BAD_PARAMETERS;
}

pseudo_ta_register(.uuid = LDR_UUID, .name = TA_NAME,
		   .flags = PTA_DEFAULT_FLAGS,
		   .invoke_command_entry_point = invoke_command);