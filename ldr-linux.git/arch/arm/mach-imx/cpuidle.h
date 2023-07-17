/*
 * Copyright 2012-2016 Freescale Semiconductor, Inc.
 * Copyright 2012 Linaro Ltd.
 *
 * The code contained herein is licensed under the GNU General Public
 * License. You may obtain a copy of the GNU General Public License
 * Version 2 or later at the following locations:
 *
 * http://www.opensource.org/licenses/gpl-license.html
 * http://www.gnu.org/copyleft/gpl.html
 */

#ifdef CONFIG_CPU_IDLE
extern int imx5_cpuidle_init(void);
extern int imx6q_cpuidle_init(void);
extern int imx6sl_cpuidle_init(void);
extern int imx6sx_cpuidle_init(void);
extern int imx6ul_cpuidle_init(void);
extern int imx7d_cpuidle_init(void);
extern int imx7d_enable_rcosc(void);
extern int imx7ulp_cpuidle_init(void);
#else
static inline int imx5_cpuidle_init(void)
{
	return 0;
}
static inline int imx6q_cpuidle_init(void)
{
	return 0;
}
static inline int imx6sl_cpuidle_init(void)
{
	return 0;
}
static inline int imx6sx_cpuidle_init(void)
{
	return 0;
}
static inline int imx6ul_cpuidle_init(void)
{
	return 0;
}
static inline int imx7d_cpuidle_init(void)
{
	return 0;
}
static inline int imx7d_enable_rcosc(void)
{
	return 0;
}
static inline int imx7ulp_cpuidle_init(void)
{
	return 0;
}
#endif

#if defined(CONFIG_CPU_IDLE) && defined (CONFIG_SOC_IMX6SLL)
extern int imx6sll_cpuidle_init(void);
#else
static inline int imx6sll_cpuidle_init(void) { return 0; }
#endif
