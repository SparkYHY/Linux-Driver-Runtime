/*
 * Copyright (C) 2016 Freescale Semiconductor, Inc.
 * Copyright 2017-2019 NXP
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
 * for more details.
 */

#include <linux/clk.h>
#include <linux/io.h>
#include <linux/module.h>
#include <linux/mutex.h>
#include <linux/platform_device.h>
#include <linux/types.h>
#include <soc/imx8/sc/sci.h>
#include <video/dpu.h>
#include "dpu-prv.h"

#define FGSTCTRL		0x8
#define FGSYNCMODE_MASK		0x6
#define HTCFG1			0xC
#define HTOTAL(n)		((((n) - 1) & 0x3FFF) << 16)
#define HACT(n)			((n) & 0x3FFF)
#define HTCFG2			0x10
#define HSEN			BIT(31)
#define HSBP(n)			((((n) - 1) & 0x3FFF) << 16)
#define HSYNC(n)		(((n) - 1) & 0x3FFF)
#define VTCFG1			0x14
#define VTOTAL(n)		((((n) - 1) & 0x3FFF) << 16)
#define VACT(n)			((n) & 0x3FFF)
#define VTCFG2			0x18
#define VSEN			BIT(31)
#define VSBP(n)			((((n) - 1) & 0x3FFF) << 16)
#define VSYNC(n)		(((n) - 1) & 0x3FFF)
#define INTCONFIG(n)		(0x1C + 4 * (n))
#define EN			BIT(31)
#define ROW(n)			(((n) & 0x3FFF) << 16)
#define COL(n)			((n) & 0x3FFF)
#define PKICKCONFIG		0x2C
#define SKICKCONFIG		0x30
#define SECSTATCONFIG		0x34
#define FGSRCR1			0x38
#define FGSRCR2			0x3C
#define FGSRCR3			0x40
#define FGSRCR4			0x44
#define FGSRCR5			0x48
#define FGSRCR6			0x4C
#define FGKSDR			0x50
#define PACFG			0x54
#define STARTX(n)		(((n) + 1) & 0x3FFF)
#define STARTY(n)		(((((n) + 1) & 0x3FFF)) << 16)
#define SACFG			0x58
#define FGINCTRL		0x5C
#define FGDM_MASK		0x7
#define ENPRIMALPHA		BIT(3)
#define ENSECALPHA		BIT(4)
#define FGINCTRLPANIC		0x60
#define FGCCR			0x64
#define CCALPHA(a)		(((a) & 0x1) << 30)
#define CCRED(r)		(((r) & 0x3FF) << 20)
#define CCGREEN(g)		(((g) & 0x3FF) << 10)
#define CCBLUE(b)		((b) & 0x3FF)
#define FGENABLE		0x68
#define FGEN			BIT(0)
#define FGSLR			0x6C
#define FGENSTS			0x70
#define ENSTS			BIT(0)
#define FGTIMESTAMP		0x74
#define LINEINDEX_MASK		0x3FFF
#define LINEINDEX_SHIFT		0
#define FRAMEINDEX_MASK		0xFFFFC000
#define FRAMEINDEX_SHIFT	14
#define FGCHSTAT		0x78
#define SECSYNCSTAT		BIT(24)
#define SFIFOEMPTY		BIT(16)
#define FGCHSTATCLR		0x7C
#define CLRSECSTAT		BIT(16)
#define FGSKEWMON		0x80
#define FGSFIFOMIN		0x84
#define FGSFIFOMAX		0x88
#define FGSFIFOFILLCLR		0x8C
#define FGSREPD			0x90
#define FGSRFTD			0x94

#define KHZ			1000
#define PLL_MIN_FREQ_HZ		648000000

struct dpu_framegen {
	void __iomem *base;
	struct clk *clk_pll;
	struct clk *clk_bypass;
	struct clk *clk_disp_sel;
	struct clk *clk_disp;
	struct mutex mutex;
	int id;
	bool inuse;
	bool use_bypass_clk;
	bool encoder_type_has_lvds;
	bool side_by_side;
	struct dpu_soc *dpu;
};

