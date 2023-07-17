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

#ifndef __DRM_DPU_H__
#define __DRM_DPU_H__

#include <drm/drm_crtc.h>
#include <drm/drm_modes.h>
#include <video/imx8-prefetch.h>
#include <video/videomode.h>

struct dpu_soc;

enum dpu_irq {
	IRQ_STORE9_SHDLOAD		= 0,
	IRQ_STORE9_FRAMECOMPLETE	= 1,
	IRQ_STORE9_SEQCOMPLETE		= 2,
	IRQ_EXTDST0_SHDLOAD		= 3,
	IRQ_EXTDST0_FRAMECOMPLETE	= 4,
	IRQ_EXTDST0_SEQCOMPLETE		= 5,
	IRQ_EXTDST4_SHDLOAD		= 6,
	IRQ_EXTDST4_FRAMECOMPLETE	= 7,
	IRQ_EXTDST4_SEQCOMPLETE		= 8,
	IRQ_EXTDST1_SHDLOAD		= 9,
	IRQ_EXTDST1_FRAMECOMPLETE	= 10,
	IRQ_EXTDST1_SEQCOMPLETE		= 11,
	IRQ_EXTDST5_SHDLOAD		= 12,
	IRQ_EXTDST5_FRAMECOMPLETE	= 13,
	IRQ_EXTDST5_SEQCOMPLETE		= 14,
	IRQ_STORE4_SHDLOAD		= 15,
	IRQ_STORE4_FRAMECOMPLETE	= 16,
	IRQ_STORE4_SEQCOMPLETE		= 17,
	IRQ_STORE5_SHDLOAD		= 18,
	IRQ_STORE5_FRAMECOMPLETE	= 19,
	IRQ_STORE5_SEQCOMPLETE		= 20,
	IRQ_RESERVED21			= 21,
	IRQ_HISTOGRAM4_VALID		= 22,
	IRQ_RESERVED23			= 23,
	IRQ_HISTOGRAM5_VALID		= 24,
	IRQ_FRAMEDUMP0_ERROR		= 25,
	IRQ_FRAMEDUMP1_ERROR		= 26,
	IRQ_DISENGCFG_SHDLOAD0		= 27,
	IRQ_DISENGCFG_FRAMECOMPLETE0	= 28,
	IRQ_DISENGCFG_SEQCOMPLETE0	= 29,
	IRQ_FRAMEGEN0_INT0		= 30,
	IRQ_FRAMEGEN0_INT1		= 31,
	IRQ_FRAMEGEN0_INT2		= 32,
	IRQ_FRAMEGEN0_INT3		= 33,
	IRQ_SIG0_SHDLOAD		= 34,
	IRQ_SIG0_VALID			= 35,
	IRQ_SIG0_ERROR			= 36,
	IRQ_DISENGCFG_SHDLOAD1		= 37,
	IRQ_DISENGCFG_FRAMECOMPLETE1	= 38,
	IRQ_DISENGCFG_SEQCOMPLETE1	= 39,
	IRQ_FRAMEGEN1_INT0		= 40,
	IRQ_FRAMEGEN1_INT1		= 41,
	IRQ_FRAMEGEN1_INT2		= 42,
	IRQ_FRAMEGEN1_INT3		= 43,
	IRQ_SIG1_SHDLOAD		= 44,
	IRQ_SIG1_VALID			= 45,
	IRQ_SIG1_ERROR			= 46,
	IRQ_ITUIFC4_ERROR		= 47,
	IRQ_ITUIFC5_ERROR		= 48,
	IRQ_RESERVED49			= 49,
	IRQ_CMDSEQ_ERROR		= 50,
	IRQ_COMCTRL_SW0			= 51,
	IRQ_COMCTRL_SW1			= 52,
	IRQ_COMCTRL_SW2			= 53,
	IRQ_COMCTRL_SW3			= 54,
	IRQ_FRAMEGEN0_PRIMSYNC_ON	= 55,
	IRQ_FRAMEGEN0_PRIMSYNC_OFF	= 56,
	IRQ_FRAMEGEN0_SECSYNC_ON	= 57,
	IRQ_FRAMEGEN0_SECSYNC_OFF	= 58,
	IRQ_FRAMEGEN1_PRIMSYNC_ON	= 59,
	IRQ_FRAMEGEN1_PRIMSYNC_OFF	= 60,
	IRQ_FRAMEGEN1_SECSYNC_ON	= 61,
	IRQ_FRAMEGEN1_SECSYNC_OFF	= 62,
	IRQ_FRAMECAP4_SYNC_ON		= 63,
	IRQ_FRAMECAP4_SYNC_OFF		= 64,
	IRQ_CMD				= 65,
	IRQ_FRAMECAP5_SYNC_OFF		= 66,
};

