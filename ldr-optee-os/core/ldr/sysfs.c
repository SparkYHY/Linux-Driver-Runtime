/* SPDX-License-Identifier: BSD-2-Clause */
/**
 * Provide Linux Sysfs attribute show/store operations.
 * 
 * 
*/

#include <arm.h>
#include <assert.h>
#include <compiler.h>
#include <config.h>
#include <console.h>
#include <initcall.h>
#include <inttypes.h>
#include <keep.h>
#include <kernel/boot.h>
#include <kernel/export.h>
#include <kernel/interrupt.h>
#include <kernel/linker.h>
#include <kernel/misc.h>
#include <kernel/panic.h>
#include <kernel/thread.h>
#include <libfdt.h>
#include <malloc.h>
#include <mm/core_memprot.h>
#include <mm/core_mmu.h>
#include <mm/tee_mm.h>
#include <mm/tee_mmu.h>
#include <mm/tee_pager.h>
#include <stdio.h>
#include <sys/queue.h>
#include <trace.h>
#include <utee_defines.h>
#include <optee_rpc_cmd.h>
// #include "dtc_util.h"
#include <kernel/cache_helpers.h>

#include "module.h"

#include <ldr/ldr.h>		/* LDR */

typedef enum itr_return (*itr_handler_t)(struct itr_handler *h);

typedef ssize_t (*attr_show)(void *dev, void *attr, const char *buf);
typedef ssize_t (*attr_store)(void *dev, void *attr,
			      const char *buf, size_t count);

uint32_t attr_show_str(const char *func_name, char *buf) {
	vaddr_t addr;

	addr = find_sym_addr(func_name);

	if (addr != 0) {
		return attr_show_addr(addr, buf);
	}

	EMSG("ERROR: function %s not found.", func_name);

	return TEE_ERROR_GENERIC;
}

uint32_t attr_store_str(const char *func_name, char *buf, size_t count) {
	vaddr_t addr;

	addr = find_sym_addr(func_name);

	if (addr != 0) {
		return attr_store_addr(addr, buf, count);
	}

	EMSG("ERROR: function %s not found.", func_name);

	return TEE_ERROR_GENERIC;
}

uint32_t attr_show_addr(vaddr_t addr, char *buf) {
	if (addr == 0) {
		EMSG("ERROR: NULL export function address.");
		return TEE_ERROR_GENERIC;
	}

	attr_show attr_show = addr;

	icache_inv_all();
	dcache_op_all(DCACHE_OP_CLEAN_INV);

	return (*attr_show)(NULL, NULL, buf);
}

uint32_t attr_store_addr(vaddr_t addr, char *buf, size_t count) {
	if (addr == 0) {
		EMSG("ERROR: NULL export function address.");
		return TEE_ERROR_GENERIC;
	}

	attr_store attr_store = addr;

	icache_inv_all();
	dcache_op_all(DCACHE_OP_CLEAN_INV);

	return (*attr_store)(NULL, NULL, buf, count);
}

TEE_EXPORT_SYMBOL(attr_show_str);
TEE_EXPORT_SYMBOL(attr_store_str);
TEE_EXPORT_SYMBOL(attr_show_addr);
TEE_EXPORT_SYMBOL(attr_store_addr);