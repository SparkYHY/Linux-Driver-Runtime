/*
 * Copyright (C) 2017 NXP
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
#include <linux/device.h>
#include <linux/bitops.h>
#include <linux/platform_device.h>
#include <linux/io.h>
#include <drm/drm_fourcc.h>

#include <video/imx-dcss.h>
#include "dcss-prv.h"

#define USE_CTXLD

#define DCSS_SCALER_CTRL			0x00
#define   SCALER_EN				BIT(0)
#define   REPEAT_EN				BIT(4)
#define   SCALE2MEM_EN				BIT(8)
#define   MEM2OFIFO_EN				BIT(12)
#define DCSS_SCALER_OFIFO_CTRL			0x04
#define   OFIFO_LOW_THRES_POS			0
#define   OFIFO_LOW_THRES_MASK			GENMASK(9, 0)
#define   OFIFO_HIGH_THRES_POS			16
#define   OFIFO_HIGH_THRES_MASK			GENMASK(25, 16)
#define   UNDERRUN_DETECT_CLR			BIT(26)
#define   LOW_THRES_DETECT_CLR			BIT(27)
#define   HIGH_THRES_DETECT_CLR			BIT(28)
#define   UNDERRUN_DETECT_EN			BIT(29)
#define   LOW_THRES_DETECT_EN			BIT(30)
#define   HIGH_THRES_DETECT_EN			BIT(31)
#define DCSS_SCALER_SDATA_CTRL			0x08
#define   YUV_EN				BIT(0)
#define   RTRAM_8LINES				BIT(1)
#define   Y_UV_BYTE_SWAP			BIT(4)
#define   A2R10G10B10_FORMAT_POS		8
#define   A2R10G10B10_FORMAT_MASK		GENMASK(11, 8)
#define DCSS_SCALER_BIT_DEPTH			0x0C
#define   LUM_BIT_DEPTH_POS			0
#define   LUM_BIT_DEPTH_MASK			GENMASK(1, 0)
#define   CHR_BIT_DEPTH_POS			4
#define   CHR_BIT_DEPTH_MASK			GENMASK(5, 4)
#define DCSS_SCALER_SRC_FORMAT			0x10
#define DCSS_SCALER_DST_FORMAT			0x14
#define   FORMAT_MASK				GENMASK(1, 0)
#define DCSS_SCALER_SRC_LUM_RES			0x18
#define DCSS_SCALER_SRC_CHR_RES			0x1C
#define DCSS_SCALER_DST_LUM_RES			0x20
#define DCSS_SCALER_DST_CHR_RES			0x24
#define   WIDTH_POS				0
#define   WIDTH_MASK				GENMASK(11, 0)
#define   HEIGHT_POS				16
#define   HEIGHT_MASK				GENMASK(27, 16)
#define DCSS_SCALER_V_LUM_START			0x48
#define   V_START_MASK				GENMASK(15, 0)
#define DCSS_SCALER_V_LUM_INC			0x4C
#define   V_INC_MASK				GENMASK(15, 0)
#define DCSS_SCALER_H_LUM_START			0x50
#define   H_START_MASK				GENMASK(18, 0)
#define DCSS_SCALER_H_LUM_INC			0x54
#define   H_INC_MASK				GENMASK(15, 0)
#define DCSS_SCALER_V_CHR_START			0x58
#define DCSS_SCALER_V_CHR_INC			0x5C
#define DCSS_SCALER_H_CHR_START			0x60
#define DCSS_SCALER_H_CHR_INC			0x64
#define DCSS_SCALER_COEF_VLUM			0x80
#define DCSS_SCALER_COEF_HLUM			0x140
#define DCSS_SCALER_COEF_VCHR			0x200
#define DCSS_SCALER_COEF_HCHR			0x300

static struct dcss_debug_reg scaler_debug_reg[] = {
	DCSS_DBG_REG(DCSS_SCALER_CTRL),
	DCSS_DBG_REG(DCSS_SCALER_OFIFO_CTRL),
	DCSS_DBG_REG(DCSS_SCALER_SDATA_CTRL),
	DCSS_DBG_REG(DCSS_SCALER_BIT_DEPTH),
	DCSS_DBG_REG(DCSS_SCALER_SRC_FORMAT),
	DCSS_DBG_REG(DCSS_SCALER_DST_FORMAT),
	DCSS_DBG_REG(DCSS_SCALER_SRC_LUM_RES),
	DCSS_DBG_REG(DCSS_SCALER_SRC_CHR_RES),
	DCSS_DBG_REG(DCSS_SCALER_DST_LUM_RES),
	DCSS_DBG_REG(DCSS_SCALER_DST_CHR_RES),
	DCSS_DBG_REG(DCSS_SCALER_V_LUM_START),
	DCSS_DBG_REG(DCSS_SCALER_V_LUM_INC),
	DCSS_DBG_REG(DCSS_SCALER_H_LUM_START),
	DCSS_DBG_REG(DCSS_SCALER_H_LUM_INC),
	DCSS_DBG_REG(DCSS_SCALER_V_CHR_START),
	DCSS_DBG_REG(DCSS_SCALER_V_CHR_INC),
	DCSS_DBG_REG(DCSS_SCALER_H_CHR_START),
	DCSS_DBG_REG(DCSS_SCALER_H_CHR_INC),
};

struct dcss_scaler_ch {
	void __iomem *base_reg;
	u32 base_ofs;

	u32 ctx_id;

	u32 sdata_ctrl;
	u32 scaler_ctrl;

	bool scaler_ctrl_chgd;

	u32 c_vstart;
	u32 c_hstart;
};

struct dcss_scaler_priv {
	struct dcss_soc *dcss;
	struct dcss_scaler_ch ch[3];

	int ch_using_wrscl;
};

/* scaler coefficients generator */
#define PSC_FRAC_BITS 30
#define PSC_FRAC_SCALE BIT(PSC_FRAC_BITS)
#define PSC_BITS_FOR_PHASE 4
#define PSC_NUM_PHASES 16
#define PSC_STORED_PHASES (PSC_NUM_PHASES / 2 + 1)
#define PSC_NUM_TAPS 7
#define PSC_NUM_TAPS_RGBA 5
#define PSC_COEFF_PRECISION 10
#define PSC_PHASE_FRACTION_BITS 13
#define PSC_PHASE_MASK (PSC_NUM_PHASES - 1)
#define PSC_Q_FRACTION 19
#define PSC_Q_ROUND_OFFSET (1 << (PSC_Q_FRACTION - 1))

