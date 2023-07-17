#include <linux/delay.h>
#include <linux/device.h>
#include <linux/mm.h>
#include <linux/list.h>
#include <linux/slab.h>
#include <linux/teek.h>
#include <linux/tee_drv.h>
#include <linux/clk.h>
#include <linux/clk-provider.h>
#include <linux/spinlock.h>
#include <linux/types.h>
#include <asm/cacheflush.h>
#include "optee_private.h"
#include "optee_smc.h"
#include "optee_msg.h"

#include <linux/ldr.h>

LIST_HEAD(ldr_nw_driver_info_list_head);

spinlock_t ldr_spin_lock;

struct ldr_nw_driver_info *global_cur_driver_info;

static struct ldr_nw_driver_info *
get_ldr_driver_info(unsigned int driver_id) {
	struct list_head *cur_node;
	struct ldr_nw_driver_info *cur_driver_info;

	if (list_empty(&ldr_nw_driver_info_list_head))
		return NULL;

	list_for_each(cur_node, &ldr_nw_driver_info_list_head) {
		cur_driver_info = 
			list_entry(cur_node, struct ldr_nw_driver_info, list);

		if (driver_id == cur_driver_info->driver_id) {
			pr_debug("LDR: driver %d found.\n", 
				cur_driver_info->driver_id);
			return cur_driver_info;
		}
	}

	if (global_cur_driver_info) {
		return global_cur_driver_info;
	}

	pr_err("ERROR: invalid ldr driver id %d.\n", driver_id);

	return NULL;
}

int ldr_nw_driver_register(unsigned int driver_id,
			   void *sv, size_t sv_size) {
	struct ldr_nw_driver_info *driver_info;
	int res = 0;
	unsigned int lock_flags;

	pr_debug("inside %s().\n", __func__);

	spin_lock_irqsave(&ldr_spin_lock, lock_flags);

	driver_info = get_ldr_driver_info(driver_id);
	if (driver_info != NULL) {
		pr_debug("driver %d is already registered.\n");
		res = 1;
	} else {
		driver_info = kmalloc(sizeof(*driver_info), GFP_KERNEL);

		driver_info->driver_id = driver_id;
		driver_info->sv_data = sv;
		driver_info->sv_size = sv_size;

		list_add(&(driver_info->list), &ldr_nw_driver_info_list_head);
		pr_debug("LDR: driver %d registered.\n", driver_id);
	}

	global_cur_driver_info = driver_info;

	spin_unlock_irqrestore(&ldr_spin_lock, lock_flags);

	return res;
}
EXPORT_SYMBOL(ldr_nw_driver_register);

void ldr_nw_driver_unregister(unsigned int driver_id) {
	struct ldr_nw_driver_info *driver_info;
	unsigned int lock_flags;

	pr_debug("inside %s().\n", __func__);

	spin_lock_irqsave(&ldr_spin_lock, lock_flags);

	driver_info = get_ldr_driver_info(driver_id);

	if (driver_info != NULL) {
		list_del(&driver_info->list);
		kfree(driver_info);
	}

	spin_unlock_irqrestore(&ldr_spin_lock, lock_flags);
}
EXPORT_SYMBOL(ldr_nw_driver_unregister);

void *ldr_nw_get_driver_sv(unsigned int driver_id) {
	struct ldr_nw_driver_info *driver_info;
	void *sv_data = NULL;
	unsigned int lock_flags;

	pr_debug("inside %s().\n", __func__);

	spin_lock_irqsave(&ldr_spin_lock, lock_flags);

	driver_info = get_ldr_driver_info(driver_id);

	if (driver_info != NULL) {
		sv_data = driver_info->sv_data;
	}

	spin_unlock_irqrestore(&ldr_spin_lock, lock_flags);

	return sv_data;
}

int ldr_nw_driver_register_shm(unsigned int driver_id,
			       unsigned int shm_va,
			       unsigned int shm_pa,
			       unsigned int shm_size) {
	/* driver should already been registered */
	struct ldr_nw_driver_info *driver_info;
	int res = 0;
	unsigned int lock_flags;

	pr_debug("inside %s().\n", __func__);

	spin_lock_irqsave(&ldr_spin_lock, lock_flags);

	driver_info = get_ldr_driver_info(driver_id);

	if (driver_info != NULL) {
		driver_info->shm_info.shm_va = shm_va;
		driver_info->shm_info.shm_pa = shm_pa;
		driver_info->shm_info.shm_size = shm_size;
	} else {
		res = -1;
	}

	spin_unlock_irqrestore(&ldr_spin_lock, lock_flags);

	return res;
}
EXPORT_SYMBOL(ldr_nw_driver_register_shm);

void *ldr_nw_get_driver_shm(unsigned int driver_id) {
	struct ldr_nw_driver_info *driver_info;
	unsigned int shm_va = 0;
	unsigned int lock_flags;

	pr_debug("inside %s().\n", __func__);

	spin_lock_irqsave(&ldr_spin_lock, lock_flags);

	driver_info = get_ldr_driver_info(driver_id);

	if (driver_info != NULL) {
		shm_va = driver_info->shm_info.shm_va;
	}

	spin_unlock_irqrestore(&ldr_spin_lock, lock_flags);

	return shm_va;
}
EXPORT_SYMBOL(ldr_nw_get_driver_shm);

unsigned long vaddr2paddr(unsigned long vaddr)
{
	pgd_t *pgd;
	pud_t *pud;
	pmd_t *pmd;
	pte_t *pte;
	unsigned long paddr = 0;
	unsigned long page_addr = 0;
	unsigned long page_offset = 0;

	pgd = pgd_offset(current->mm, vaddr);
	if (pgd_none(*pgd)) {
		printk("not mapped in pgd\n");
		return -1;
	}

	pud = pud_offset(pgd, vaddr);
	if (pud_none(*pud)) {
		printk("not mapped in pud\n");
		return -1;
	}

	pmd = pmd_offset(pud, vaddr);
	if (pmd_none(*pmd)) {
		printk("not mapped in pmd\n");
		return -1;
	}

	pte = pte_offset_kernel(pmd, vaddr);
	if (pte_none(*pte)) {
		printk("not mapped in pte\n");
		return -1;
	}

	/* Page frame physical address mechanism | offset */
	page_addr = pte_val(*pte) & PAGE_MASK;
	page_offset = vaddr & ~PAGE_MASK;
	paddr = page_addr | page_offset;

	return paddr;
}
EXPORT_SYMBOL(vaddr2paddr);