typedef enum {
	ID_NONE		= 0x00,	/*  0 */
	/* pixel engines */
	ID_FETCHDECODE9	= 0x01,	/*  1 */
	ID_FETCHPERSP9	= 0x02,	/*  2 */
	ID_FETCHECO9	= 0x03,	/*  3 */
	ID_ROP9		= 0x04,	/*  4 */
	ID_CLUT9	= 0x05,	/*  5 */
	ID_MATRIX9	= 0x06,	/*  6 */
	ID_HSCALER9	= 0x07,	/*  7 */
	ID_VSCALER9	= 0x08,	/*  8 */
	ID_FILTER9	= 0x09,	/*  9 */
	ID_BLITBLEND9	= 0x0A,	/* 10 */
	ID_STORE9	= 0x0B,	/* 11 */
	ID_CONSTFRAME0	= 0x0C,	/* 12 */
	ID_EXTDST0	= 0x0D,	/* 13 */
	ID_CONSTFRAME4	= 0x0E,	/* 14 */
	ID_EXTDST4	= 0x0F,	/* 15 */
	ID_CONSTFRAME1	= 0x10,	/* 16 */
	ID_EXTDST1	= 0x11,	/* 17 */
	ID_CONSTFRAME5	= 0x12,	/* 18 */
	ID_EXTDST5	= 0x13,	/* 19 */
	ID_EXTSRC4	= 0x14,	/* 20 */
	ID_STORE4	= 0x15,	/* 21 */
	ID_EXTSRC5	= 0x16,	/* 22 */
	ID_STORE5	= 0x17,	/* 23 */
	ID_FETCHDECODE2	= 0x18,	/* 24 */
	ID_FETCHDECODE3	= 0x19,	/* 25 */
	ID_FETCHWARP2	= 0x1A,	/* 26 */
	ID_FETCHECO2	= 0x1B,	/* 27 */
	ID_FETCHDECODE0	= 0x1C,	/* 28 */
	ID_FETCHECO0	= 0x1D,	/* 29 */
	ID_FETCHDECODE1	= 0x1E,	/* 30 */
	ID_FETCHECO1	= 0x1F,	/* 31 */
	ID_FETCHLAYER0	= 0x20,	/* 32 */
	ID_FETCHLAYER1	= 0x21,	/* 33 */
	ID_GAMMACOR4	= 0x22,	/* 34 */
	ID_MATRIX4	= 0x23,	/* 35 */
	ID_HSCALER4	= 0x24,	/* 36 */
	ID_VSCALER4	= 0x25,	/* 37 */
	ID_HISTOGRAM4	= 0x26,	/* 38 */
	ID_GAMMACOR5	= 0x27,	/* 39 */
	ID_MATRIX5	= 0x28,	/* 40 */
	ID_HSCALER5	= 0x29,	/* 41 */
	ID_VSCALER5	= 0x2A,	/* 42 */
	ID_HISTOGRAM5	= 0x2B,	/* 43 */
	ID_LAYERBLEND0	= 0x2C,	/* 44 */
	ID_LAYERBLEND1	= 0x2D,	/* 45 */
	ID_LAYERBLEND2	= 0x2E,	/* 46 */
	ID_LAYERBLEND3	= 0x2F,	/* 47 */
	ID_LAYERBLEND4	= 0x30,	/* 48 */
	ID_LAYERBLEND5	= 0x31,	/* 49 */
	ID_LAYERBLEND6	= 0x32,	/* 50 */
	ID_EXTSRC0	= 0x33,	/* 51 */
	ID_EXTSRC1	= 0x34,	/* 52 */
	/* display engines */
	ID_DISENGCFG	= 0x35,	/* 53 */
	ID_FRAMEGEN0	= 0x36,	/* 54 */
	ID_MATRIX0	= 0x37,	/* 55 */
	ID_GAMMACOR0	= 0x38,	/* 56 */
	ID_DITHER0	= 0x39,	/* 57 */
	ID_TCON0	= 0x3A,	/* 58 */
	ID_SIG0		= 0x3B,	/* 59 */
	ID_FRAMEGEN1	= 0x3C,	/* 60 */
	ID_MATRIX1	= 0x3D,	/* 61 */
	ID_GAMMACOR1	= 0x3E,	/* 62 */
	ID_DITHER1	= 0x3F,	/* 63 */
	ID_TCON1	= 0x40,	/* 64 */
	ID_SIG1		= 0x41,	/* 65 */
	ID_FRAMECAP4	= 0x42,	/* 66 */
	ID_FRAMECAP5	= 0x43,	/* 67 */
} dpu_block_id_t;

typedef enum {
	DEC_SIG_SEL_FRAMEGEN = 0,
	DEC_SIG_SEL_GAMMACOR,
	DEC_SIG_SEL_MATRIX,
	DEC_SIG_SEL_DITHER,
} dec_sig_sel_t;

typedef enum {
	ED_SRC_DISABLE		= ID_NONE,
	ED_SRC_BLITBLEND9	= ID_BLITBLEND9,
	ED_SRC_CONSTFRAME0	= ID_CONSTFRAME0,
	ED_SRC_CONSTFRAME1	= ID_CONSTFRAME1,
	ED_SRC_CONSTFRAME4	= ID_CONSTFRAME4,
	ED_SRC_CONSTFRAME5	= ID_CONSTFRAME5,
	ED_SRC_MATRIX4		= ID_MATRIX4,
	ED_SRC_HSCALER4		= ID_HSCALER4,
	ED_SRC_VSCALER4		= ID_VSCALER4,
	/* content stream(extdst 0/1) only */
	ED_SRC_EXTSRC4		= ID_EXTSRC4,
	ED_SRC_MATRIX5		= ID_MATRIX5,
	ED_SRC_HSCALER5		= ID_HSCALER5,
	ED_SRC_VSCALER5		= ID_VSCALER5,
	/* content stream(extdst 0/1) only */
	ED_SRC_EXTSRC5		= ID_EXTSRC5,
	ED_SRC_LAYERBLEND6	= ID_LAYERBLEND6,
	ED_SRC_LAYERBLEND5	= ID_LAYERBLEND5,
	ED_SRC_LAYERBLEND4	= ID_LAYERBLEND4,
	ED_SRC_LAYERBLEND3	= ID_LAYERBLEND3,
	ED_SRC_LAYERBLEND2	= ID_LAYERBLEND2,
	ED_SRC_LAYERBLEND1	= ID_LAYERBLEND1,
	ED_SRC_LAYERBLEND0	= ID_LAYERBLEND0,
} extdst_src_sel_t;

typedef enum {
	SINGLE,	/* Reconfig pipeline after explicit trigger */
	AUTO,	/* Reconfig pipeline after every kick when idle */
} ed_sync_mode_t;

typedef enum {
	PSTATUS_EMPTY,
	PSTATUS_RUNNING,
	PSTATUS_RUNNING_RETRIGGERED,
	PSTATUS_RESERVED
} ed_pipeline_status_t;

typedef enum {
	SOFTWARE = 0,		/* kick generation by KICK field only */
	EXTERNAL = BIT(8),	/* kick signal from external allowed */
} ed_kick_mode_t;