/**
 * mult_q() - Performs fixed-point multiplication.
 * @A: multiplier
 * @B: multiplicand
 */
static int mult_q(int A, int B)
{
	int result;
	s64 temp;

	temp = (int64_t)A * (int64_t)B;
	temp += PSC_Q_ROUND_OFFSET;
	result = (int)(temp >> PSC_Q_FRACTION);
	return result;
}

/**
 * div_q() - Performs fixed-point division.
 * @A: dividend
 * @B: divisor
 */
static int div_q(int A, int B)
{
	int result;
	s64 temp;

	temp = (int64_t)A << PSC_Q_FRACTION;
	if ((temp >= 0 && B >= 0) || (temp < 0 && B < 0))
		temp += B / 2;
	else
		temp -= B / 2;

	result = (int)(temp / B);
	return result;
}

/**
 * exp_approx_q() - Compute approximation to exp(x) function using Taylor
 *		    series.
 * @x: fixed-point argument of exp function
 */
static int exp_approx_q(int x)
{
	int sum = 1 << PSC_Q_FRACTION;
	int term = 1 << PSC_Q_FRACTION;

	term = mult_q(term, div_q(x, 1 << PSC_Q_FRACTION));
	sum += term;
	term = mult_q(term, div_q(x, 2 << PSC_Q_FRACTION));
	sum += term;
	term = mult_q(term, div_q(x, 3 << PSC_Q_FRACTION));
	sum += term;
	term = mult_q(term, div_q(x, 4 << PSC_Q_FRACTION));
	sum += term;

	return sum;
}

/**
 * dcss_scaler_gaussian_filter() -Generate gaussian prototype filter.
 * @fc_q: fixed-point cutoff frequency normalized to range [0, 1]
 * @use_5_taps: indicates whether to use 5 taps or 7 taps
 * @coef: output filter coefficients
 */
static void dcss_scaler_gaussian_filter(int fc_q, bool use_5_taps,
					bool phase0_identity,
					int coef[][PSC_NUM_TAPS])
{
	int sigma_q, g0_q, g1_q, g2_q;
	int tap_cnt1, tap_cnt2, phase_cnt;
	int mid;
	int phase;
	int i;

	if (use_5_taps)
		for (phase = 0; phase < PSC_STORED_PHASES; phase++) {
			coef[phase][0] = 0;
			coef[phase][PSC_NUM_TAPS - 1] = 0;
		}

	/* seed coefficient scanner */
	mid = (PSC_NUM_PHASES * (use_5_taps ? PSC_NUM_TAPS_RGBA : PSC_NUM_TAPS)) / 2 - 1;
	phase_cnt = (PSC_NUM_PHASES * (PSC_NUM_TAPS + 1)) / 2;
	tap_cnt1 = (PSC_NUM_PHASES * PSC_NUM_TAPS) / 2;
	tap_cnt2 = (PSC_NUM_PHASES * PSC_NUM_TAPS) / 2;

	/* seed gaussian filter generator */
	sigma_q = div_q(PSC_Q_ROUND_OFFSET, fc_q);
	g0_q = 1 << PSC_Q_FRACTION;
	g1_q = exp_approx_q(div_q(-PSC_Q_ROUND_OFFSET, mult_q(sigma_q, sigma_q)));
	g2_q = mult_q(g1_q, g1_q);
	coef[phase_cnt & PSC_PHASE_MASK][tap_cnt1 >> PSC_BITS_FOR_PHASE] = g0_q;

	for (i = 0; i < mid; i++) {
		phase_cnt++;
		tap_cnt1--;
		tap_cnt2++;

		g0_q = mult_q(g0_q, g1_q);
		g1_q = mult_q(g1_q, g2_q);

		if ((phase_cnt & PSC_PHASE_MASK) <= 8)
			coef[phase_cnt & PSC_PHASE_MASK][tap_cnt1 >> PSC_BITS_FOR_PHASE] = g0_q;
		if (((-phase_cnt) & PSC_PHASE_MASK) <= 8)
			coef[(-phase_cnt) & PSC_PHASE_MASK][tap_cnt2 >> PSC_BITS_FOR_PHASE] = g0_q;
	}

	phase_cnt++;
	tap_cnt1--;
	coef[phase_cnt & PSC_PHASE_MASK][tap_cnt1 >> PSC_BITS_FOR_PHASE] = 0;

	/* override phase 0 with identity filter if specified */
	if (phase0_identity)
		for (i = 0; i < PSC_NUM_TAPS; i++)
			coef[0][i] = i == (PSC_NUM_TAPS >> 1) ? (1 << PSC_COEFF_PRECISION) : 0;

	/* normalize coef */
	for (phase = 0; phase < PSC_STORED_PHASES; phase++) {
		int sum = 0;
		s64 ll_temp;

		for (i = 0; i < PSC_NUM_TAPS; i++)
			sum += coef[phase][i];
		for (i = 0; i < PSC_NUM_TAPS; i++) {
			ll_temp = coef[phase][i];
			ll_temp <<= PSC_COEFF_PRECISION;
			ll_temp += sum >> 1;
			ll_temp /= sum;
			coef[phase][i] = (int)ll_temp;
		}
	}
}

