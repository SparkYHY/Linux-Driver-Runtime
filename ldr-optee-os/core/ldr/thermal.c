/* SPDX-License-Identifier: BSD-2-Clause */
/**
 * Provide Linux thermal framework support for thermal drivers.
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
#include "module.h"

#include <ldr/ldr.h>		/* LDR */
#include <ldr/thermal.h>	/* LDR */

/* tail queue to hold all thermal info */
struct thermal_zone_device_node {
	struct thermal_zone_device tz;
	TAILQ_ENTRY(thermal_zone_device_node) link;
};

TAILQ_HEAD(thermal_zone_device_queue, thermal_zone_device_node);

struct thermal_zone_device_queue thermal_zone_device_queue = 
	TAILQ_HEAD_INITIALIZER(thermal_zone_device_queue);

int register_thermal_device(int driver_id, void *devdata) {
	struct thermal_zone_device_node *thermal_zone_device_node = NULL;

	thermal_zone_device_node = 
			calloc(1, sizeof(*thermal_zone_device_node));
	if (thermal_zone_device_node == NULL) {
		EMSG("ERROR: thermal_zone_device_node allocation fails.");
		return TEE_ERROR_OUT_OF_MEMORY;
	}

	thermal_zone_device_node->tz.id = driver_id;
	thermal_zone_device_node->tz.devdata = devdata;

	TAILQ_INSERT_TAIL(&thermal_zone_device_queue, thermal_zone_device_node, link);

	IMSG("thermal %d registered successfully.\n", 
		thermal_zone_device_node->tz.id);

	return 0;
}
TEE_EXPORT_SYMBOL(register_thermal_device);

struct thermal_zone_device *find_thermal(int driver_id) {
	struct thermal_zone_device_node *thermal_zone_device_node;

	if(TAILQ_EMPTY(&thermal_zone_device_queue)) {
		EMSG("ERROR: thermal_zone_device_queue is empty.");
		return NULL;
	}

	TAILQ_FOREACH(thermal_zone_device_node, &thermal_zone_device_queue, link) {
		if (thermal_zone_device_node->tz.id == driver_id) {
			return &(thermal_zone_device_node->tz);
		}
	}

	EMSG("ERROR: invalid driver id %d.", driver_id);
	return NULL;
}
TEE_EXPORT_SYMBOL(find_thermal);