typedef enum {
	SHLDREQID_FETCHDECODE9	= BIT(1),
	SHLDREQID_FETCHPERSP9	= BIT(2),
	SHLDREQID_FETCHECO9	= BIT(3),
	SHLDREQID_CONSTFRAME0	= BIT(4),
	SHLDREQID_CONSTFRAME4	= BIT(5),
	SHLDREQID_CONSTFRAME1	= BIT(6),
	SHLDREQID_CONSTFRAME5	= BIT(7),
	SHLDREQID_EXTSRC4	= BIT(8),
	SHLDREQID_EXTSRC5	= BIT(9),
	SHLDREQID_FETCHDECODE2	= BIT(10),
	SHLDREQID_FETCHDECODE3	= BIT(11),
	SHLDREQID_FETCHWARP2	= BIT(12),
	SHLDREQID_FETCHECO2	= BIT(13),
	SHLDREQID_FETCHDECODE0	= BIT(14),
	SHLDREQID_FETCHECO0	= BIT(15),
	SHLDREQID_FETCHDECODE1	= BIT(16),
	SHLDREQID_FETCHECO1	= BIT(17),
	SHLDREQID_FETCHLAYER0	= BIT(18),
	SHLDREQID_FETCHLAYER1	= BIT(19),
	SHLDREQID_EXTSRC0	= BIT(20),
	SHLDREQID_EXTSRC1	= BIT(21),
} shadow_load_req_t;

typedef enum {
	PIXENGCFG_STATUS_SEL_DISABLE,
	PIXENGCFG_STATUS_SEL_STORE9,
	PIXENGCFG_STATUS_SEL_EXTDST0,
	PIXENGCFG_STATUS_SEL_EXTDST4,
	PIXENGCFG_STATUS_SEL_EXTDST1,
	PIXENGCFG_STATUS_SEL_EXTDST5,
	PIXENGCFG_STATUS_SEL_STORE4,
	PIXENGCFG_STATUS_SEL_STORE5,
} pixengcfg_status_sel_t;

typedef enum {
	FD_SRC_DISABLE		= ID_NONE,
	FD_SRC_FETCHECO0	= ID_FETCHECO0,
	FD_SRC_FETCHECO1	= ID_FETCHECO1,
	FD_SRC_FETCHECO2	= ID_FETCHECO2,
	FD_SRC_FETCHDECODE0	= ID_FETCHDECODE0,
	FD_SRC_FETCHDECODE1	= ID_FETCHDECODE1,
	FD_SRC_FETCHDECODE2	= ID_FETCHDECODE2,
	FD_SRC_FETCHDECODE3	= ID_FETCHDECODE3,
	FD_SRC_FETCHWARP2	= ID_FETCHWARP2,
} fd_dynamic_src_sel_t;

typedef enum {
	/* RL and RLAD decoder */
	FETCHTYPE__DECODE,
	/* fractional plane(8 layers) */
	FETCHTYPE__LAYER,
	/* arbitrary warping and fractional plane(8 layers) */
	FETCHTYPE__WARP,
	/* minimum feature set for alpha, chroma and coordinate planes */
	FETCHTYPE__ECO,
	/* affine, perspective and arbitrary warping */
	FETCHTYPE__PERSP,
	/* affine and arbitrary warping */
	FETCHTYPE__ROT,
	/* RL and RLAD decoder, reduced feature set */
	FETCHTYPE__DECODEL,
	/* fractional plane(8 layers), reduced feature set */
	FETCHTYPE__LAYERL,
	/* affine and arbitrary warping, reduced feature set */
	FETCHTYPE__ROTL,
} fetchtype_t;

typedef enum {
	/* No side-by-side synchronization. */
	FGSYNCMODE__OFF = 0,
	/* Framegen is master. */
	FGSYNCMODE__MASTER = 1 << 1,
	/* Runs in cyclic synchronization mode. */
	FGSYNCMODE__SLAVE_CYC = 2 << 1,
	/* Runs in one time synchronization mode. */
	FGSYNCMODE__SLAVE_ONCE = 3 << 1,
} fgsyncmode_t;

typedef enum {
	FGDM__BLACK,
	/* Constant Color Background is shown. */
	FGDM__CONSTCOL,
	FGDM__PRIM,
	FGDM__SEC,
	FGDM__PRIM_ON_TOP,
	FGDM__SEC_ON_TOP,
	/* White color background with test pattern is shown. */
	FGDM__TEST,
} fgdm_t;

typedef enum {
	HS_SRC_SEL__DISABLE		= ID_NONE,
	HS_SRC_SEL__MATRIX9		= ID_MATRIX9,
	HS_SRC_SEL__VSCALER9		= ID_VSCALER9,
	HS_SRC_SEL__FILTER9		= ID_FILTER9,
	HS_SRC_SEL__EXTSRC4		= ID_EXTSRC4,
	HS_SRC_SEL__EXTSRC5		= ID_EXTSRC5,
	HS_SRC_SEL__FETCHDECODE2	= ID_FETCHDECODE2,
	HS_SRC_SEL__FETCHDECODE3	= ID_FETCHDECODE3,
	HS_SRC_SEL__FETCHDECODE0	= ID_FETCHDECODE0,
	HS_SRC_SEL__FETCHDECODE1	= ID_FETCHDECODE1,
	HS_SRC_SEL__MATRIX4		= ID_MATRIX4,
	HS_SRC_SEL__VSCALER4		= ID_VSCALER4,
	HS_SRC_SEL__MATRIX5		= ID_MATRIX5,
	HS_SRC_SEL__VSCALER5		= ID_VSCALER5,
} hs_src_sel_t;

typedef enum {
	/* common options */
	LB_PRIM_SEL__DISABLE		= ID_NONE,
	LB_PRIM_SEL__BLITBLEND9		= ID_BLITBLEND9,
	LB_PRIM_SEL__CONSTFRAME0	= ID_CONSTFRAME0,
	LB_PRIM_SEL__CONSTFRAME1	= ID_CONSTFRAME1,
	LB_PRIM_SEL__CONSTFRAME4	= ID_CONSTFRAME4,
	LB_PRIM_SEL__CONSTFRAME5	= ID_CONSTFRAME5,
	LB_PRIM_SEL__MATRIX4		= ID_MATRIX4,
	LB_PRIM_SEL__HSCALER4		= ID_HSCALER4,
	LB_PRIM_SEL__VSCALER4		= ID_VSCALER4,
	LB_PRIM_SEL__EXTSRC4		= ID_EXTSRC4,
	LB_PRIM_SEL__MATRIX5		= ID_MATRIX5,
	LB_PRIM_SEL__HSCALER5		= ID_HSCALER5,
	LB_PRIM_SEL__VSCALER5		= ID_VSCALER5,
	LB_PRIM_SEL__EXTSRC5		= ID_EXTSRC5,
	/*
	 * special options:
	 * layerblend(n) has n special options,
	 * from layerblend0 to layerblend(n - 1), e.g.,
	 * layerblend4 has 4 special options -
	 * layerblend0/1/2/3.
	 */
	LB_PRIM_SEL__LAYERBLEND5	= ID_LAYERBLEND5,
	LB_PRIM_SEL__LAYERBLEND4	= ID_LAYERBLEND4,
	LB_PRIM_SEL__LAYERBLEND3	= ID_LAYERBLEND3,
	LB_PRIM_SEL__LAYERBLEND2	= ID_LAYERBLEND2,
	LB_PRIM_SEL__LAYERBLEND1	= ID_LAYERBLEND1,
	LB_PRIM_SEL__LAYERBLEND0	= ID_LAYERBLEND0,
} lb_prim_sel_t;