/**
 * dcss_scaler_filter_design() - Compute filter coefficients using Gaussian filter.
 * @src_length: length of input
 * @dst_length: length of output
 * @use_5_taps: 0 for 7 taps per phase, 1 for 5 taps
 * @coef: output coefficients
 */
static void dcss_scaler_filter_design(int src_length, int dst_length,
				      bool use_5_taps, bool phase0_identity,
				      int coef[][PSC_NUM_TAPS])
{
	int fc_q;

	/* compute cutoff frequency */
	if (dst_length >= src_length)
		fc_q = div_q(1, PSC_NUM_PHASES);
	else
		fc_q = div_q(dst_length, src_length * PSC_NUM_PHASES);

	/* compute gaussian filter coefficients */
	dcss_scaler_gaussian_filter(fc_q, use_5_taps, phase0_identity, coef);
}

static void dcss_scaler_write(struct dcss_scaler_priv *scl, int ch_num,
			      u32 val, u32 ofs)
{
#if !defined(USE_CTXLD)
	dcss_writel(val, scl->ch[ch_num].base_reg + ofs);
#else
	dcss_ctxld_write(scl->dcss, scl->ch[ch_num].ctx_id,
			 val, scl->ch[ch_num].base_ofs + ofs);
#endif
}

#ifdef CONFIG_DEBUG_FS
void dcss_scaler_dump_regs(struct seq_file *s, void *data)
{
	struct dcss_soc *dcss = data;
	int i, j;

	for (i = 0; i < 3; i++) {
		seq_printf(s, ">> Dumping SCALER CH %d:\n", i);
		for (j = 0; j < ARRAY_SIZE(scaler_debug_reg); j++) {
			seq_printf(s, "%-35s(0x%04x) -> 0x%08x\n",
				scaler_debug_reg[j].name,
				scaler_debug_reg[j].ofs,
				dcss_readl(dcss->scaler_priv->ch[i].base_reg +
					   scaler_debug_reg[j].ofs));
		}
	}
}
#endif

static int dcss_scaler_ch_init_all(struct dcss_soc *dcss,
				   unsigned long scaler_base)
{
	struct dcss_scaler_priv *scaler = dcss->scaler_priv;
	struct dcss_scaler_ch *ch;
	int i;

	for (i = 0; i < 3; i++) {
		ch = &scaler->ch[i];

		ch->base_ofs = scaler_base + i * 0x400;

		ch->base_reg = devm_ioremap(dcss->dev, ch->base_ofs, SZ_4K);
		if (!ch->base_reg) {
			dev_err(dcss->dev, "scaler: unable to remap ch base\n");
			return -ENOMEM;
		}

#if defined(USE_CTXLD)
		ch->ctx_id = CTX_SB_HP;
#endif
	}

	return 0;
}

int dcss_scaler_init(struct dcss_soc *dcss, unsigned long scaler_base)
{
	struct dcss_scaler_priv *scaler;

	scaler = devm_kzalloc(dcss->dev, sizeof(*scaler), GFP_KERNEL);
	if (!scaler)
		return -ENOMEM;

	dcss->scaler_priv = scaler;
	scaler->dcss = dcss;

	scaler->ch_using_wrscl = -1;

	return dcss_scaler_ch_init_all(dcss, scaler_base);
}

void dcss_scaler_exit(struct dcss_soc *dcss)
{
	struct dcss_scaler_priv *scaler = dcss->scaler_priv;
	int ch_no;

	for (ch_no = 0; ch_no < 3; ch_no++) {
		struct dcss_scaler_ch *ch = &scaler->ch[ch_no];

		dcss_writel(0, ch->base_reg + DCSS_SCALER_CTRL);
	}
}

void dcss_scaler_enable(struct dcss_soc *dcss, int ch_num, bool en)
{
	struct dcss_scaler_priv *scaler = dcss->scaler_priv;
	struct dcss_scaler_ch *ch = &scaler->ch[ch_num];
	u32 scaler_ctrl;

	if (scaler->ch_using_wrscl == ch_num) {
		if (en) {
			scaler_ctrl = SCALE2MEM_EN | MEM2OFIFO_EN | REPEAT_EN;
		} else {
			dcss_wrscl_enable(dcss, false);
			dcss_rdsrc_enable(dcss, false);

			scaler->ch_using_wrscl = -1;
			scaler_ctrl = 0;
		}
	} else {
		scaler_ctrl = en ? SCALER_EN | REPEAT_EN : 0;
	}

	if (en)
		dcss_scaler_write(dcss->scaler_priv, ch_num, ch->sdata_ctrl,
				  DCSS_SCALER_SDATA_CTRL);

	if (ch->scaler_ctrl != scaler_ctrl)
		ch->scaler_ctrl_chgd = true;

	ch->scaler_ctrl = scaler_ctrl;
}
EXPORT_SYMBOL(dcss_scaler_enable);

