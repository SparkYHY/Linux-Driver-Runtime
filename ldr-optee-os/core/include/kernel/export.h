/**
 * This header file is written based on the Linux
 * 
 * /include/linux/export.h
 * 
 * to introduce symbol export function into OPTEE.
 * 
 * 
*/
#ifndef __LDR_EXPORT_H_
#define __LDR_EXPORT_H_

#include <sys/queue.h>

struct core_symbol {
	unsigned long value;
	const char *name;
	uint32_t id;
};

struct core_symbol_node {
	struct core_symbol sym;
	TAILQ_ENTRY(core_symbol_node) link;
};

TAILQ_HEAD(sym_queue, core_symbol_node);

#define __TEE_SYMBOL_STR(x) #x

#define TEE_SYMBOL_STR(x) __TEE_SYMBOL_STR(x)

#define __TEE_EXPORT_SYMBOL(sym, sec)                           \
    extern typeof(sym) sym;                                     \
    static const char __cstrtab_##sym[]                         \
    __attribute__((section(".csymtab_strings"), aligned(1)))    \
    = TEE_SYMBOL_STR(sym);                                      \
    static const struct core_symbol __csymtab_##sym             \
    __attribute__((__used__))                                   \
    __attribute__((section(".csymtab" sec), used))              \
    = { (unsigned int)&sym, __cstrtab_##sym, 0 }

#define TEE_EXPORT_SYMBOL(sym)   \
    __TEE_EXPORT_SYMBOL(sym, "")

#endif /* __LDR_EXPORT_H_ */