typedef enum {
	LB_SEC_SEL__DISABLE		= ID_NONE,
	LB_SEC_SEL__FETCHDECODE2	= ID_FETCHDECODE2,
	LB_SEC_SEL__FETCHDECODE3	= ID_FETCHDECODE3,
	LB_SEC_SEL__FETCHWARP2		= ID_FETCHWARP2,
	LB_SEC_SEL__FETCHDECODE0	= ID_FETCHDECODE0,
	LB_SEC_SEL__FETCHDECODE1	= ID_FETCHDECODE1,
	LB_SEC_SEL__MATRIX4		= ID_MATRIX4,
	LB_SEC_SEL__HSCALER4		= ID_HSCALER4,
	LB_SEC_SEL__VSCALER4		= ID_VSCALER4,
	LB_SEC_SEL__MATRIX5		= ID_MATRIX5,
	LB_SEC_SEL__HSCALER5		= ID_HSCALER5,
	LB_SEC_SEL__VSCALER5		= ID_VSCALER5,
	LB_SEC_SEL__FETCHLAYER0		= ID_FETCHLAYER0,
	LB_SEC_SEL__FETCHLAYER1		= ID_FETCHLAYER1,
} lb_sec_sel_t;

typedef enum {
	PRIMARY,	/* background plane */
	SECONDARY,	/* foreground plane */
	BOTH,
} lb_shadow_sel_t;

typedef enum {
	LB_NEUTRAL,	/* Output is same as primary input. */
	LB_BLEND,
} lb_mode_t;

typedef enum {
	/* Constant 0 indicates frame or top field. */
	SCALER_ALWAYS0 = 0x0,
	/* Constant 1 indicates bottom field. */
	SCALER_ALWAYS1 = 0x1 << 12,
	/* Output field polarity is taken from input field polarity. */
	SCALER_INPUT = 0x2 << 12,
	/* Output field polarity toggles, starting with 0 after reset. */
	SCALER_TOGGLE = 0x3 << 12,
} scaler_field_mode_t;

typedef enum {
	/* pointer-sampling */
	SCALER_NEAREST = 0x0,
	/* box filter */
	SCALER_LINEAR = 0x100,
} scaler_filter_mode_t;

typedef enum {
	SCALER_DOWNSCALE = 0x0,
	SCALER_UPSCALE = 0x10,
} scaler_scale_mode_t;

typedef enum {
	/* Pixel by-pass the scaler, all other settings are ignored. */
	SCALER_NEUTRAL = 0x0,
	/* Scaler is active. */
	SCALER_ACTIVE = 0x1,
} scaler_mode_t;

typedef enum {
	VS_SRC_SEL__DISABLE		= ID_NONE,
	VS_SRC_SEL__MATRIX9		= ID_MATRIX9,
	VS_SRC_SEL__HSCALER9		= ID_HSCALER9,
	VS_SRC_SEL__EXTSRC4		= ID_EXTSRC4,
	VS_SRC_SEL__EXTSRC5		= ID_EXTSRC5,
	VS_SRC_SEL__FETCHDECODE2	= ID_FETCHDECODE2,
	VS_SRC_SEL__FETCHDECODE3	= ID_FETCHDECODE3,
	VS_SRC_SEL__FETCHDECODE0	= ID_FETCHDECODE0,
	VS_SRC_SEL__FETCHDECODE1	= ID_FETCHDECODE1,
	VS_SRC_SEL__MATRIX4		= ID_MATRIX4,
	VS_SRC_SEL__HSCALER4		= ID_HSCALER4,
	VS_SRC_SEL__MATRIX5		= ID_MATRIX5,
	VS_SRC_SEL__HSCALER5		= ID_HSCALER5,
} vs_src_sel_t;

#define CLKEN_MASK		(0x3 << 24)
#define CLKEN_MASK_SHIFT	24
typedef enum {
	CLKEN__DISABLE = 0x0,
	CLKEN__AUTOMATIC = 0x1,
	CLKEN__FULL = 0x3,
} pixengcfg_clken_t;

/* fetch unit types */
enum {
	FU_T_NA,
	FU_T_FD,
	FU_T_FE,
	FU_T_FL,
	FU_T_FW,
};

enum dpu_crc_source {
	DPU_CRC_SRC_NONE,
	DPU_CRC_SRC_FRAMEGEN,
	DPU_CRC_SRC_FRAMEGEN_ROI,
};

struct dpu_fetchunit;

struct dpu_fetchunit_ops {
	void (*set_burstlength)(struct dpu_fetchunit *fu,
				unsigned int x_offset, unsigned int mt_w,
				int bpp, dma_addr_t baddr, bool use_prefetch);

	void (*set_baseaddress)(struct dpu_fetchunit *fu, unsigned int width,
				unsigned int x_offset, unsigned int y_offset,
				unsigned int mt_w, unsigned int mt_h,
				int bpp, dma_addr_t baddr);

	void (*set_src_bpp)(struct dpu_fetchunit *fu, int bpp);

	void (*set_src_stride)(struct dpu_fetchunit *fu,
			       unsigned int width, unsigned int x_offset,
			       unsigned int mt_w, int bpp, unsigned int stride,
			       dma_addr_t baddr, bool use_prefetch);

