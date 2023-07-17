#ifndef LDR_CALLBACK_H
#define LDR_CALLBACK_H

#ifndef __ASSEMBLER__

#include <compiler.h>
#include <types_ext.h>

#define LDR_FIQ_CALLBACK_BUF_SIZE	256

struct ldr_fiq_regs {
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
	uint32_t sp;
	uint32_t lr;
	uint32_t cpsr;
	uint32_t spsr;
};

#define LDR_FIQ_REGS_SIZE	sizeof(struct ldr_fiq_regs)

struct ldr_fiq_regs *get_ldr_fiq_regs(void);
void print_ldr_fiq_regs(void);
void print_reg(uint32_t reg);

void ldr_fiq_callback_prepare_args(void);
uint32_t ldr_fiq_callback_get_ret_value(void);

void ldr_fiq_callback(void);
void ldr_fiq_callback_ret(void);

#endif /*!__ASSEMBLER__*/

#endif /* LDR_CALLBACK_H */