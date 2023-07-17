/* SPDX-License-Identifier: BSD-2-Clause */
/*
 * Copyright (c) 2016, Linaro Limited
 * Copyright (c) 2014, STMicroelectronics International N.V.
 */
#ifndef SM_PRIVATE_H
#define SM_PRIVATE_H

#include <ldr/ldr.h>

/* Returns one of SM_EXIT_TO_* exit monitor in secure or non-secure world */
uint32_t sm_from_nsec(struct sm_ctx *ctx);

/* sm ldr fiq callback state */
struct ldr_fiq_callback_state {
	/* int core_id; */
	/* core id is indicated by state array index */
	int is_lfc_on;
	int is_lfc_stdcall_on;
};

/* LFC state manipulation */
int if_lfc_on(void);
void set_lfc_on(void);
void set_lfc_off(void);

int if_lfc_stdcall_on(void);
void set_lfc_stdcall_on(void);
void set_lfc_stdcall_off(void);

/* sm ldr fiq sw return state */
struct lfc_sm_ret {
	uint32_t mon_lr;	/* target linux/optee address */
	uint32_t mon_spsr;	/* prepared NW/SW FIQ cpsr */
};

void set_lfc_sm_ret_nw_spsr(uint32_t nw_fiq_cpsr);
struct lfc_sm_ret *get_lfc_sm_ret_nw(void);

void set_lfc_sm_ret_sw_spsr(uint32_t sw_fiq_cpsr);
struct lfc_sm_ret *get_lfc_sm_ret_sw(void);

void print_sm_ctx(void *ptr);

/* option 2 */
void set_lfc_sm_nsec_ctx(void *ptr);
void set_lfc_sm_sec_ctx(void *ptr);

#endif /*SM_PRIVATE_H*/

