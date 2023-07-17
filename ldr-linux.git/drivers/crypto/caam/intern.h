/* SPDX-License-Identifier: GPL-2.0 */
/*
 * CAAM/SEC 4.x driver backend
 * Private/internal definitions between modules
 *
 * Copyright 2008-2016 Freescale Semiconductor, Inc.
 * Copyright 2017-2019 NXP
 *
 */

#ifndef INTERN_H
#define INTERN_H
#include "regs.h"

/* Currently comes from Kconfig param as a ^2 (driver-required) */
#define JOBR_DEPTH (1 << CONFIG_CRYPTO_DEV_FSL_CAAM_RINGSIZE)

/* Job ring count */
#define JOBR_MAX_COUNT 4

/* Kconfig params for interrupt coalescing if selected (else zero) */
#ifdef CONFIG_CRYPTO_DEV_FSL_CAAM_INTC
#define JOBR_INTC JRCFG_ICEN
#define JOBR_INTC_TIME_THLD CONFIG_CRYPTO_DEV_FSL_CAAM_INTC_TIME_THLD
#define JOBR_INTC_COUNT_THLD CONFIG_CRYPTO_DEV_FSL_CAAM_INTC_COUNT_THLD
#else
#define JOBR_INTC 0
#define JOBR_INTC_TIME_THLD 0
#define JOBR_INTC_COUNT_THLD 0
#endif

/*
 * Storage for tracking each in-process entry moving across a ring
 * Each entry on an output ring needs one of these
 */
struct caam_jrentry_info {
	void (*callbk)(struct device *dev, u32 *desc, u32 status, void *arg);
	void *cbkarg;	/* Argument per ring entry */
	u32 *desc_addr_virt;	/* Stored virt addr for postprocessing */
	caam_dma_addr_t desc_addr_dma;	/* Stored bus addr for done matching */
	u32 desc_size;	/* Stored size for postprocessing, header derived */
};

#ifdef CONFIG_PM_SLEEP
struct caam_jr_state {
	dma_addr_t inpbusaddr;
	dma_addr_t outbusaddr;
};
#endif

struct caam_jr_dequeue_params {
	struct device *dev;
	int enable_itr;
};

/* Private sub-storage for a single JobR */
struct caam_drv_private_jr {
	struct list_head	list_node;	/* Job Ring device list */
	struct device		*dev;
	int ridx;
	struct caam_job_ring __iomem *rregs;	/* JobR's register space */
	struct tasklet_struct irqtask;
	struct caam_jr_dequeue_params tasklet_params;
	int irq;			/* One per queue */

	/* Number of scatterlist crypt transforms active on the JobR */
	atomic_t tfm_count ____cacheline_aligned;

	/* Job ring info */
	int ringsize;	/* Size of rings (assume input = output) */
	struct caam_jrentry_info *entinfo;	/* Alloc'ed 1 per ring entry */
	spinlock_t inplock ____cacheline_aligned; /* Input ring index lock */
	int inp_ring_write_index;	/* Input index "tail" */
	int head;			/* entinfo (s/w ring) head index */
	caam_dma_addr_t *inpring;	/* Base of input ring, alloc DMA-safe */
	spinlock_t outlock ____cacheline_aligned; /* Output ring index lock */
	int out_ring_read_index;	/* Output index "tail" */
	int tail;			/* entinfo (s/w ring) tail index */
	struct jr_outentry *outring;	/* Base of output ring, DMA-safe */

#ifdef CONFIG_PM_SLEEP
	struct caam_jr_state state;   /* State of the JR during PM */
#endif
};

#ifdef CONFIG_PM_SLEEP
struct caam_ctl_state {
	u32 scfgr;
	struct masterid deco_mid[1];
	struct masterid jr_mid[4];
};
#endif

/*
 * Driver-private storage for a single CAAM block instance
 */
struct caam_drv_private {
#ifdef CONFIG_CAAM_QI
	struct device *qidev;
#endif
	struct device *dev;
	struct platform_device *pdev;
	struct device *smdev;

	/*
	 * ERA of the CAAM block,
	 * -ENOTSUPP if no era version was supplied or detected.
	 */
#define IMX_ERR005766_ERA 4	/* ERA affected by i.mx AXI errata */
	int era;

	/* Physical-presence section */
	struct caam_ctrl __iomem *ctrl; /* controller region */
	struct caam_deco __iomem *deco; /* DECO/CCB views */
	struct caam_assurance __iomem *assure;
	struct caam_queue_if __iomem *qi; /* QI control region */
	struct caam_job_ring __iomem *jr[JOBR_MAX_COUNT]; /* JRs registers */
	dma_addr_t __iomem *sm_base;	/* Secure memory storage base */
	phys_addr_t sm_phy;		/* Secure memory storage physical */
	u32 sm_size;

	/*
	 * Detected geometry block. Filled in from device tree if powerpc,
	 * or from register-based version detection code
	 */
	u8 total_jobrs;		/* Total Job Rings in device */
	u8 qi_present;		/* Nonzero if QI present in device */
	int virt_en;		/* Virtualization enabled in CAAM */

#define	RNG4_MAX_HANDLES 2
	/* RNG4 block */
	u32 rng4_sh_init;	/* This bitmap shows which of the State
				   Handles of the RNG4 block are initialized
				   by this driver */

	struct clk *caam_ipg;
	struct clk *caam_mem;
	struct clk *caam_aclk;
	struct clk *caam_emi_slow;

	bool has_seco;
	/*
	 * debugfs entries for developer view into driver/device
	 * variables at runtime.
	 */
#ifdef CONFIG_DEBUG_FS
	struct dentry *dfs_root;
	struct dentry *ctl; /* controller dir */
	struct debugfs_blob_wrapper ctl_kek_wrap, ctl_tkek_wrap, ctl_tdsk_wrap;
	struct dentry *ctl_kek, *ctl_tkek, *ctl_tdsk;
#endif

	int    has_optee;
	int    has_access_p0; /* If driver has acces to page 0 of the CAAM */

#ifdef CONFIG_PM_SLEEP
	int    caam_off_during_pm; /* If the CAAM is reset after suspend */
	struct caam_ctl_state state;   /* State of the CTL during PM */
#endif
};

void caam_jr_algapi_init(struct device *dev);
void caam_jr_algapi_remove(struct device *dev);

#ifdef CONFIG_DEBUG_FS
static int caam_debugfs_u64_get(void *data, u64 *val)
{
	*val = caam64_to_cpu(*(u64 *)data);
	return 0;
}

static int caam_debugfs_u32_get(void *data, u64 *val)
{
	*val = caam32_to_cpu(*(u32 *)data);
	return 0;
}

DEFINE_SIMPLE_ATTRIBUTE(caam_fops_u32_ro, caam_debugfs_u32_get, NULL, "%llu\n");
DEFINE_SIMPLE_ATTRIBUTE(caam_fops_u64_ro, caam_debugfs_u64_get, NULL, "%llu\n");
#endif

#endif /* INTERN_H */
