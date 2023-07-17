/*
 * Copyright (C) 2016 Marek Vasut <marex@denx.de>
 *
 * i.MX23/i.MX28/i.MX6SX MXSFB LCD controller driver.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

#ifndef __MXSFB_DRV_H__
#define __MXSFB_DRV_H__

#define MAX_CLK_SRC 2

struct mxsfb_devdata {
	unsigned int	 transfer_count;
	unsigned int	 cur_buf;
	unsigned int	 next_buf;
	unsigned int	 debug0;
	unsigned int	 hs_wdth_mask;
	unsigned int	 hs_wdth_shift;
	unsigned int	 ipversion;
	unsigned int	 flags;
	unsigned int	 num_formats;
};

struct mode_config {
	struct clk *clk_src;
	unsigned long out_rate;
	int clock;
	int mode_clock;
	struct list_head list;
};

struct mxsfb_drm_private {
	struct device			*dev;
	const struct mxsfb_devdata	*devdata;

	void __iomem			*base;	/* registers */
	struct clk			*clk;
	struct clk			*clk_axi;
	struct clk			*clk_disp_axi;
	struct clk			*clk_src[MAX_CLK_SRC];
	struct clk			*clk_sel, *clk_pll;

	struct drm_simple_display_pipe	pipe;
	struct drm_connector		panel_connector;
	struct drm_connector		*connector;
	struct drm_panel		*panel;
	struct drm_bridge		*bridge;
	struct drm_fbdev_cma		*fbdev;

	struct list_head		valid_modes;
};

int mxsfb_setup_crtc(struct drm_device *dev);
int mxsfb_create_output(struct drm_device *dev);

void mxsfb_crtc_enable(struct mxsfb_drm_private *mxsfb);
void mxsfb_crtc_disable(struct mxsfb_drm_private *mxsfb);
void mxsfb_plane_atomic_update(struct mxsfb_drm_private *mxsfb,
			       struct drm_plane_state *old_state);

#endif /* __MXSFB_DRV_H__ */
