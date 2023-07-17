/* SPDX-License-Identifier: BSD-2-Clause */
/**
 * Provide Linux regmap I/O support.
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
#include <io.h>

int regmap_read(struct regmap *map, unsigned int reg, unsigned int *val) {
	vaddr_t va = (vaddr_t)map;

	*val = io_read32(va + reg);
}
TEE_EXPORT_SYMBOL(regmap_read);

int regmap_write(struct regmap *map, unsigned int reg, unsigned int val) {
	vaddr_t va = (vaddr_t)map;

	io_write32(va + reg, val);

	return 0;
}
TEE_EXPORT_SYMBOL(regmap_write);