static inline u32 dpu_fg_read(struct dpu_framegen *fg, unsigned int offset)
{
	return readl(fg->base + offset);
}

static inline void dpu_fg_write(struct dpu_framegen *fg, u32 value,
				unsigned int offset)
{
	writel(value, fg->base + offset);
}

/* FIXME: enable pixel link in a proper manner */
static void dpu_pixel_link_enable(int dpu_id, int stream_id)
{
	sc_err_t sciErr;
	sc_ipc_t ipcHndl = 0;
	u32 mu_id;

	sciErr = sc_ipc_getMuID(&mu_id);
	if (sciErr != SC_ERR_NONE) {
		pr_err("Cannot obtain MU ID\n");
		return;
	}

	sciErr = sc_ipc_open(&ipcHndl, mu_id);
	if (sciErr != SC_ERR_NONE) {
		pr_err("sc_ipc_open failed! (sciError = %d)\n", sciErr);
		return;
	}

	if (dpu_id == 0) {
		sciErr = sc_misc_set_control(ipcHndl, SC_R_DC_0,
			stream_id ? SC_C_PXL_LINK_MST2_ENB : SC_C_PXL_LINK_MST1_ENB, 1);
		if (sciErr != SC_ERR_NONE)
			pr_err("SC_R_DC_0:SC_C_PXL_LINK_MST%d_ENB sc_misc_set_control failed! (sciError = %d)\n", stream_id + 1, sciErr);
	} else if (dpu_id == 1) {
		sciErr = sc_misc_set_control(ipcHndl, SC_R_DC_1,
			stream_id ? SC_C_PXL_LINK_MST2_ENB : SC_C_PXL_LINK_MST1_ENB, 1);
		if (sciErr != SC_ERR_NONE)
			pr_err("SC_R_DC_1:SC_C_PXL_LINK_MST%d_ENB sc_misc_set_control failed! (sciError = %d)\n", stream_id + 1, sciErr);
	}

	sc_ipc_close(mu_id);
}

/* FIXME: disable pixel link in a proper manner */
static void dpu_pixel_link_disable(int dpu_id, int stream_id)
{
	sc_err_t sciErr;
	sc_ipc_t ipcHndl = 0;
	u32 mu_id;

	sciErr = sc_ipc_getMuID(&mu_id);
	if (sciErr != SC_ERR_NONE) {
		pr_err("Cannot obtain MU ID\n");
		return;
	}

	sciErr = sc_ipc_open(&ipcHndl, mu_id);
	if (sciErr != SC_ERR_NONE) {
		pr_err("sc_ipc_open failed! (sciError = %d)\n", sciErr);
		return;
	}

	if (dpu_id == 0) {
		sciErr = sc_misc_set_control(ipcHndl, SC_R_DC_0,
			stream_id ? SC_C_PXL_LINK_MST2_ENB : SC_C_PXL_LINK_MST1_ENB, 0);
		if (sciErr != SC_ERR_NONE)
			pr_err("SC_R_DC_0:SC_C_PXL_LINK_MST%d_ENB sc_misc_set_control failed! (sciError = %d)\n", stream_id + 1, sciErr);
	} else if (dpu_id == 1) {
		sciErr = sc_misc_set_control(ipcHndl, SC_R_DC_1,
			stream_id ? SC_C_PXL_LINK_MST2_ENB : SC_C_PXL_LINK_MST1_ENB, 0);
		if (sciErr != SC_ERR_NONE)
			pr_err("SC_R_DC_1:SC_C_PXL_LINK_MST%d_ENB sc_misc_set_control failed! (sciError = %d)\n", stream_id + 1, sciErr);
	}

	sc_ipc_close(mu_id);
}