static void dcss_scaler_yuv_enable(struct dcss_soc *dcss, int ch_num, bool en)
{
	struct dcss_scaler_ch *ch = &dcss->scaler_priv->ch[ch_num];

	ch->sdata_ctrl &= ~YUV_EN;
	ch->sdata_ctrl |= en ? YUV_EN : 0;
}

static void dcss_scaler_rtr_8lines_enable(struct dcss_soc *dcss, int ch_num,
					  bool en)
{
	struct dcss_scaler_ch *ch = &dcss->scaler_priv->ch[ch_num];

	ch->sdata_ctrl &= ~RTRAM_8LINES;
	ch->sdata_ctrl |= en ? RTRAM_8LINES : 0;
}

static void dcss_scaler_bit_depth_set(struct dcss_soc *dcss, int ch_num,
				      int depth)
{
	u32 val;

	val = depth == 30 ? 2 : 0;

	dcss_scaler_write(dcss->scaler_priv, ch_num,
			  ((val << CHR_BIT_DEPTH_POS) & CHR_BIT_DEPTH_MASK) |
			  ((val << LUM_BIT_DEPTH_POS) & LUM_BIT_DEPTH_MASK),
			  DCSS_SCALER_BIT_DEPTH);
}

enum buffer_format {
	BUF_FMT_YUV420,
	BUF_FMT_YUV422,
	BUF_FMT_ARGB8888_YUV444,
};

enum chroma_location {
	PSC_LOC_HORZ_0_VERT_1_OVER_4 = 0,
	PSC_LOC_HORZ_1_OVER_4_VERT_1_OVER_4 = 1,
	PSC_LOC_HORZ_0_VERT_0 = 2,
	PSC_LOC_HORZ_1_OVER_4_VERT_0 = 3,
	PSC_LOC_HORZ_0_VERT_1_OVER_2 = 4,
	PSC_LOC_HORZ_1_OVER_4_VERT_1_OVER_2 = 5
};

static void dcss_scaler_format_set(struct dcss_soc *dcss, int ch_num,
				   enum buffer_format src_fmt,
				   enum buffer_format dst_fmt)
{
	dcss_scaler_write(dcss->scaler_priv, ch_num, src_fmt,
			  DCSS_SCALER_SRC_FORMAT);
	dcss_scaler_write(dcss->scaler_priv, ch_num, dst_fmt,
			  DCSS_SCALER_DST_FORMAT);
}

static void dcss_scaler_res_set(struct dcss_soc *dcss, int ch_num,
				int src_xres, int src_yres,
				int dst_xres, int dst_yres,
				u32 pix_format, enum buffer_format dst_format)
{
	u32 lsrc_xres, lsrc_yres, csrc_xres, csrc_yres;
	u32 ldst_xres, ldst_yres, cdst_xres, cdst_yres;
	bool src_is_444 = true;

	lsrc_xres = csrc_xres = src_xres;
	lsrc_yres = csrc_yres = src_yres;
	ldst_xres = cdst_xres = dst_xres;
	ldst_yres = cdst_yres = dst_yres;

	if (pix_format == DRM_FORMAT_UYVY || pix_format == DRM_FORMAT_VYUY ||
	    pix_format == DRM_FORMAT_YUYV || pix_format == DRM_FORMAT_YVYU) {
		csrc_xres >>= 1;
		src_is_444 = false;
	} else if (pix_format == DRM_FORMAT_NV12 ||
		   pix_format == DRM_FORMAT_NV21 ||
		   pix_format == DRM_FORMAT_P010) {
		csrc_xres >>= 1;
		csrc_yres >>= 1;
		src_is_444 = false;
	}

	if (dst_format == BUF_FMT_YUV422)
		cdst_xres >>= 1;

	/* for 4:4:4 to 4:2:2 conversion, source height should be 1 less */
	if (src_is_444 && dst_format == BUF_FMT_YUV422) {
		lsrc_yres--;
		csrc_yres--;
	}

	dcss_scaler_write(dcss->scaler_priv, ch_num,
			  (((lsrc_yres - 1) << HEIGHT_POS) & HEIGHT_MASK) |
			  (((lsrc_xres - 1) << WIDTH_POS) & WIDTH_MASK),
			  DCSS_SCALER_SRC_LUM_RES);
	dcss_scaler_write(dcss->scaler_priv, ch_num,
			  (((csrc_yres - 1) << HEIGHT_POS) & HEIGHT_MASK) |
			  (((csrc_xres - 1) << WIDTH_POS) & WIDTH_MASK),
			  DCSS_SCALER_SRC_CHR_RES);
	dcss_scaler_write(dcss->scaler_priv, ch_num,
			  (((ldst_yres - 1) << HEIGHT_POS) & HEIGHT_MASK) |
			  (((ldst_xres - 1) << WIDTH_POS) & WIDTH_MASK),
			  DCSS_SCALER_DST_LUM_RES);
	dcss_scaler_write(dcss->scaler_priv, ch_num,
			  (((cdst_yres - 1) << HEIGHT_POS) & HEIGHT_MASK) |
			  (((cdst_xres - 1) << WIDTH_POS) & WIDTH_MASK),
			  DCSS_SCALER_DST_CHR_RES);
}

