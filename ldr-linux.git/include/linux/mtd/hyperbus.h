/* SPDX-License-Identifier: GPL-2.0
 *
 * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
 */

#ifndef __LINUX_MTD_HYPERBUS_H__
#define __LINUX_MTD_HYPERBUS_H__

#include <linux/mtd/map.h>

enum hyperbus_memtype {
	HYPERFLASH,
	HYPERRAM,
};

/**
 * struct hyperbus_device - struct representing HyperBus slave device
 * @map: map_info struct for accessing MMIO HyperBus flash memory
 * @np:	pointer to HyperBus slave device node
 * @mtd: pointer to MTD struct
 * @ctlr: pointer to HyperBus controller struct
 * @memtype: type of memory device: HyperFlash or HyperRAM
 * @registered: flag to indicate whether device is registered with MTD core
 */

struct hyperbus_device {
	struct map_info map;
	struct device_node *np;
	struct mtd_info *mtd;
	struct hyperbus_ctlr *ctlr;
	enum hyperbus_memtype memtype;
	bool registered;
};

/**
 * struct hyperbus_ops - struct representing custom HyperBus operations
 * @read16: read 16 bit of data, usually from register/ID-CFI space
 * @write16: write 16 bit of data, usually to register/ID-CFI space
 * @copy_from: copy data from flash memory
 * @copy_to: copy data to flash memory
 * @calibrate: calibrate HyperBus controller
 * @prepare: preparation for ops
 * @unprepare: post work after ops
 */

struct hyperbus_ops {
	u16 (*read16)(struct hyperbus_device *hbdev, unsigned long addr);
	void (*write16)(struct hyperbus_device *hbdev,
			unsigned long addr, u16 val);
	void (*copy_from)(struct hyperbus_device *hbdev, void *to,
			  unsigned long from, ssize_t len);
	void (*copy_to)(struct hyperbus_device *dev, unsigned long to,
			const void *from, ssize_t len);
	int (*calibrate)(struct hyperbus_device *dev);
	int (*prepare)(struct hyperbus_device *dev);
	void (*unprepare)(struct hyperbus_device *dev);
};

/**
 * struct hyperbus_ctlr - struct representing HyperBus controller
 * @calibrated: flag to indicate ctlr calibration sequence is complete
 * @ops: HyperBus controller ops
 */
struct hyperbus_ctlr {
	struct device *dev;
	bool calibrated;

	const struct hyperbus_ops *ops;
};

/**
 * hyperbus_calibrate - default calibration routine for use by HyperBus ctlr.
 * @hbdev: hyperbus_device to be used for calibration
 *
 * Return: 0 for success, others for failure.
 */
int hyperbus_calibrate(struct hyperbus_device *hbdev);

/**
 * hyperbus_register_device - probe and register a HyperBus slave memory device
 * @hbdev: hyperbus_device struct with dev, np and ctlr field populated
 *
 * Return: 0 for success, others for failure.
 */
int hyperbus_register_device(struct hyperbus_device *hbdev);

/**
 * hyperbus_unregister_device - deregister HyperBus slave memory device
 * @hbdev: hyperbus_device to be unregistered
 *
 * Return: 0 for success, others for failure.
 */
int hyperbus_unregister_device(struct hyperbus_device *hbdev);

#endif /* __LINUX_MTD_HYPERBUS_H__ */
