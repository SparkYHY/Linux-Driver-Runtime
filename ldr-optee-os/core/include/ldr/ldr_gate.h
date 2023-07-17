
#ifndef LDR_GATE_H
#define LDR_GATE_H

#ifndef __ASSEMBLER__

#include <compiler.h>
#include <types_ext.h>

// #define LDR_GATE_DEBUG
typedef int (*drv_init)(void);
typedef int (*dispatch)(unsigned int func_id, unsigned char *param_buf);

/**
 * record the each tee function call from a sw driver
*/
struct hook_map_entry {
	uint32_t callsite_va;
	uint32_t callee_va;
};

struct hook_info {
	uint32_t count;
	uint32_t capacity;
	struct hook_map_entry *hook_array;
};

extern struct hook_info *cur_hook_info;

void set_cur_hook_info(struct hook_info *hi);
struct hook_info *get_cur_hook_info(void);

struct ldr_gate_ctx {
	uint32_t r0;
	uint32_t r1;
	uint32_t r2;
	uint32_t r3;
	uint32_t r4;
	uint32_t r5;
	uint32_t r6;
	uint32_t r7;
	uint32_t r8;
	uint32_t r9;
	uint32_t r10;
	uint32_t r11;
	uint32_t r12;
	uint32_t ldr_lr;
	uint32_t ldr_sp;
	uint32_t callee_va;
	uint32_t ret_val;
};

extern struct ldr_gate_ctx ldr_gate_ctx[];
extern uint32_t *tee_text_pt_desc;

struct ldr_gate_ctx *get_ldr_gate_ctx(void);

void init_tee_text_pt_desc(void);
uint32_t *get_tee_text_pt_desc(void);

void set_tee_text_xn(void) __attribute__((section(".ldr_gate.txt")));;
void clear_tee_text_xn(void) __attribute__((section(".ldr_gate.txt")));;

struct hook_info *alloc_hook_info(void);
TEE_Result add_hook_map_entry(struct hook_info *hook_info,
			      uint32_t callsite_va,
			      uint32_t callee_va);
void print_hook_info(struct hook_info *hi);

uint32_t ldr_gate_get_callee(void);

/**
 * This functions is used for intercepting TEE function calls from SW drivers.
*/
void ldr_gate_hook(void);

/**
 * These two functions are used for invoking driver init() and dispatch().
*/
int invoke_drv_init(drv_init init, int ied_num)
    __attribute__((section(".ldr_gate.txt")));
int invoke_drv_dispatch(dispatch disp, 
			uint32_t function_id, 
			unsigned char *params,
			int ied_num)
    __attribute__((section(".ldr_gate.txt")));
int invoke_drv_irq_handler(struct itr_handler *h)
    __attribute__((section(".ldr_gate.txt")));

void print_ldr_gate_ctx(void);
void print_here(void);
void gate_print_reg(int r0);

/* tlb & cache ops */
void ldr_tlbi_all(void)
    __attribute__((section(".ldr_gate.txt")));
void ldr_icache_inv_all(void)
    __attribute__((section(".ldr_gate.txt")));
void ldr_dcache_op_all(unsigned long op_type)
    __attribute__((section(".ldr_gate.txt")));

#endif /* __ASSEMBLER__ */
#endif /* LDR_GATE_H */