	void (*set_src_buf_dimensions)(struct dpu_fetchunit *fu,
				       unsigned int w, unsigned int h, u32 fmt,
				       bool deinterlace);

	void (*set_fmt)(struct dpu_fetchunit *fu, u32 fmt,
			enum drm_color_encoding color_encoding,
			enum drm_color_range color_range,
			bool deinterlace);

	void (*set_pixel_blend_mode)(struct dpu_fetchunit *fu,
				     unsigned int pixel_blend_mode, u16 alpha,
				     u32 fb_format);

	void (*enable_src_buf)(struct dpu_fetchunit *fu);
	void (*disable_src_buf)(struct dpu_fetchunit *fu);
	bool (*is_enabled)(struct dpu_fetchunit *fu);

	void (*set_framedimensions)(struct dpu_fetchunit *fu,
				    unsigned int w, unsigned int h,
				    bool deinterlace);

	void (*set_controltrigger)(struct dpu_fetchunit *fu);

	unsigned int (*get_stream_id)(struct dpu_fetchunit *fu);
	void (*set_stream_id)(struct dpu_fetchunit *fu, unsigned int id);
};

struct dpu_fetchunit {
	void __iomem *pec_base;
	void __iomem *base;
	char *name;
	struct mutex mutex;
	int id;
	int sub_id;	/* for fractional fetch units */
	int type;
	bool inuse;
	struct dpu_soc *dpu;
	/* see DPU_PLANE_SRC_xxx */
	unsigned int stream_id;
	struct dprc *dprc;
	const struct dpu_fetchunit_ops *ops;
};

int dpu_map_inner_irq(struct dpu_soc *dpu, int irq);

/* Constant Frame Unit */
struct dpu_constframe;
void constframe_shden(struct dpu_constframe *cf, bool enable);
void constframe_framedimensions(struct dpu_constframe *cf, unsigned int w,
				unsigned int h);
void constframe_constantcolor(struct dpu_constframe *cf, unsigned int r,
			      unsigned int g, unsigned int b, unsigned int a);
void constframe_controltrigger(struct dpu_constframe *cf, bool trigger);
shadow_load_req_t constframe_to_shdldreq_t(struct dpu_constframe *cf);
struct dpu_constframe *dpu_cf_get(struct dpu_soc *dpu, int id);
void dpu_cf_put(struct dpu_constframe *cf);
struct dpu_constframe *dpu_aux_cf_peek(struct dpu_constframe *cf);

/* Display Engine Configuration Unit */
struct dpu_disengcfg;
void disengcfg_polarity_ctrl(struct dpu_disengcfg *dec, unsigned int flags);
void disengcfg_sig_select(struct dpu_disengcfg *dec, dec_sig_sel_t sig_sel);
struct dpu_disengcfg *dpu_dec_get(struct dpu_soc *dpu, int id);
void dpu_dec_put(struct dpu_disengcfg *dec);
struct dpu_disengcfg *dpu_aux_dec_peek(struct dpu_disengcfg *dec);

/* External Destination Unit */
struct dpu_extdst;
void extdst_pixengcfg_shden(struct dpu_extdst *ed, bool enable);
void extdst_pixengcfg_powerdown(struct dpu_extdst *ed, bool powerdown);
void extdst_pixengcfg_sync_mode(struct dpu_extdst *ed, ed_sync_mode_t mode);
void extdst_pixengcfg_reset(struct dpu_extdst *ed, bool reset);
void extdst_pixengcfg_div(struct dpu_extdst *ed, u16 div);
void extdst_pixengcfg_syncmode_master(struct dpu_extdst *ed, bool enable);
int extdst_pixengcfg_src_sel(struct dpu_extdst *ed, extdst_src_sel_t src);
void extdst_pixengcfg_sel_shdldreq(struct dpu_extdst *ed);
void extdst_pixengcfg_shdldreq(struct dpu_extdst *ed, u32 req_mask);
void extdst_pixengcfg_sync_trigger(struct dpu_extdst *ed);
void extdst_pixengcfg_trigger_sequence_complete(struct dpu_extdst *ed);
bool extdst_pixengcfg_is_sync_busy(struct dpu_extdst *ed);
ed_pipeline_status_t extdst_pixengcfg_pipeline_status(struct dpu_extdst *ed);
void extdst_shden(struct dpu_extdst *ed, bool enable);
void extdst_kick_mode(struct dpu_extdst *ed, ed_kick_mode_t mode);
void extdst_perfcountmode(struct dpu_extdst *ed, bool enable);
void extdst_gamma_apply_enable(struct dpu_extdst *ed, bool enable);
void extdst_kick(struct dpu_extdst *ed);
void extdst_cnt_err_clear(struct dpu_extdst *ed);
bool extdst_cnt_err_status(struct dpu_extdst *ed);
u32 extdst_last_control_word(struct dpu_extdst *ed);
void extdst_pixel_cnt(struct dpu_extdst *ed, u16 *x, u16 *y);
void extdst_last_pixel_cnt(struct dpu_extdst *ed, u16 *x, u16 *y);
u32 extdst_perfresult(struct dpu_extdst *ed);
bool extdst_is_master(struct dpu_extdst *ed);
struct dpu_extdst *dpu_ed_get(struct dpu_soc *dpu, int id);
void dpu_ed_put(struct dpu_extdst *ed);
struct dpu_extdst *dpu_aux_ed_peek(struct dpu_extdst *ed);

/* Fetch Decode Unit */
int fetchdecode_pixengcfg_dynamic_src_sel(struct dpu_fetchunit *fu,
					  fd_dynamic_src_sel_t src);
void fetchdecode_layeroffset(struct dpu_fetchunit *fd, unsigned int x,
			     unsigned int y);
void fetchdecode_clipoffset(struct dpu_fetchunit *fd, unsigned int x,
			    unsigned int y);
void fetchdecode_clipdimensions(struct dpu_fetchunit *fd, unsigned int w,
				unsigned int h);
void fetchdecode_rgb_constantcolor(struct dpu_fetchunit *fd,
					u8 r, u8 g, u8 b, u8 a);
void fetchdecode_yuv_constantcolor(struct dpu_fetchunit *fd,
					u8 y, u8 u, u8 v);