#define max_downscale(ratio)		((ratio) << 13)
#define max_upscale(ratio)		((1 << 13) / (ratio))

struct dcss_scaler_ratios {
	u16 downscale;
	u16 upscale;
};

static const struct dcss_scaler_ratios dcss_scaler_ratios[] = {
	{max_downscale(3), max_upscale(8)},
	{max_downscale(5), max_upscale(8)},
	{max_downscale(5), max_upscale(8)},
};

static const struct dcss_scaler_ratios dcss_scaler_wrscl_ratios[] = {
	{max_downscale(5), max_upscale(8)},
	{max_downscale(7), max_upscale(8)},
	{max_downscale(7), max_upscale(8)},
};

static bool dcss_scaler_fractions_set(struct dcss_soc *dcss, int ch_num,
				      int src_xres, int src_yres,
				      int dst_xres, int dst_yres,
				      u32 src_format, u32 dst_format,
				      enum chroma_location src_chroma_loc)
{
	struct dcss_scaler_ch *ch = &dcss->scaler_priv->ch[ch_num];
	int src_c_xres, src_c_yres, dst_c_xres, dst_c_yres;
	u32 l_vinc, l_hinc, c_vinc, c_hinc;
	u32 c_vstart, c_hstart;

	src_c_xres = src_xres;
	src_c_yres = src_yres;
	dst_c_xres = dst_xres;
	dst_c_yres = dst_yres;

	c_vstart = 0;
	c_hstart = 0;

	/* adjustments for source chroma location */
	if (src_format == BUF_FMT_YUV420) {
		/* vertical input chroma position adjustment */
		switch (src_chroma_loc) {
		case PSC_LOC_HORZ_0_VERT_1_OVER_4:
		case PSC_LOC_HORZ_1_OVER_4_VERT_1_OVER_4:
			/*
			 * move chroma up to first luma line
			 * (1/4 chroma input line spacing)
			 */
			c_vstart -= (1 << (PSC_PHASE_FRACTION_BITS - 2));
			break;
		case PSC_LOC_HORZ_0_VERT_1_OVER_2:
		case PSC_LOC_HORZ_1_OVER_4_VERT_1_OVER_2:
			/*
			 * move chroma up to first luma line
			 * (1/2 chroma input line spacing)
			 */
			c_vstart -= (1 << (PSC_PHASE_FRACTION_BITS - 1));
			break;
		default:
			break;
		}
		/* horizontal input chroma position adjustment */
		switch (src_chroma_loc) {
		case PSC_LOC_HORZ_1_OVER_4_VERT_1_OVER_4:
		case PSC_LOC_HORZ_1_OVER_4_VERT_0:
		case PSC_LOC_HORZ_1_OVER_4_VERT_1_OVER_2:
			/* move chroma left 1/4 chroma input sample spacing */
			c_hstart -= (1 << (PSC_PHASE_FRACTION_BITS - 2));
			break;
		default:
			break;
		}
	}

	/* adjustments to chroma resolution */
	if (src_format == BUF_FMT_YUV420) {
		src_c_xres >>= 1;
		src_c_yres >>= 1;
	} else if (src_format == BUF_FMT_YUV422) {
		src_c_xres >>= 1;
	}

	if (dst_format == BUF_FMT_YUV422)
		dst_c_xres >>= 1;

	l_vinc = ((src_yres << 13) + (dst_yres >> 1)) / dst_yres;
	c_vinc = ((src_c_yres << 13) + (dst_c_yres >> 1)) / dst_c_yres;
	l_hinc = ((src_xres << 13) + (dst_xres >> 1)) / dst_xres;
	c_hinc = ((src_c_xres << 13) + (dst_c_xres >> 1)) / dst_c_xres;

	/* save chroma start phase */
	ch->c_vstart = c_vstart;
	ch->c_hstart = c_hstart;

	dcss_scaler_write(dcss->scaler_priv, ch_num, 0,
			  DCSS_SCALER_V_LUM_START);
	dcss_scaler_write(dcss->scaler_priv, ch_num, l_vinc,
			  DCSS_SCALER_V_LUM_INC);

	dcss_scaler_write(dcss->scaler_priv, ch_num, 0,
			  DCSS_SCALER_H_LUM_START);
	dcss_scaler_write(dcss->scaler_priv, ch_num, l_hinc,
			  DCSS_SCALER_H_LUM_INC);

	dcss_scaler_write(dcss->scaler_priv, ch_num, c_vstart,
			  DCSS_SCALER_V_CHR_START);
	dcss_scaler_write(dcss->scaler_priv, ch_num, c_vinc,
			  DCSS_SCALER_V_CHR_INC);

	dcss_scaler_write(dcss->scaler_priv, ch_num, c_hstart,
			  DCSS_SCALER_H_CHR_START);
	dcss_scaler_write(dcss->scaler_priv, ch_num, c_hinc,
			  DCSS_SCALER_H_CHR_INC);

