#ifndef _LINUX_LDR_H_
#define _LINUX_LDR_H_

#include <linux/bitops.h>
#include <linux/types.h>
#include <linux/list.h>

struct ldr_driver_shm_info {
	unsigned int shm_pa;
	unsigned int shm_va;
	unsigned int shm_size;
};

struct ldr_nw_driver_info {
	unsigned int driver_id;
	void *sv_data;
	size_t sv_size;
	struct ldr_driver_shm_info shm_info;
	struct list_head list;
};

int ldr_rpc(struct optee_msg_arg *arg);

/* LDR NW driver registration routines */
int ldr_nw_driver_register(unsigned int driver_id,
			   void *sv, size_t sv_size);
void ldr_nw_driver_unregister(unsigned int driver_id);
int ldr_nw_driver_register_shm(unsigned int driver_id,
			       unsigned int shm_va,
			       unsigned int shm_pa,
			       unsigned int shm_size);

/* LDR NW driver info retrival API */
void *ldr_nw_get_driver_sv(unsigned int driver_id);
void *ldr_nw_get_driver_shm(unsigned int driver_id);


/* Utilities */
unsigned long vaddr2paddr(unsigned long vaddr);

struct sec_ele {
	unsigned int offset;
	unsigned int size;
};

/* secure element declaration */
#define TOKEN_PASTE(x, y) x##y
#define CAT(x,y) TOKEN_PASTE(x,y)

#define DECLARE_SEC_ELEMENT(s, e)				\
	static const struct sec_ele CAT(_sec_ele, __COUNTER__)	\
	__attribute__((__used__))				\
	__attribute__((section(".sec_ele"), used))		\
	= { (unsigned int)&e - (unsigned int)&s, sizeof(e) }


#endif /* LINUX_LDR_H */