int fetchdecode_fetchtype(struct dpu_fetchunit *fd, fetchtype_t *type);
shadow_load_req_t fetchdecode_to_shdldreq_t(struct dpu_fetchunit *fd);
u32 fetchdecode_get_vproc_mask(struct dpu_fetchunit *fd);
bool fetchdecode_need_fetcheco(struct dpu_fetchunit *fd, u32 fmt);
struct dpu_fetchunit *dpu_fd_get(struct dpu_soc *dpu, int id);
void dpu_fd_put(struct dpu_fetchunit *fu);

/* Fetch ECO Unit */
void fetcheco_layeroffset(struct dpu_fetchunit *fu, unsigned int x,
			  unsigned int y);
void fetcheco_clipoffset(struct dpu_fetchunit *fu, unsigned int x,
			 unsigned int y);
void fetcheco_clipdimensions(struct dpu_fetchunit *fu, unsigned int w,
			     unsigned int h);
void fetcheco_frameresampling(struct dpu_fetchunit *fu, unsigned int x,
			      unsigned int y);
int fetcheco_fetchtype(struct dpu_fetchunit *fu, fetchtype_t *type);
dpu_block_id_t fetcheco_get_block_id(struct dpu_fetchunit *fu);
struct dpu_fetchunit *dpu_fe_get(struct dpu_soc *dpu, int id);
void dpu_fe_put(struct dpu_fetchunit *fu);

/* Fetch Layer Unit */
void fetchlayer_rgb_constantcolor(struct dpu_fetchunit *fu,
					u8 r, u8 g, u8 b, u8 a);
void fetchlayer_yuv_constantcolor(struct dpu_fetchunit *fu, u8 y, u8 u, u8 v);
int fetchlayer_fetchtype(struct dpu_fetchunit *fu, fetchtype_t *type);
struct dpu_fetchunit *dpu_fl_get(struct dpu_soc *dpu, int id);
void dpu_fl_put(struct dpu_fetchunit *fu);

/* Fetch Warp Unit */
void fetchwarp_rgb_constantcolor(struct dpu_fetchunit *fu,
				 u8 r, u8 g, u8 b, u8 a);
void fetchwarp_yuv_constantcolor(struct dpu_fetchunit *fu, u8 y, u8 u, u8 v);
int fetchwarp_fetchtype(struct dpu_fetchunit *fu, fetchtype_t *type);
struct dpu_fetchunit *dpu_fw_get(struct dpu_soc *dpu, int id);
void dpu_fw_put(struct dpu_fetchunit *fu);

/* Frame Generator Unit */
struct dpu_framegen;
void framegen_enable(struct dpu_framegen *fg);
void framegen_disable(struct dpu_framegen *fg);
void framegen_enable_pixel_link(struct dpu_framegen *fg);
void framegen_disable_pixel_link(struct dpu_framegen *fg);
void framegen_shdtokgen(struct dpu_framegen *fg);
void framegen_syncmode(struct dpu_framegen *fg, fgsyncmode_t mode);
void
framegen_cfg_videomode(struct dpu_framegen *fg,
		       struct drm_display_mode *m, bool side_by_side,
		       bool encoder_type_has_tmds, bool encoder_type_has_lvds);
void framegen_pkickconfig(struct dpu_framegen *fg, bool enable);
void framegen_syncmode_fixup(struct dpu_framegen *fg, bool enable);
void framegen_displaymode(struct dpu_framegen *fg, fgdm_t mode);
void framegen_panic_displaymode(struct dpu_framegen *fg, fgdm_t mode);
void framegen_wait_done(struct dpu_framegen *fg, struct drm_display_mode *m);
void framegen_read_timestamp(struct dpu_framegen *fg,
			     u32 *frame_index, u32 *line_index);
void framegen_wait_for_frame_counter_moving(struct dpu_framegen *fg);
bool framegen_secondary_requests_to_read_empty_fifo(struct dpu_framegen *fg);
void framegen_secondary_clear_channel_status(struct dpu_framegen *fg);
bool framegen_secondary_is_syncup(struct dpu_framegen *fg);
void framegen_wait_for_secondary_syncup(struct dpu_framegen *fg);
void framegen_enable_clock(struct dpu_framegen *fg);
void framegen_disable_clock(struct dpu_framegen *fg);
bool framegen_is_master(struct dpu_framegen *fg);
bool framegen_is_slave(struct dpu_framegen *fg);
struct dpu_framegen *dpu_fg_get(struct dpu_soc *dpu, int id);
void dpu_fg_put(struct dpu_framegen *fg);
struct dpu_framegen *dpu_aux_fg_peek(struct dpu_framegen *fg);

/* Horizontal Scaler Unit */
struct dpu_hscaler;
int hscaler_pixengcfg_dynamic_src_sel(struct dpu_hscaler *hs, hs_src_sel_t src);
void hscaler_pixengcfg_clken(struct dpu_hscaler *hs, pixengcfg_clken_t clken);
void hscaler_shden(struct dpu_hscaler *hs, bool enable);
void hscaler_setup1(struct dpu_hscaler *hs, unsigned int src, unsigned int dst);
void hscaler_setup2(struct dpu_hscaler *hs, u32 phase_offset);
void hscaler_output_size(struct dpu_hscaler *hs, u32 line_num);
void hscaler_filter_mode(struct dpu_hscaler *hs, scaler_filter_mode_t m);
void hscaler_scale_mode(struct dpu_hscaler *hs, scaler_scale_mode_t m);
void hscaler_mode(struct dpu_hscaler *hs, scaler_mode_t m);
bool hscaler_is_enabled(struct dpu_hscaler *hs);
dpu_block_id_t hscaler_get_block_id(struct dpu_hscaler *hs);
unsigned int hscaler_get_stream_id(struct dpu_hscaler *hs);
void hscaler_set_stream_id(struct dpu_hscaler *hs, unsigned int id);
struct dpu_hscaler *dpu_hs_get(struct dpu_soc *dpu, int id);
void dpu_hs_put(struct dpu_hscaler *hs);

/* Layer Blend Unit */
struct dpu_layerblend;
int layerblend_pixengcfg_dynamic_prim_sel(struct dpu_layerblend *lb,
					  lb_prim_sel_t prim);