	/* return if WR_SCL is needed to scale */
	return l_vinc > dcss_scaler_ratios[ch_num].downscale ||
	       l_vinc < dcss_scaler_ratios[ch_num].upscale   ||
	       l_hinc > dcss_scaler_ratios[ch_num].downscale ||
	       l_hinc < dcss_scaler_ratios[ch_num].upscale;
}

bool dcss_scaler_can_scale(struct dcss_soc *dcss, int ch_num,
			   int src_xres, int src_yres,
			   int dst_xres, int dst_yres)
{
	struct dcss_scaler_priv *scaler = dcss->scaler_priv;
	u32 vscale_fp, hscale_fp;
	const struct dcss_scaler_ratios *ratios_map = dcss_scaler_ratios;

	/* Convert to fixed point. Easier to work with. */
	vscale_fp = ((src_yres << 13) + (dst_yres >> 1)) / dst_yres;
	hscale_fp = ((src_xres << 13) + (dst_xres >> 1)) / dst_xres;

	if (scaler->ch_using_wrscl == -1 || scaler->ch_using_wrscl == ch_num)
		ratios_map = dcss_scaler_wrscl_ratios;

	return vscale_fp <= ratios_map[ch_num].downscale &&
	       vscale_fp >= ratios_map[ch_num].upscale &&
	       hscale_fp <= ratios_map[ch_num].downscale &&
	       hscale_fp >= ratios_map[ch_num].upscale;
}
EXPORT_SYMBOL(dcss_scaler_can_scale);

static void dcss_scaler_program_5_coef_set(struct dcss_soc *dcss, int ch_num,
					   int base_addr,
					   int coef[][PSC_NUM_TAPS])
{
	int i, phase;

	for (i = 0; i < PSC_STORED_PHASES; i++) {
		dcss_scaler_write(dcss->scaler_priv, ch_num,
				  ((coef[i][1] & 0xfff) << 16 |
				   (coef[i][2] & 0xfff) << 4  |
				   (coef[i][3] & 0xf00) >> 8),
				  base_addr + i * sizeof(u32));
		dcss_scaler_write(dcss->scaler_priv, ch_num,
				  ((coef[i][3] & 0x0ff) << 20 |
				   (coef[i][4] & 0xfff) << 8  |
				   (coef[i][5] & 0xff0) >> 4),
				  base_addr + 0x40 + i * sizeof(u32));
		dcss_scaler_write(dcss->scaler_priv, ch_num,
				  ((coef[i][5] & 0x00f) << 24),
				  base_addr + 0x80 + i * sizeof(u32));
	}

	/* reverse both phase and tap orderings */
	for (phase = (PSC_NUM_PHASES >> 1) - 1; i < PSC_NUM_PHASES; i++, phase--) {
		dcss_scaler_write(dcss->scaler_priv, ch_num,
				  ((coef[phase][5] & 0xfff) << 16 |
				   (coef[phase][4] & 0xfff) << 4  |
				   (coef[phase][3] & 0xf00) >> 8),
				  base_addr + i * sizeof(u32));
		dcss_scaler_write(dcss->scaler_priv, ch_num,
				  ((coef[phase][3] & 0x0ff) << 20 |
				   (coef[phase][2] & 0xfff) << 8  |
				   (coef[phase][1] & 0xff0) >> 4),
				  base_addr + 0x40 + i * sizeof(u32));
		dcss_scaler_write(dcss->scaler_priv, ch_num,
				  ((coef[phase][1] & 0x00f) << 24),
				  base_addr + 0x80 + i * sizeof(u32));
	}
}

static void dcss_scaler_program_7_coef_set(struct dcss_soc *dcss, int ch_num,
					   int base_addr,
					   int coef[][PSC_NUM_TAPS])
{
	int i, phase;

	for (i = 0; i < PSC_STORED_PHASES; i++) {
		dcss_scaler_write(dcss->scaler_priv, ch_num,
				  ((coef[i][0] & 0xfff) << 16 |
				   (coef[i][1] & 0xfff) << 4  |
				   (coef[i][2] & 0xf00) >> 8),
				  base_addr + i * sizeof(u32));
		dcss_scaler_write(dcss->scaler_priv, ch_num,
				  ((coef[i][2] & 0x0ff) << 20 |
				   (coef[i][3] & 0xfff) << 8  |
				   (coef[i][4] & 0xff0) >> 4),
				  base_addr + 0x40 + i * sizeof(u32));
		dcss_scaler_write(dcss->scaler_priv, ch_num,
				  ((coef[i][4] & 0x00f) << 24 |
				   (coef[i][5] & 0xfff) << 12 |
				   (coef[i][6] & 0xfff)),
				  base_addr + 0x80 + i * sizeof(u32));
	}

	/* reverse both phase and tap orderings */
	for (phase = (PSC_NUM_PHASES >> 1) - 1; i < PSC_NUM_PHASES; i++, phase--) {
		dcss_scaler_write(dcss->scaler_priv, ch_num,
				  ((coef[phase][6] & 0xfff) << 16 |
				   (coef[phase][5] & 0xfff) << 4  |
				   (coef[phase][4] & 0xf00) >> 8),
				  base_addr + i * sizeof(u32));
		dcss_scaler_write(dcss->scaler_priv, ch_num,
				  ((coef[phase][4] & 0x0ff) << 20 |
				   (coef[phase][3] & 0xfff) << 8  |
				   (coef[phase][2] & 0xff0) >> 4),
				  base_addr + 0x40 + i * sizeof(u32));
		dcss_scaler_write(dcss->scaler_priv, ch_num,
				  ((coef[phase][2] & 0x00f) << 24 |
				   (coef[phase][1] & 0xfff) << 12 |
				   (coef[phase][0] & 0xfff)),
				  base_addr + 0x80 + i * sizeof(u32));
	}
}

