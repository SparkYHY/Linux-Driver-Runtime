
#ifndef LDR_DAC_H
#define LDR_DAC_H

#ifndef __ASSEMBLER__

#include <compiler.h>
#include <types_ext.h>

struct ldr_dac_ctx {
	uint32_t r0;
	uint32_t r1;
	uint32_t r2;
	uint32_t r3;
	uint32_t r4;
	uint32_t r5;
	uint32_t r6;
	uint32_t r7;
	uint32_t ldr_stack;
	uint32_t svc_sp;
	uint32_t svc_lr;
	uint32_t ldr_fiq_stack;
};

void set_ldr_dac_desc(uint32_t start_va, uint32_t end_va, uint32_t domain_num);
TEE_Result init_ldr_domain(void);
TEE_Result set_ldr_stacks(int ied_num);
void show_va_desc(vaddr_t va);
void show_dacr(void);

struct ldr_dac_ctx *get_ldr_dac_ctx(void);
void print_ldr_dac_ctx(void);

extern int current_ied_num;
void set_cur_ied_num(int num)  __attribute__((section(".ldr_gate.txt")));
int get_cur_ied_num(void) __attribute__((section(".ldr_gate.txt")));

uint32_t get_ied_num(void);
void put_ied_num(uint32_t ied_num);

void ldr_write_dac(uint32_t val);

/**
 * These two functions are used when entering a certain SW driver through
 *   1. init()
 *   2. probe()
 * The key feature is that there is stack switch related to each function.
 * For ldr_enter_drv(), the stack gets switched from the normal SVC stack to
 * the LDR domain stack, while for ldr_exit_drv(), the stack gets switched 
 * from the LDR domain stack to the normal SVC stack.
*/
void ldr_enter_drv(void);
void ldr_exit_drv(void);

void ldr_enter_drv_irq_handler(void);
void ldr_exit_drv_irq_handler(void);

void ldr_dac_tee_close(void) __attribute__((section(".ldr_gate.txt")));
void ldr_dac_tee_open(void) __attribute__((section(".ldr_gate.txt")));

#endif /* __ASSEMBLER__ */

#endif /* LDR_DAC_H */