void layerblend_pixengcfg_dynamic_sec_sel(struct dpu_layerblend *lb,
					  lb_sec_sel_t sec);
void layerblend_pixengcfg_clken(struct dpu_layerblend *lb,
				pixengcfg_clken_t clken);
void layerblend_shden(struct dpu_layerblend *lb, bool enable);
void layerblend_shdtoksel(struct dpu_layerblend *lb, lb_shadow_sel_t sel);
void layerblend_shdldsel(struct dpu_layerblend *lb, lb_shadow_sel_t sel);
void layerblend_control(struct dpu_layerblend *lb, lb_mode_t mode);
void layerblend_blendcontrol(struct dpu_layerblend *lb, unsigned int zpos,
			     unsigned int pixel_blend_mode, u16 alpha);
void layerblend_position(struct dpu_layerblend *lb, int x, int y);
struct dpu_layerblend *dpu_lb_get(struct dpu_soc *dpu, int id);
void dpu_lb_put(struct dpu_layerblend *lb);

/* Signature Unit */
#define MAX_DPU_SIGNATURE_WIN_NUM	8
struct dpu_signature;
void signature_shden(struct dpu_signature *sig, bool enable);
void signature_shdldsel_local(struct dpu_signature *sig);
void signature_shdldsel_global(struct dpu_signature *sig);
void
signature_global_panic(struct dpu_signature *sig, unsigned int win, bool enable);
void
signature_local_panic(struct dpu_signature *sig, unsigned int win, bool enable);
void
signature_alpha_mask(struct dpu_signature *sig, unsigned int win, bool enable);
void signature_crc(struct dpu_signature *sig, unsigned int win, bool enable);
void
signature_eval_win(struct dpu_signature *sig, unsigned int win, bool enable);
void signature_win(struct dpu_signature *sig, unsigned int win,
		   int xul, int yul, int xlr, int ylr);
void signature_crc_value(struct dpu_signature *sig, unsigned int win,
			 u32 *red, u32 *green, u32 *blue);
void signature_shdldreq(struct dpu_signature *sig, u8 win_mask);
void signature_continuous_mode(struct dpu_signature *sig, bool enable);
void signature_kick(struct dpu_signature *sig);
bool signature_is_idle(struct dpu_signature *sig);
void signature_wait_for_idle(struct dpu_signature *sig);
bool signature_is_valid(struct dpu_signature *sig);
bool signature_is_error(struct dpu_signature *sig, u8 *err_win_mask);
struct dpu_signature *dpu_sig_get(struct dpu_soc *dpu, int id);
void dpu_sig_put(struct dpu_signature *sig);
struct dpu_signature *dpu_aux_sig_peek(struct dpu_signature *sig);

/* Store Unit */
struct dpu_store;
void store_pixengcfg_syncmode_fixup(struct dpu_store *st, bool enable);
struct dpu_store *dpu_st_get(struct dpu_soc *dpu, int id);
void dpu_st_put(struct dpu_store *st);

/* Timing Controller Unit */
struct dpu_tcon;
int tcon_set_fmt(struct dpu_tcon *tcon, u32 bus_format);
void tcon_set_operation_mode(struct dpu_tcon *tcon);
void tcon_cfg_videomode(struct dpu_tcon *tcon,
			struct drm_display_mode *m, bool side_by_side);
bool tcon_is_master(struct dpu_tcon *tcon);
bool tcon_is_slave(struct dpu_tcon *tcon);
void tcon_configure_pc(struct dpu_tcon *tcon, unsigned int di,
			unsigned int frame_width, u32 mode, u32 format);
void tcon_enable_pc(struct dpu_tcon *tcon);
void tcon_disable_pc(struct dpu_tcon *tcon);
struct dpu_tcon *dpu_tcon_get(struct dpu_soc *dpu, int id);
void dpu_tcon_put(struct dpu_tcon *tcon);
struct dpu_tcon *dpu_aux_tcon_peek(struct dpu_tcon *tcon);

/* Vertical Scaler Unit */
struct dpu_vscaler;
int vscaler_pixengcfg_dynamic_src_sel(struct dpu_vscaler *vs, vs_src_sel_t src);
void vscaler_pixengcfg_clken(struct dpu_vscaler *vs, pixengcfg_clken_t clken);
void vscaler_shden(struct dpu_vscaler *vs, bool enable);
void vscaler_setup1(struct dpu_vscaler *vs, u32 src, u32 dst, bool deinterlace);
void vscaler_setup2(struct dpu_vscaler *vs, bool deinterlace);
void vscaler_setup3(struct dpu_vscaler *vs, bool deinterlace);
void vscaler_setup4(struct dpu_vscaler *vs, u32 phase_offset);
void vscaler_setup5(struct dpu_vscaler *vs, u32 phase_offset);
void vscaler_output_size(struct dpu_vscaler *vs, u32 line_num);
void vscaler_field_mode(struct dpu_vscaler *vs, scaler_field_mode_t m);
void vscaler_filter_mode(struct dpu_vscaler *vs, scaler_filter_mode_t m);
void vscaler_scale_mode(struct dpu_vscaler *vs, scaler_scale_mode_t m);
void vscaler_mode(struct dpu_vscaler *vs, scaler_mode_t m);
bool vscaler_is_enabled(struct dpu_vscaler *vs);
dpu_block_id_t vscaler_get_block_id(struct dpu_vscaler *vs);
unsigned int vscaler_get_stream_id(struct dpu_vscaler *vs);
void vscaler_set_stream_id(struct dpu_vscaler *vs, unsigned int id);
struct dpu_vscaler *dpu_vs_get(struct dpu_soc *dpu, int id);
void dpu_vs_put(struct dpu_vscaler *vs);

struct dpu_fetchunit *fetchdecode_get_fetcheco(struct dpu_fetchunit *fu);
struct dpu_hscaler *fetchdecode_get_hscaler(struct dpu_fetchunit *fu);
struct dpu_vscaler *fetchdecode_get_vscaler(struct dpu_fetchunit *fu);

bool dpu_has_pc(struct dpu_soc *dpu);
unsigned int dpu_get_syncmode_min_prate(struct dpu_soc *dpu);
unsigned int dpu_get_singlemode_max_width(struct dpu_soc *dpu);
unsigned int dpu_get_master_stream_id(struct dpu_soc *dpu);