/* FIXME: set MST address for pixel link in a proper manner */
static void dpu_pixel_link_set_mst_addr(int dpu_id, int stream_id, int mst_addr)
{
	sc_err_t sciErr;
	sc_ipc_t ipcHndl = 0;
	u32 mu_id;

	sciErr = sc_ipc_getMuID(&mu_id);
	if (sciErr != SC_ERR_NONE) {
		pr_err("Cannot obtain MU ID\n");
		return;
	}

	sciErr = sc_ipc_open(&ipcHndl, mu_id);
	if (sciErr != SC_ERR_NONE) {
		pr_err("sc_ipc_open failed! (sciError = %d)\n", sciErr);
		return;
	}

	if (dpu_id == 0) {
		sciErr = sc_misc_set_control(ipcHndl, SC_R_DC_0, stream_id ?
			SC_C_PXL_LINK_MST2_ADDR : SC_C_PXL_LINK_MST1_ADDR,
								mst_addr);
		if (sciErr != SC_ERR_NONE)
			pr_err("SC_R_DC_0:SC_C_PXL_LINK_MST%d_ADDR sc_misc_set_control failed! (sciError = %d)\n", stream_id + 1, sciErr);
	} else if (dpu_id == 1) {
		sciErr = sc_misc_set_control(ipcHndl, SC_R_DC_1, stream_id ?
			SC_C_PXL_LINK_MST2_ADDR : SC_C_PXL_LINK_MST1_ADDR,
								mst_addr);
		if (sciErr != SC_ERR_NONE)
			pr_err("SC_R_DC_1:SC_C_PXL_LINK_MST%d_ADDR sc_misc_set_control failed! (sciError = %d)\n", stream_id + 1, sciErr);
	}

	sc_ipc_close(mu_id);
}

/* FIXME: set dc sync mode for pixel link in a proper manner */
static void dpu_pixel_link_set_dc_sync_mode(int dpu_id, bool enable)
{
	sc_err_t sciErr;
	sc_ipc_t ipcHndl = 0;
	u32 mu_id;

	sciErr = sc_ipc_getMuID(&mu_id);
	if (sciErr != SC_ERR_NONE) {
		pr_err("Cannot obtain MU ID\n");
		return;
	}

	sciErr = sc_ipc_open(&ipcHndl, mu_id);
	if (sciErr != SC_ERR_NONE) {
		pr_err("sc_ipc_open failed! (sciError = %d)\n", sciErr);
		return;
	}

	if (dpu_id == 0) {
		sciErr = sc_misc_set_control(ipcHndl,
						SC_R_DC_0, SC_C_MODE, enable);
		if (sciErr != SC_ERR_NONE)
			pr_err("SC_R_DC_0:SC_C_MODE sc_misc_set_control failed! (sciError = %d)\n", sciErr);
	} else if (dpu_id == 1) {
		sciErr = sc_misc_set_control(ipcHndl,
						SC_R_DC_1, SC_C_MODE, enable);
		if (sciErr != SC_ERR_NONE)
			pr_err("SC_R_DC_1:SC_C_MODE sc_misc_set_control failed! (sciError = %d)\n", sciErr);
	}

	sc_ipc_close(mu_id);
}

void framegen_enable(struct dpu_framegen *fg)
{
	dpu_fg_write(fg, FGEN, FGENABLE);
}
EXPORT_SYMBOL_GPL(framegen_enable);

void framegen_disable(struct dpu_framegen *fg)
{
	dpu_fg_write(fg, 0, FGENABLE);
}
EXPORT_SYMBOL_GPL(framegen_disable);

void framegen_enable_pixel_link(struct dpu_framegen *fg)
{
	struct dpu_soc *dpu = fg->dpu;
	const struct dpu_devtype *devtype = dpu->devtype;

	if (!(devtype->has_dual_ldb && fg->encoder_type_has_lvds))
		dpu_pixel_link_enable(dpu->id, fg->id);
}
EXPORT_SYMBOL_GPL(framegen_enable_pixel_link);

void framegen_disable_pixel_link(struct dpu_framegen *fg)
{
	struct dpu_soc *dpu = fg->dpu;
	const struct dpu_devtype *devtype = dpu->devtype;

	if (!(devtype->has_dual_ldb && fg->encoder_type_has_lvds))
		dpu_pixel_link_disable(dpu->id, fg->id);
}
EXPORT_SYMBOL_GPL(framegen_disable_pixel_link);