static void dcss_scaler_yuv_coef_set(struct dcss_soc *dcss, int ch_num,
				     enum buffer_format src_format,
				     enum buffer_format dst_format,
				     bool use_5_taps,
				     int src_xres, int src_yres, int dst_xres,
				     int dst_yres)
{
	struct dcss_scaler_ch *ch = &dcss->scaler_priv->ch[ch_num];
	int coef[PSC_STORED_PHASES][PSC_NUM_TAPS];
	bool program_5_taps = use_5_taps ||
			      (dst_format == BUF_FMT_YUV422 &&
			       src_format == BUF_FMT_ARGB8888_YUV444);

	/* horizontal luma */
	dcss_scaler_filter_design(src_xres, dst_xres, false,
				  src_xres == dst_xres, coef);
	dcss_scaler_program_7_coef_set(dcss, ch_num,
				       DCSS_SCALER_COEF_HLUM, coef);

	/* vertical luma */
	dcss_scaler_filter_design(src_yres, dst_yres, program_5_taps,
				  src_yres == dst_yres, coef);

	if (program_5_taps)
		dcss_scaler_program_5_coef_set(dcss, ch_num,
					       DCSS_SCALER_COEF_VLUM, coef);
	else
		dcss_scaler_program_7_coef_set(dcss, ch_num,
					       DCSS_SCALER_COEF_VLUM, coef);

	/* adjust chroma resolution */
	if (src_format != BUF_FMT_ARGB8888_YUV444)
		src_xres >>= 1;
	if (src_format == BUF_FMT_YUV420)
		src_yres >>= 1;
	if (dst_format != BUF_FMT_ARGB8888_YUV444)
		dst_xres >>= 1;
	if (dst_format == BUF_FMT_YUV420) /* should not happen */
		dst_yres >>= 1;

	/* horizontal chroma */
	dcss_scaler_filter_design(src_xres, dst_xres, false,
				  (src_xres == dst_xres) && (ch->c_hstart == 0),
				  coef);

	dcss_scaler_program_7_coef_set(dcss, ch_num,
				       DCSS_SCALER_COEF_HCHR, coef);

	/* vertical chroma */
	dcss_scaler_filter_design(src_yres, dst_yres, program_5_taps,
				  (src_yres == dst_yres) && (ch->c_vstart == 0),
				  coef);
	if (program_5_taps)
		dcss_scaler_program_5_coef_set(dcss, ch_num,
					       DCSS_SCALER_COEF_VCHR, coef);
	else
		dcss_scaler_program_7_coef_set(dcss, ch_num,
					       DCSS_SCALER_COEF_VCHR, coef);
}

static void dcss_scaler_rgb_coef_set(struct dcss_soc *dcss, int ch_num,
				     int src_xres, int src_yres, int dst_xres,
				     int dst_yres)
{
	int coef[PSC_STORED_PHASES][PSC_NUM_TAPS];

	/* horizontal RGB */
	dcss_scaler_filter_design(src_xres, dst_xres, false,
				  src_xres == dst_xres, coef);
	dcss_scaler_program_7_coef_set(dcss, ch_num,
				       DCSS_SCALER_COEF_HLUM, coef);

	/* vertical RGB */
	dcss_scaler_filter_design(src_yres, dst_yres, false,
				  src_yres == dst_yres, coef);
	dcss_scaler_program_7_coef_set(dcss, ch_num,
				       DCSS_SCALER_COEF_VLUM, coef);
}

static void dcss_scaler_set_rgb10_order(struct dcss_soc *dcss, int ch_num,
					u32 pix_format)
{
	struct dcss_scaler_ch *ch = &dcss->scaler_priv->ch[ch_num];
	enum dcss_color_space dcss_cs;
	const struct drm_format_info *format;
	unsigned int pixel_depth;
	u32 a2r10g10b10_format;

	dcss_cs = dcss_drm_fourcc_to_colorspace(pix_format);

	if (dcss_cs != DCSS_COLORSPACE_RGB)
		return;

	format = drm_format_info(pix_format);
	pixel_depth = format->depth;

	ch->sdata_ctrl &= ~A2R10G10B10_FORMAT_MASK;

	if (pixel_depth != 30)
		return;

	switch (pix_format) {
	case DRM_FORMAT_ARGB2101010:
	case DRM_FORMAT_XRGB2101010:
		a2r10g10b10_format = 0;
		break;

	case DRM_FORMAT_ABGR2101010:
	case DRM_FORMAT_XBGR2101010:
		a2r10g10b10_format = 5;
		break;

	case DRM_FORMAT_RGBA1010102:
	case DRM_FORMAT_RGBX1010102:
		a2r10g10b10_format = 6;
		break;

	case DRM_FORMAT_BGRA1010102:
	case DRM_FORMAT_BGRX1010102:
		a2r10g10b10_format = 11;
		break;

	default:
		a2r10g10b10_format = 0;
		break;
	}

	ch->sdata_ctrl |= a2r10g10b10_format << A2R10G10B10_FORMAT_POS;
}

