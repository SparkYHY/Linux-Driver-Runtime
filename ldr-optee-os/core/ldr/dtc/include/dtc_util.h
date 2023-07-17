/* SPDX-License-Identifier: GPL-2.0-or-later */
/**
 * Copyright 2011 The Chromium Authors, All Rights Reserved.
 * Copyright 2008 Jon Loeliger, Freescale Semiconductor, Inc.
 * 
*/

/* This header file has a 'dtc' prefix to distinguish from existing 'util.h' */
#ifndef DTC_UTIL_H
#define DTC_UTIL_H

#include <inttypes.h>
#include <kernel/panic.h>
#include <malloc.h>
#include <trace.h>

#ifdef CFG_LDR_DEBUG
#define LDR_DEBUG_DTC_UTIL	0
#endif

#ifdef LDR_DEBUG_DTC_UTIL
static size_t xmalloc_cnt = 0;
#endif

inline static void __printf(1, 2) __noreturn die(const char *fmt, ...) {
	va_list ap;

	va_start(ap, fmt);
	trace_vprintf(0, 0, TRACE_ERROR, true, fmt, ap);
	va_end(ap);

	panic();
}

inline static void *xmalloc(size_t len) {
	void *new = malloc(len);

	if (!new) {
		#ifdef LDR_DEBUG_DTC_UTIL
		DMSG("before failure, xmalloc() called for %d times", xmalloc_cnt);
		#endif /* LDR_DEBUG_DTC_UTIL */
		EMSG("TEE core malloc() failed (len=%zd)\n", len);
		panic();
	}

	#ifdef LDR_DEBUG_DTC_UTIL
	++xmalloc_cnt;
	#endif /* LDR_DEBUG_DTC_UTIL */

	return new;
}

#endif /* DTC_UTIL_H */