bool dpu_vproc_has_fetcheco_cap(u32 cap_mask);
bool dpu_vproc_has_hscale_cap(u32 cap_mask);
bool dpu_vproc_has_vscale_cap(u32 cap_mask);

u32 dpu_vproc_get_fetcheco_cap(u32 cap_mask);
u32 dpu_vproc_get_hscale_cap(u32 cap_mask);
u32 dpu_vproc_get_vscale_cap(u32 cap_mask);

void fetchunit_get_dprc(struct dpu_fetchunit *fu, void *data);
void fetchunit_shden(struct dpu_fetchunit *fu, bool enable);
void fetchunit_baddr_autoupdate(struct dpu_fetchunit *fu, u8 layer_mask);
void fetchunit_shdldreq_sticky(struct dpu_fetchunit *fu, u8 layer_mask);
void fetchunit_set_burstlength(struct dpu_fetchunit *fu,
			       unsigned int x_offset, unsigned int mt_w,
			       int bpp, dma_addr_t baddr, bool use_prefetch);
void fetchunit_set_baseaddress(struct dpu_fetchunit *fu, unsigned int width,
			       unsigned int x_offset, unsigned int y_offset,
			       unsigned int mt_w, unsigned int mt_h,
			       int bpp, dma_addr_t baddr);
void fetchunit_set_src_bpp(struct dpu_fetchunit *fu, int bpp);
void fetchunit_set_src_stride(struct dpu_fetchunit *fu,
			      unsigned int width, unsigned int x_offset,
			      unsigned int mt_w, int bpp, unsigned int stride,
			      dma_addr_t baddr, bool use_prefetch);
void fetchunit_set_pixel_blend_mode(struct dpu_fetchunit *fu,
				    unsigned int pixel_blend_mode, u16 alpha,
				    u32 fb_format);
void fetchunit_enable_src_buf(struct dpu_fetchunit *fu);
void fetchunit_disable_src_buf(struct dpu_fetchunit *fu);
bool fetchunit_is_enabled(struct dpu_fetchunit *fu);
unsigned int fetchunit_get_stream_id(struct dpu_fetchunit *fu);
void fetchunit_set_stream_id(struct dpu_fetchunit *fu, unsigned int id);
bool fetchunit_is_fetchdecode(struct dpu_fetchunit *fu);
bool fetchunit_is_fetcheco(struct dpu_fetchunit *fu);
bool fetchunit_is_fetchlayer(struct dpu_fetchunit *fu);
bool fetchunit_is_fetchwarp(struct dpu_fetchunit *fu);

/* dpu blit engine */
struct dpu_bliteng;
int dpu_bliteng_init(struct dpu_bliteng *dpu_bliteng);
void dpu_bliteng_fini(struct dpu_bliteng *dpu_bliteng);
int dpu_be_get(struct dpu_bliteng *dpu_be);
void dpu_be_put(struct dpu_bliteng *dpu_be);
void dpu_be_wait(struct dpu_bliteng *dpu_be);
int dpu_be_blit(struct dpu_bliteng *dpu_be, u32 *cmdlist,
		u32 cmdnum);
int dpu_bliteng_get_empty_instance(struct dpu_bliteng **dpu_be,
				   struct device *dev);
u32 *dpu_bliteng_get_cmd_list(struct dpu_bliteng *dpu_be);
s32 dpu_bliteng_get_id(struct dpu_bliteng *dpu_be);
void dpu_bliteng_set_id(struct dpu_bliteng *dpu_be, int id);
void dpu_bliteng_set_dev(struct dpu_bliteng *dpu_be, struct device *dev);

void  dpu_be_configure_prefetch(struct dpu_bliteng *dpu_be,
				u32 width, u32 height,
				u32 x_offset, u32 y_offset,
				u32 stride, u32 format, u64 modifier,
				u64 baddr, u64 uv_addr);

/*
 * to avoid on-the-fly/hot plane resource migration
 * between two display interfaces
 */
#define DPU_PLANE_SRC_TO_DISP_STREAM0	BIT(0)
#define DPU_PLANE_SRC_TO_DISP_STREAM1	BIT(1)
#define DPU_PLANE_SRC_DISABLED		0

#define MAX_FD_NUM	4
#define MAX_FL_NUM	2
#define MAX_FW_NUM	1
#define MAX_LB_NUM	7
struct dpu_plane_res {
	struct dpu_extdst	*ed[2];
	struct dpu_fetchunit	*fd[MAX_FD_NUM];
	struct dpu_fetchunit	*fe[2];
	struct dpu_fetchunit	*fl[MAX_FL_NUM];
	struct dpu_fetchunit	*fw[MAX_FW_NUM];
	struct dpu_framegen	*fg[2];
	struct dpu_hscaler	*hs[2];
	struct dpu_layerblend	*lb[MAX_LB_NUM];
	struct dpu_vscaler	*vs[2];
};

/*
 * Each DPU plane can be a primary plane or an overlay plane
 * of one of the DPU's two CRTCs.
 */
struct dpu_plane_grp {
	struct dpu_plane_res	res;
	unsigned int		hw_plane_num;
	unsigned int		hw_plane_fetcheco_num;
	unsigned int		hw_plane_hscaler_num;
	unsigned int		hw_plane_vscaler_num;
	unsigned int		id;
	bool			has_vproc;
	/*
	 * used when assigning plane source
	 * index:     0         1         2       3   4   5   6
	 * source: fl0(sub0) fl1(sub0) fw2(sub0) fd0 fd1 fd2 fd3
	 */
	struct mutex		mutex;
	u32			src_a_mask;
	u32			src_na_mask;
	u32			src_use_vproc_mask;
};

static inline struct dpu_plane_grp *plane_res_to_grp(struct dpu_plane_res *res)
{
	return container_of(res, struct dpu_plane_grp, res);
}

struct dpu_client_platformdata {
	const unsigned int	stream_id;
	unsigned int		di_grp_id;
	struct dpu_plane_grp	*plane_grp;

	/* Store9 could be shared bewteen display engine and blit engine */
	struct dpu_store	*st9;

	struct device_node	*of_node;
};
#endif /* __DRM_DPU_H__ */