void framegen_shdtokgen(struct dpu_framegen *fg)
{
	dpu_fg_write(fg, SHDTOKGEN, FGSLR);
}
EXPORT_SYMBOL_GPL(framegen_shdtokgen);

void framegen_syncmode(struct dpu_framegen *fg, fgsyncmode_t mode)
{
	struct dpu_soc *dpu = fg->dpu;
	u32 val;

	val = dpu_fg_read(fg, FGSTCTRL);
	val &= ~FGSYNCMODE_MASK;
	val |= mode;
	dpu_fg_write(fg, val, FGSTCTRL);

	dpu_pixel_link_set_dc_sync_mode(dpu->id, mode != FGSYNCMODE__OFF);
}
EXPORT_SYMBOL_GPL(framegen_syncmode);

void
framegen_cfg_videomode(struct dpu_framegen *fg,
		       struct drm_display_mode *m, bool side_by_side,
		       bool encoder_type_has_tmds, bool encoder_type_has_lvds)
{
	struct dpu_soc *dpu = fg->dpu;
	const struct dpu_devtype *devtype = dpu->devtype;
	u32 hact, htotal, hsync, hsbp;
	u32 vact, vtotal, vsync, vsbp;
	u32 kick_row, kick_col;
	u32 val;
	unsigned long disp_clock_rate, pll_clock_rate = 0;
	int div = 0;

	fg->side_by_side = side_by_side;
	fg->encoder_type_has_lvds = encoder_type_has_lvds;

	hact = m->crtc_hdisplay;
	htotal = m->crtc_htotal;
	hsync = m->crtc_hsync_end - m->crtc_hsync_start;
	hsbp = m->crtc_htotal - m->crtc_hsync_start;

	if (side_by_side) {
		hact /= 2;
		htotal /= 2;
		hsync /= 2;
		hsbp /= 2;
	}

	vact = m->crtc_vdisplay;
	vtotal = m->crtc_vtotal;
	vsync = m->crtc_vsync_end - m->crtc_vsync_start;
	vsbp = m->crtc_vtotal - m->crtc_vsync_start;

	/* video mode */
	dpu_fg_write(fg, HACT(hact) | HTOTAL(htotal), HTCFG1);
	dpu_fg_write(fg, HSYNC(hsync) | HSBP(hsbp) | HSEN, HTCFG2);
	dpu_fg_write(fg, VACT(vact) | VTOTAL(vtotal), VTCFG1);
	dpu_fg_write(fg, VSYNC(vsync) | VSBP(vsbp) | VSEN, VTCFG2);

	kick_col = hact + 1;
	kick_row = vact;
	/*
	 * FrameGen as slave needs to be kicked later for
	 * one line comparing to the master.
	 */
	if (side_by_side && framegen_is_slave(fg) &&
	    devtype->has_syncmode_fixup)
		kick_row++;

	/* pkickconfig */
	dpu_fg_write(fg, COL(kick_col) | ROW(kick_row) | EN, PKICKCONFIG);

	/* skikconfig */
	dpu_fg_write(fg, COL(kick_col) | ROW(kick_row) | EN, SKICKCONFIG);

	/* primary and secondary area position config */
	dpu_fg_write(fg, STARTX(0) | STARTY(0), PACFG);
	dpu_fg_write(fg, STARTX(0) | STARTY(0), SACFG);

	/* alpha */
	val = dpu_fg_read(fg, FGINCTRL);
	val &= ~(ENPRIMALPHA | ENSECALPHA);
	dpu_fg_write(fg, val, FGINCTRL);

	val = dpu_fg_read(fg, FGINCTRLPANIC);
	val &= ~(ENPRIMALPHA | ENSECALPHA);
	dpu_fg_write(fg, val, FGINCTRLPANIC);

	/* constant color */
	dpu_fg_write(fg, 0, FGCCR);

	disp_clock_rate = m->clock * 1000;

	/*
	 * To workaround setting clock rate failure issue
	 * when the system resumes back from PM sleep mode,
	 * we need to get the clock rates before setting
	 * their rates, otherwise, setting the clock rates
	 * will fail.
	 */
	if (devtype->has_disp_sel_clk && encoder_type_has_tmds) {
		if (side_by_side)
			dpu_pixel_link_set_mst_addr(dpu->id, fg->id,
							fg->id ? 2 : 1);
		else
			dpu_pixel_link_set_mst_addr(dpu->id, fg->id, 1);

		clk_set_parent(fg->clk_disp_sel, fg->clk_bypass);

		fg->use_bypass_clk = true;
	} else {
		dpu_pixel_link_set_mst_addr(dpu->id, fg->id, 0);

		/* find an even divisor for PLL */
		do {
			div += 2;
			pll_clock_rate = disp_clock_rate * div;
		} while (pll_clock_rate < PLL_MIN_FREQ_HZ);

		if (devtype->has_disp_sel_clk)
			clk_set_parent(fg->clk_disp_sel, fg->clk_pll);

		clk_get_rate(fg->clk_pll);
		clk_get_rate(fg->clk_disp);
		clk_set_rate(fg->clk_pll, pll_clock_rate);
		clk_set_rate(fg->clk_disp, disp_clock_rate);

		fg->use_bypass_clk = false;
	}
}
EXPORT_SYMBOL_GPL(framegen_cfg_videomode);