static void dcss_scaler_setup_path(struct dcss_soc *dcss, int ch_num,
				   u32 pix_format, int dst_xres,
				   int dst_yres, u32 vrefresh_hz,
				   bool wrscl_needed)
{
	struct dcss_scaler_priv *scaler = dcss->scaler_priv;
	u32 base_addr;

	/* nothing to do if WRSCL path is needed but it's already used */
	if (wrscl_needed && scaler->ch_using_wrscl != -1 &&
	    scaler->ch_using_wrscl != ch_num)
		return;

	if (!wrscl_needed) {
		/* Channel has finished using WRSCL. Release WRSCL/RDSRC. */
		if (scaler->ch_using_wrscl == ch_num) {
			dcss_wrscl_enable(dcss, false);
			dcss_rdsrc_enable(dcss, false);

			scaler->ch_using_wrscl = -1;
		}

		return;
	}

	base_addr = dcss_wrscl_setup(dcss, pix_format, vrefresh_hz,
				     dst_xres, dst_yres);

	dcss_rdsrc_setup(dcss, pix_format, dst_xres, dst_yres,
			 base_addr);

	dcss_wrscl_enable(dcss, true);
	dcss_rdsrc_enable(dcss, true);

	scaler->ch_using_wrscl = ch_num;
}

void dcss_scaler_setup(struct dcss_soc *dcss, int ch_num, u32 pix_format,
		       int src_xres, int src_yres, int dst_xres, int dst_yres,
		       u32 vrefresh_hz)
{
	enum dcss_color_space dcss_cs;
	int planes;
	const struct drm_format_info *format;
	unsigned int pixel_depth = 0;
	bool rtr_8line_en = false;
	bool use_5_taps = false;
	enum buffer_format src_format = BUF_FMT_ARGB8888_YUV444;
	enum buffer_format dst_format = BUF_FMT_ARGB8888_YUV444;
	bool wrscl_needed = false;

	dcss_cs = dcss_drm_fourcc_to_colorspace(pix_format);
	planes = drm_format_num_planes(pix_format);

	if (dcss_cs == DCSS_COLORSPACE_YUV) {
		dcss_scaler_yuv_enable(dcss, ch_num, true);

		if (pix_format == DRM_FORMAT_NV12 ||
		    pix_format == DRM_FORMAT_NV21 ||
		    pix_format == DRM_FORMAT_P010) {
			rtr_8line_en = true;
			src_format = BUF_FMT_YUV420;
		} else if (pix_format == DRM_FORMAT_UYVY ||
			   pix_format == DRM_FORMAT_VYUY ||
			   pix_format == DRM_FORMAT_YUYV ||
			   pix_format == DRM_FORMAT_YVYU) {
			src_format = BUF_FMT_YUV422;
		}

		use_5_taps = !rtr_8line_en;
		if (pix_format == DRM_FORMAT_P010)
			pixel_depth = 30;

	} else if (dcss_cs == DCSS_COLORSPACE_RGB) {
		dcss_scaler_yuv_enable(dcss, ch_num, false);

		format = drm_format_info(pix_format);
		pixel_depth = format->depth;
	}

	/* TODO: get src_chroma_loc from VPU metadata */
	wrscl_needed = dcss_scaler_fractions_set(dcss, ch_num, src_xres,
						 src_yres, dst_xres,
						 dst_yres, src_format,
						 dst_format,
						 0 /* src_chroma_loc */);

	if (dcss_cs == DCSS_COLORSPACE_YUV) {
		dcss_scaler_yuv_coef_set(dcss, ch_num, src_format, dst_format,
					 use_5_taps, src_xres, src_yres,
					 dst_xres, dst_yres);
	} else if (dcss_cs == DCSS_COLORSPACE_RGB) {
		dcss_scaler_rgb_coef_set(dcss, ch_num, src_xres, src_yres,
					 dst_xres, dst_yres);
	}

	dcss_scaler_rtr_8lines_enable(dcss, ch_num, rtr_8line_en);
	dcss_scaler_bit_depth_set(dcss, ch_num, pixel_depth);
	dcss_scaler_set_rgb10_order(dcss, ch_num, pix_format);
	dcss_scaler_format_set(dcss, ch_num, src_format, dst_format);
	dcss_scaler_res_set(dcss, ch_num, src_xres, src_yres,
			    dst_xres, dst_yres, pix_format, dst_format);

	dcss_scaler_setup_path(dcss, ch_num, pix_format, dst_xres,
			       dst_yres, vrefresh_hz, wrscl_needed);
}
EXPORT_SYMBOL(dcss_scaler_setup);

void dcss_scaler_write_sclctrl(struct dcss_soc *dcss)
{
	int chnum;

	for (chnum = 0; chnum < 3; chnum++) {
		struct dcss_scaler_ch *ch = &dcss->scaler_priv->ch[chnum];

		if (ch->scaler_ctrl_chgd) {
			dcss_ctxld_write_irqsafe(dcss, ch->ctx_id,
						 ch->scaler_ctrl,
					ch->base_ofs + DCSS_SCALER_CTRL);
			ch->scaler_ctrl_chgd = false;
		}
	}
}
