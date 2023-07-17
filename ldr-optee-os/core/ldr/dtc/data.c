/* SPDX-License-Identifier: GPL-2.0-or-later */
/**
 * (C) Copyright David Gibson <dwg@au1.ibm.com>, IBM Corporation.  2005.
 * 
*/

#include <kernel/panic.h>
#include <trace.h>

#include "dtc.h"
#include "dtc_util.h"

struct data *data_grow_for(struct data *d, unsigned int xlen)
{
	unsigned int newsize;

	if (d == NULL) {
		EMSG("NULL data, aborting ...");
		panic();
	}

	if (xlen == 0)
		return d;

	newsize = xlen;

	while ((d->len + xlen) > newsize)
		newsize *= 2;

	/**
	 * For LDR, this function is only used for d->val initial allocation,
	 * thus no need to support d->val resizing as the original does.
	*/
	d->val = xmalloc(newsize);

	return d;
}