void framegen_pkickconfig(struct dpu_framegen *fg, bool enable)
{
	u32 val;

	val = dpu_fg_read(fg, PKICKCONFIG);
	if (enable)
		val |= EN;
	else
		val &= ~EN;
	dpu_fg_write(fg, val, PKICKCONFIG);
}
EXPORT_SYMBOL_GPL(framegen_pkickconfig);

void framegen_syncmode_fixup(struct dpu_framegen *fg, bool enable)
{
	struct dpu_soc *dpu = fg->dpu;
	u32 val;

	if (!dpu->devtype->has_syncmode_fixup)
		return;

	val = dpu_fg_read(fg, SECSTATCONFIG);
	if (enable)
		val |= BIT(7);
	else
		val &= ~BIT(7);
	dpu_fg_write(fg, val, SECSTATCONFIG);
}
EXPORT_SYMBOL_GPL(framegen_syncmode_fixup);

void framegen_displaymode(struct dpu_framegen *fg, fgdm_t mode)
{
	u32 val;

	val = dpu_fg_read(fg, FGINCTRL);
	val &= ~FGDM_MASK;
	val |= mode;
	dpu_fg_write(fg, val, FGINCTRL);
}
EXPORT_SYMBOL_GPL(framegen_displaymode);

void framegen_panic_displaymode(struct dpu_framegen *fg, fgdm_t mode)
{
	u32 val;

	val = dpu_fg_read(fg, FGINCTRLPANIC);
	val &= ~FGDM_MASK;
	val |= mode;
	dpu_fg_write(fg, val, FGINCTRLPANIC);
}
EXPORT_SYMBOL_GPL(framegen_panic_displaymode);

void framegen_wait_done(struct dpu_framegen *fg, struct drm_display_mode *m)
{
	unsigned long timeout, pending_framedur_jiffies;
	int frame_size = m->crtc_htotal * m->crtc_vtotal;
	int dotclock, pending_framedur_ns;
	u32 val;

	dotclock = clk_get_rate(fg->clk_disp) / KHZ;
	if (dotclock == 0) {
		/* fall back to display mode's clock */
		dotclock = m->crtc_clock;

		if (!(fg->side_by_side && fg->id == 1))
			dev_warn(fg->dpu->dev,
				"pixel clock for FrameGen%d is zero\n", fg->id);
	}

	/*
	 * The SoC designer indicates that there are two pending frames
	 * to complete in the worst case.
	 * So, three pending frames are enough for sure.
	 */
	pending_framedur_ns = div_u64((u64) 3 * frame_size * 1000000, dotclock);
	pending_framedur_jiffies = nsecs_to_jiffies(pending_framedur_ns);
	if (pending_framedur_jiffies > (3 * HZ)) {
		pending_framedur_jiffies = 3 * HZ;

		dev_warn(fg->dpu->dev,
			 "truncate FrameGen%d pending frame duration to 3sec\n",
			 fg->id);
	}
	timeout = jiffies + pending_framedur_jiffies;

	do {
		val = dpu_fg_read(fg, FGENSTS);
	} while ((val & ENSTS) && time_before(jiffies, timeout));

	dev_dbg(fg->dpu->dev, "FrameGen%d pending frame duration is %ums\n",
			 fg->id, jiffies_to_msecs(pending_framedur_jiffies));

	if (val & ENSTS)
		dev_err(fg->dpu->dev, "failed to wait for FrameGen%d done\n",
			fg->id);
}
EXPORT_SYMBOL_GPL(framegen_wait_done);

