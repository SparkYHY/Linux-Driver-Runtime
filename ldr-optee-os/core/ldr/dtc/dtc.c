/* SPDX-License-Identifier: GPL-2.0-or-later */
/**
 * dtc for "Device Tree Compiler", a debug utility to convert DTB content into
 * DTS source and output them on the console.
 * 
 * This utility is meant solely for LDR.
 * 
 * (C) Copyright David Gibson <dwg@au1.ibm.com>, IBM Corporation.  2005.
 * 
*/

#include <ldr/ldr.h>

#include "dtc.h"

void ldr_fdt2dts(vaddr_t fdt_va) {
	struct dt_info *dti;
	struct fdt_header *fdt = (struct fdt_header *)fdt_va;

	dti = dt_from_blob(fdt);

	dt_to_source(dti);
}