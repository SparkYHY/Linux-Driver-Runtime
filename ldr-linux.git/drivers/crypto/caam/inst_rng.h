/* SPDX-License-Identifier: GPL-2.0 */
/*
 * CAAM Private/internal definitions between modules
 *
 * Copyright 2017-2018 NXP
 */

#ifndef INST_RNG_H
#define INST_RNG_H

#include <linux/platform_device.h>

#define ENT_DELAY_STEP	(400)
int inst_rng_imx(struct platform_device *pdev);

int deinst_rng(struct platform_device *pdev);

#endif /* INST_RNG_H */