static inline u32 framegen_frame_index(u32 stamp)
{
	return (stamp & FRAMEINDEX_MASK) >> FRAMEINDEX_SHIFT;
}

static inline u32 framegen_line_index(u32 stamp)
{
	return (stamp & LINEINDEX_MASK) >> LINEINDEX_SHIFT;
}

void framegen_read_timestamp(struct dpu_framegen *fg,
			     u32 *frame_index, u32 *line_index)
{
	u32 stamp;

	stamp = dpu_fg_read(fg, FGTIMESTAMP);
	*frame_index = framegen_frame_index(stamp);
	*line_index = framegen_line_index(stamp);
}
EXPORT_SYMBOL_GPL(framegen_read_timestamp);

void framegen_wait_for_frame_counter_moving(struct dpu_framegen *fg)
{
	u32 frame_index, line_index, last_frame_index;
	unsigned long timeout = jiffies + msecs_to_jiffies(100);

	framegen_read_timestamp(fg, &frame_index, &line_index);
	do {
		last_frame_index = frame_index;
		framegen_read_timestamp(fg, &frame_index, &line_index);
	} while (last_frame_index == frame_index &&
						time_before(jiffies, timeout));

	if (last_frame_index == frame_index)
		dev_err(fg->dpu->dev,
			"failed to wait for FrameGen%d frame counter moving\n",
			fg->id);
	else
		dev_dbg(fg->dpu->dev,
			"FrameGen%d frame counter moves - last %u, curr %d\n",
			fg->id, last_frame_index, frame_index);
}
EXPORT_SYMBOL_GPL(framegen_wait_for_frame_counter_moving);

bool framegen_secondary_requests_to_read_empty_fifo(struct dpu_framegen *fg)
{
	u32 val;
	bool empty;

	val = dpu_fg_read(fg, FGCHSTAT);

	empty = !!(val & SFIFOEMPTY);

	if (empty)
		dev_dbg(fg->dpu->dev,
			"FrameGen%d secondary requests to read empty FIFO\n",
			fg->id);

	return empty;
}
EXPORT_SYMBOL_GPL(framegen_secondary_requests_to_read_empty_fifo);

void framegen_secondary_clear_channel_status(struct dpu_framegen *fg)
{
	dpu_fg_write(fg, CLRSECSTAT, FGCHSTATCLR);
}
EXPORT_SYMBOL_GPL(framegen_secondary_clear_channel_status);

bool framegen_secondary_is_syncup(struct dpu_framegen *fg)
{
	u32 val = dpu_fg_read(fg, FGCHSTAT);

	return val & SECSYNCSTAT;
}
EXPORT_SYMBOL_GPL(framegen_secondary_is_syncup);

void framegen_wait_for_secondary_syncup(struct dpu_framegen *fg)
{
	unsigned long timeout = jiffies + msecs_to_jiffies(100);
	bool syncup;

	do {
		syncup = framegen_secondary_is_syncup(fg);
	} while (!syncup && time_before(jiffies, timeout));

	if (syncup)
		dev_dbg(fg->dpu->dev, "FrameGen%d secondary syncup\n", fg->id);
	else
		dev_err(fg->dpu->dev,
			"failed to wait for FrameGen%d secondary syncup\n",
			fg->id);
}
EXPORT_SYMBOL_GPL(framegen_wait_for_secondary_syncup);

void framegen_enable_clock(struct dpu_framegen *fg)
{
	if (!fg->use_bypass_clk)
		clk_prepare_enable(fg->clk_pll);
	clk_prepare_enable(fg->clk_disp);
}
EXPORT_SYMBOL_GPL(framegen_enable_clock);

