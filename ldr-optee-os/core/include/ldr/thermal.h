/* SPDX-License-Identifier: BSD-2-Clause */
/**
 * Provide Linux thermal framework support for thermal drivers.
 * 
 * 
*/

#ifndef LDR_THERMAL_H
#define LDR_THERMAL_H

#include <inttypes.h>
#include <trace.h>
#include <utee_defines.h>
#include <kernel/thread.h>

struct thermal_zone_device {
	uint32_t id;
	unsigned char pad[444];
	void *devdata;
};

#endif /* LDR_THERMAL_H */