void framegen_disable_clock(struct dpu_framegen *fg)
{
	if (!fg->use_bypass_clk)
		clk_disable_unprepare(fg->clk_pll);
	clk_disable_unprepare(fg->clk_disp);
}
EXPORT_SYMBOL_GPL(framegen_disable_clock);

bool framegen_is_master(struct dpu_framegen *fg)
{
	const struct dpu_devtype *devtype = fg->dpu->devtype;

	return fg->id == devtype->master_stream_id;
}
EXPORT_SYMBOL_GPL(framegen_is_master);

bool framegen_is_slave(struct dpu_framegen *fg)
{
	return !framegen_is_master(fg);
}
EXPORT_SYMBOL_GPL(framegen_is_slave);

struct dpu_framegen *dpu_fg_get(struct dpu_soc *dpu, int id)
{
	struct dpu_framegen *fg;
	int i;

	for (i = 0; i < ARRAY_SIZE(fg_ids); i++)
		if (fg_ids[i] == id)
			break;

	if (i == ARRAY_SIZE(fg_ids))
		return ERR_PTR(-EINVAL);

	fg = dpu->fg_priv[i];

	mutex_lock(&fg->mutex);

	if (fg->inuse) {
		mutex_unlock(&fg->mutex);
		return ERR_PTR(-EBUSY);
	}

	fg->inuse = true;

	mutex_unlock(&fg->mutex);

	return fg;
}
EXPORT_SYMBOL_GPL(dpu_fg_get);

void dpu_fg_put(struct dpu_framegen *fg)
{
	mutex_lock(&fg->mutex);

	fg->inuse = false;

	mutex_unlock(&fg->mutex);
}
EXPORT_SYMBOL_GPL(dpu_fg_put);

struct dpu_framegen *dpu_aux_fg_peek(struct dpu_framegen *fg)
{
	return fg->dpu->fg_priv[fg->id ^ 1];
}
EXPORT_SYMBOL_GPL(dpu_aux_fg_peek);

void _dpu_fg_init(struct dpu_soc *dpu, unsigned int id)
{
	struct dpu_framegen *fg;
	int i;

	for (i = 0; i < ARRAY_SIZE(fg_ids); i++)
		if (fg_ids[i] == id)
			break;

	if (WARN_ON(i == ARRAY_SIZE(fg_ids)))
		return;

	fg = dpu->fg_priv[i];

	framegen_syncmode(fg, FGSYNCMODE__OFF);
}

int dpu_fg_init(struct dpu_soc *dpu, unsigned int id,
		unsigned long unused, unsigned long base)
{
	struct dpu_framegen *fg;

	fg = devm_kzalloc(dpu->dev, sizeof(*fg), GFP_KERNEL);
	if (!fg)
		return -ENOMEM;

	dpu->fg_priv[id] = fg;

	fg->base = devm_ioremap(dpu->dev, base, SZ_256);
	if (!fg->base)
		return -ENOMEM;

	fg->clk_pll = devm_clk_get(dpu->dev, id ? "pll1" : "pll0");
	if (IS_ERR(fg->clk_pll))
		return PTR_ERR(fg->clk_pll);

	if (dpu->devtype->has_disp_sel_clk) {
		fg->clk_bypass = devm_clk_get(dpu->dev, "bypass0");
		if (IS_ERR(fg->clk_bypass))
			return PTR_ERR(fg->clk_bypass);

		fg->clk_disp_sel = devm_clk_get(dpu->dev,
					id ? "disp1_sel" : "disp0_sel");
			if (IS_ERR(fg->clk_disp_sel))
				return PTR_ERR(fg->clk_disp_sel);
	}

	fg->clk_disp = devm_clk_get(dpu->dev, id ? "disp1" : "disp0");
	if (IS_ERR(fg->clk_disp))
		return PTR_ERR(fg->clk_disp);

	fg->dpu = dpu;
	fg->id = id;
	mutex_init(&fg->mutex);

	_dpu_fg_init(dpu, id);

	return 0;
}
