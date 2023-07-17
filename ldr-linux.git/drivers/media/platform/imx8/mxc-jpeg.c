/*
 * Copyright 2018 NXP
 */
/*
 * The code contained herein is licensed under the GNU General Public
 * License. You may obtain a copy of the GNU General Public License
 * Version 2 or later at the following locations:
 *
 * http://www.opensource.org/licenses/gpl-license.html
 * http://www.gnu.org/copyleft/gpl.html
 */
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/io.h>
#include <linux/clk.h>
#include <linux/of_platform.h>
#include <linux/platform_device.h>
#include <linux/slab.h>
#include <linux/irqreturn.h>
#include <linux/interrupt.h>
#include <linux/pm_runtime.h>
#include <linux/string.h>

#include <media/v4l2-mem2mem.h>
#include <media/v4l2-ioctl.h>
#include <media/v4l2-common.h>
#include <media/v4l2-event.h>
#include <media/videobuf2-dma-contig.h>

#include "mxc-jpeg-hw.h"
#include "mxc-jpeg.h"

static struct mxc_jpeg_fmt mxc_formats[] = {
	{
		.name		= "JPEG",
		.fourcc		= V4L2_PIX_FMT_JPEG,
		.colplanes	= 1,
		.flags		= MXC_JPEG_FMT_TYPE_ENC,
	},
	{
		.name		= "RGB", /*RGBRGB packed format*/
		.fourcc		= V4L2_PIX_FMT_RGB24,
		.depth		= 24,
		.colplanes	= 1,
		.h_align	= 3,
		.v_align	= 3,
		.flags		= MXC_JPEG_FMT_TYPE_RAW,
	},
	{
		.name		= "ARGB", /* ARGBARGB packed format */
		.fourcc		= V4L2_PIX_FMT_ARGB32,
		.depth		= 32,
		.colplanes	= 1,
		.h_align	= 3,
		.v_align	= 3,
		.flags		= MXC_JPEG_FMT_TYPE_RAW,
	},
	{
		.name		= "YUV420", /* 1st plane = Y, 2nd plane = UV */
		.fourcc		= V4L2_PIX_FMT_NV12,
		.depth		= 12, /* 6 bytes (4Y + UV) for 4 pixels */
		.colplanes	= 2, /* 1 plane Y, 1 plane UV interleaved */
		.h_align	= 4,
		.v_align	= 4,
		.flags		= MXC_JPEG_FMT_TYPE_RAW,
	},
	{
		.name		= "YUV422", /* YUYV */
		.fourcc		= V4L2_PIX_FMT_YUYV,
		.depth		= 16,
		.colplanes	= 1,
		.h_align	= 4,
		.v_align	= 3,
		.flags		= MXC_JPEG_FMT_TYPE_RAW,
	},
	{
		.name		= "YUV444", /* YUVYUV */
		.fourcc		= V4L2_PIX_FMT_YUV24,
		.depth		= 24,
		.colplanes	= 1,
		.h_align	= 3,
		.v_align	= 3,
		.flags		= MXC_JPEG_FMT_TYPE_RAW,
	},
	{
		.name		= "Gray", /* Gray (Y8/Y12) or Single Comp */
		.fourcc		= V4L2_PIX_FMT_GREY,
		.depth		= 8,
		.colplanes	= 1,
		.h_align	= 3,
		.v_align	= 3,
		.flags		= MXC_JPEG_FMT_TYPE_RAW,
	},
};
#define MXC_JPEG_NUM_FORMATS ARRAY_SIZE(mxc_formats)

static const struct of_device_id mxc_jpeg_match[] = {
	{
		.compatible = "fsl,imx8-jpgdec",
		.data       = (void *)MXC_JPEG_DECODE,
	},
	{
		.compatible = "fsl,imx8-jpgenc",
		.data       = (void *)MXC_JPEG_ENCODE,
	},
	{ },
};

/* default configuration stream 64x64 yuv422 */
static const unsigned char jpeg_soi[] = {0xFF, 0xD8};
static const unsigned char jpeg_app0[] = {0xFF, 0xE0, 0x00, 0x10, 0x4A,
0x46, 0x49, 0x46, 0x00, 0x01, 0x01, 0x00,
0x00, 0x01, 0x00, 0x01, 0x00, 0x00};
static const unsigned char jpeg_app14[] = {
0xFF, 0xEE, 0x00, 0x0E, 0x41, 0x64, 0x6F, 0x62,
0x65, 0x00, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00};
static const unsigned char jpeg_dqt[] = {0xFF, 0xDB,
0x00, 0x84, 0x00, 0x10, 0x0B, 0x0C,
0x0E, 0x0C, 0x0A, 0x10, 0x0E, 0x0D, 0x0E,
0x12, 0x11, 0x10, 0x13, 0x18, 0x28, 0x1A,
0x18, 0x16, 0x16, 0x18, 0x31, 0x23, 0x25,
0x1D, 0x28, 0x3A, 0x33, 0x3D, 0x3C, 0x39,
0x33, 0x38, 0x37, 0x40, 0x48, 0x5C, 0x4E,
0x40, 0x44, 0x57, 0x45, 0x37, 0x38, 0x50,
0x6D, 0x51, 0x57, 0x5F, 0x62, 0x67, 0x68,
0x67, 0x3E, 0x4D, 0x71, 0x79, 0x70, 0x64,
0x78, 0x5C, 0x65, 0x67, 0x63, 0x01, 0x11,
0x12, 0x12, 0x18, 0x15, 0x18, 0x2F, 0x1A,
0x1A, 0x2F, 0x63, 0x42, 0x38, 0x42, 0x63,
0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63,
0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63,
0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63,
0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63,
0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63,
0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63,
0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63};
static const unsigned char jpeg_sof_maximal[] = {0xFF, 0xC0,
0x00, 0x14, 0x08, 0x00, 0x40,
0x00, 0x40, 0x04, 0x01, 0x11, 0x00, 0x02,
0x11, 0x01, 0x03, 0x11, 0x01, 0x04, 0x11, 0x01};
static const unsigned char jpeg_dht[] = {0xFF, 0xC4,
0x01, 0xA2, 0x00, 0x00, 0x01, 0x05, 0x01,
0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01,
0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
0x09, 0x0A, 0x0B, 0x10, 0x00, 0x02, 0x01,
0x03, 0x03, 0x02, 0x04, 0x03, 0x05, 0x05,
0x04, 0x04, 0x00, 0x00, 0x01, 0x7D, 0x01,
0x02, 0x03, 0x00, 0x04, 0x11, 0x05, 0x12,
0x21, 0x31, 0x41, 0x06, 0x13, 0x51, 0x61,
0x07, 0x22, 0x71, 0x14, 0x32, 0x81, 0x91,
0xA1, 0x08, 0x23, 0x42, 0xB1, 0xC1, 0x15,
0x52, 0xD1, 0xF0, 0x24, 0x33, 0x62, 0x72,
0x82, 0x09, 0x0A, 0x16, 0x17, 0x18, 0x19,
0x1A, 0x25, 0x26, 0x27, 0x28, 0x29, 0x2A,
0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x3A,
0x43, 0x44, 0x45, 0x46, 0x47, 0x48, 0x49,
0x4A, 0x53, 0x54, 0x55, 0x56, 0x57, 0x58,
0x59, 0x5A, 0x63, 0x64, 0x65, 0x66, 0x67,
0x68, 0x69, 0x6A, 0x73, 0x74, 0x75, 0x76,
0x77, 0x78, 0x79, 0x7A, 0x83, 0x84, 0x85,
0x86, 0x87, 0x88, 0x89, 0x8A, 0x92, 0x93,
0x94, 0x95, 0x96, 0x97, 0x98, 0x99, 0x9A,
0xA2, 0xA3, 0xA4, 0xA5, 0xA6, 0xA7, 0xA8,
0xA9, 0xAA, 0xB2, 0xB3, 0xB4, 0xB5, 0xB6,
0xB7, 0xB8, 0xB9, 0xBA, 0xC2, 0xC3, 0xC4,
0xC5, 0xC6, 0xC7, 0xC8, 0xC9, 0xCA, 0xD2,
0xD3, 0xD4, 0xD5, 0xD6, 0xD7, 0xD8, 0xD9,
0xDA, 0xE1, 0xE2, 0xE3, 0xE4, 0xE5, 0xE6,
0xE7, 0xE8, 0xE9, 0xEA, 0xF1, 0xF2, 0xF3,
0xF4, 0xF5, 0xF6, 0xF7, 0xF8, 0xF9, 0xFA,
0x01, 0x00, 0x03, 0x01, 0x01, 0x01, 0x01,
0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x03,
0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A,
0x0B, 0x11, 0x00, 0x02, 0x01, 0x02, 0x04,
0x04, 0x03, 0x04, 0x07, 0x05, 0x04, 0x04,
0x00, 0x01, 0x02, 0x77, 0x00, 0x01, 0x02,
0x03, 0x11, 0x04, 0x05, 0x21, 0x31, 0x06,
0x12, 0x41, 0x51, 0x07, 0x61, 0x71, 0x13,
0x22, 0x32, 0x81, 0x08, 0x14, 0x42, 0x91,
0xA1, 0xB1, 0xC1, 0x09, 0x23, 0x33, 0x52,
0xF0, 0x15, 0x62, 0x72, 0xD1, 0x0A, 0x16,
0x24, 0x34, 0xE1, 0x25, 0xF1, 0x17, 0x18,
0x19, 0x1A, 0x26, 0x27, 0x28, 0x29, 0x2A,
0x35, 0x36, 0x37, 0x38, 0x39, 0x3A, 0x43,
0x44, 0x45, 0x46, 0x47, 0x48, 0x49, 0x4A,
0x53, 0x54, 0x55, 0x56, 0x57, 0x58, 0x59,
0x5A, 0x63, 0x64, 0x65, 0x66, 0x67, 0x68,
0x69, 0x6A, 0x73, 0x74, 0x75, 0x76, 0x77,
0x78, 0x79, 0x7A, 0x82, 0x83, 0x84, 0x85,
0x86, 0x87, 0x88, 0x89, 0x8A, 0x92, 0x93,
0x94, 0x95, 0x96, 0x97, 0x98, 0x99, 0x9A,
0xA2, 0xA3, 0xA4, 0xA5, 0xA6, 0xA7, 0xA8,
0xA9, 0xAA, 0xB2, 0xB3, 0xB4, 0xB5, 0xB6,
0xB7, 0xB8, 0xB9, 0xBA, 0xC2, 0xC3, 0xC4,
0xC5, 0xC6, 0xC7, 0xC8, 0xC9, 0xCA, 0xD2,
0xD3, 0xD4, 0xD5, 0xD6, 0xD7, 0xD8, 0xD9,
0xDA, 0xE2, 0xE3, 0xE4, 0xE5, 0xE6, 0xE7,
0xE8, 0xE9, 0xEA, 0xF2, 0xF3, 0xF4, 0xF5,
0xF6, 0xF7, 0xF8, 0xF9, 0xFA};
static const unsigned char jpeg_dri[] = {0xFF, 0xDD,
0x00, 0x04, 0x00, 0x20};
static const unsigned char jpeg_sos_maximal[] = {0xFF, 0xDA,
0x00, 0x0C, 0x04, 0x01, 0x00, 0x02, 0x11, 0x03,
0x11, 0x04, 0x11, 0x00, 0x3F, 0x00,};
static const unsigned char jpeg_eoi[] = {0xFF, 0xD9};

/*  Print Four-character-code (FOURCC) */
static char *fourcc_to_str(u32 format)
{
	char *buf = kmalloc(32, GFP_KERNEL);

	snprintf(buf, 32,
		 "%c%c%c%c",
		 format & 0xff,
		 (format >> 8) & 0xff,
		 (format >> 16) & 0xff,
		 (format >> 24) & 0x7f);
	return buf;
}

static unsigned int mxc_jpeg_tracing;
EXPORT_SYMBOL(mxc_jpeg_tracing);

module_param_named(jpeg_tracing, mxc_jpeg_tracing, int, 0600);

static void _bswap16(u16 *a)
{
	*a = ((*a & 0x00FF) << 8) | ((*a & 0xFF00) >> 8);
}

static void print_buf_preview(struct device *dev, struct vb2_buffer *buf)
{
	unsigned char *data;
	u32 dma_addr;

	if (!mxc_jpeg_tracing)
		return;

	dma_addr = vb2_dma_contig_plane_dma_addr(buf, 0);
	data = (char *)vb2_plane_vaddr(buf, 0);

	/* print just the first 4 bytes from the beginning of the buffer */
	dev_dbg(dev, "vaddr=%p dma_addr=%x: %x %x %x %x ...\n",
		data, dma_addr,
		data[0], data[1], data[2], data[3]);
}

static void print_nbuf_to_eoi(struct device *dev, struct vb2_buffer *buf, int n)
{
	unsigned char *data;
	u32 dma_addr;
	int i;
	int items_per_line = 22;
	char *bufstr, *bufptr;

	if (!mxc_jpeg_tracing)
		return;

	if (n == 0)
		n = buf->planes[0].bytesused;

	dma_addr = vb2_dma_contig_plane_dma_addr(buf, 0);
	data = (unsigned char *)vb2_plane_vaddr(buf, 0);

	dev_dbg(dev, "vaddr=%p dma_addr=%x bytesused=%d:",
		 data, dma_addr, n);

	bufstr = kmalloc(items_per_line * 6, GFP_ATOMIC);
	bufptr = bufstr;
	for (i = 0; i < n; i++) {
		snprintf(bufptr, 6, "0x%02x,", data[i]);
		bufptr += 5;
		if ((i+1) % items_per_line == 0) {
			/* print the current line */
			dev_dbg(dev, "%s", bufstr);
			/* back to buffer start */
			bufptr = bufstr;
		}
		/* stop at End of Image (EOI) marker*/
		if (i > 0 && data[i-1] == 0xFF && data[i] == 0xD9)
			break;
	}
	if (bufptr != bufstr)
		dev_dbg(dev, "%s", bufstr);
	dev_dbg(dev, "buffer size = %d", i);
	kfree(bufstr);
}

static inline u32 mxc_jpeg_align(u32 val, u32 align)
{
	return (val + align - 1) & ~(align - 1);
}

static inline struct mxc_jpeg_ctx *mxc_jpeg_fh_to_ctx(struct v4l2_fh *fh)
{
	return container_of(fh, struct mxc_jpeg_ctx, fh);
}

static int enum_fmt(struct mxc_jpeg_fmt *mxc_formats, int n,
		    struct v4l2_fmtdesc *f, u32 type)
{
	int i, num = 0;

	for (i = 0; i < n; ++i) {
		if (mxc_formats[i].flags == type) {
			/* index-th format of type type found ? */
			if (num == f->index)
				break;
			/* Correct type but haven't reached our index yet,
			 * just increment per-type index
			 */
			++num;
		}
	}

	/* Format not found */
	if (i >= n)
		return -EINVAL;

	strlcpy(f->description, mxc_formats[i].name, sizeof(f->description));
	f->pixelformat = mxc_formats[i].fourcc;

	return 0;
}

static struct mxc_jpeg_fmt *mxc_jpeg_find_format(struct mxc_jpeg_ctx *ctx,
						 u32 pixelformat)
{
	unsigned int k;

	for (k = 0; k < MXC_JPEG_NUM_FORMATS; k++) {
		struct mxc_jpeg_fmt *fmt = &mxc_formats[k];

		if (fmt->fourcc == pixelformat)
			return fmt;
	}
	return NULL;
}

static enum mxc_jpeg_image_format mxc_jpeg_fourcc_to_imgfmt(
	u32	fourcc)
{
	switch (fourcc) {
	case V4L2_PIX_FMT_GREY:
		return MXC_JPEG_GRAY;
	case V4L2_PIX_FMT_YUYV:
		return MXC_JPEG_YUV422;
	case V4L2_PIX_FMT_NV12:
		return MXC_JPEG_YUV420;
	case V4L2_PIX_FMT_YUV24:
		return MXC_JPEG_YUV444;
	case V4L2_PIX_FMT_RGB24:
		return MXC_JPEG_RGB;
	case V4L2_PIX_FMT_ARGB32:
		return MXC_JPEG_ARGB;
	default:
		return MXC_JPEG_INVALID;
	}
}

static int mxc_jpeg_imgfmt_to_fourcc(enum mxc_jpeg_image_format imgfmt,
				  u32 *fourcc)
{
	switch (imgfmt) {
	case MXC_JPEG_GRAY:
		*fourcc = V4L2_PIX_FMT_GREY;
		return 0;
	case MXC_JPEG_YUV422:
		*fourcc = V4L2_PIX_FMT_YUYV;
		return 0;
	case MXC_JPEG_YUV420:
		*fourcc =  V4L2_PIX_FMT_NV12;
		return 0;
	case MXC_JPEG_YUV444:
		*fourcc =  V4L2_PIX_FMT_YUV24;
		return 0;
	case MXC_JPEG_RGB:
		*fourcc =  V4L2_PIX_FMT_RGB24;
		return 0;
	case MXC_JPEG_ARGB:
		*fourcc =  V4L2_PIX_FMT_ARGB32;
		return 0;
	default:
		return 1;
	}
}

static struct mxc_jpeg_q_data *mxc_jpeg_get_q_data(struct mxc_jpeg_ctx *ctx,
						   enum v4l2_buf_type type)
{
	if (V4L2_TYPE_IS_OUTPUT(type))
		return &ctx->out_q;
	return &ctx->cap_q;
}

static void mxc_jpeg_addrs(struct mxc_jpeg_desc *desc,
			   struct vb2_buffer *b_base0_buf,
			   struct vb2_buffer *bufbase_buf, int offset)
{
	int img_fmt = desc->stm_ctrl & STM_CTRL_IMAGE_FORMAT_MASK;

	desc->buf_base0 = vb2_dma_contig_plane_dma_addr(b_base0_buf, 0);
	desc->buf_base1 = 0;
	if (img_fmt == STM_CTRL_IMAGE_FORMAT(MXC_JPEG_YUV420)) {
		WARN_ON(b_base0_buf->num_planes < 2);
		desc->buf_base1 = vb2_dma_contig_plane_dma_addr(b_base0_buf, 1);
	}
	desc->stm_bufbase = vb2_dma_contig_plane_dma_addr(bufbase_buf, 0) +
		offset;
}

static void notify_eos(struct mxc_jpeg_ctx *ctx)
{
	const struct v4l2_event ev = {
		.type = V4L2_EVENT_EOS
	};

	dev_dbg(ctx->mxc_jpeg->dev, "Notify app event EOS reached");
	v4l2_event_queue_fh(&ctx->fh, &ev);
}

static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
{
	struct mxc_jpeg_dev *jpeg = priv;
	struct mxc_jpeg_ctx *ctx;
	void __iomem *reg = jpeg->base_reg;
	struct device *dev = jpeg->dev;
	struct vb2_buffer *src_buf, *dst_buf;
	enum vb2_buffer_state buf_state;
	u32 dec_ret;
	unsigned long payload_size;
	struct mxc_jpeg_q_data *q_data;
	enum v4l2_buf_type cap_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
	int slot = 0; /* TODO remove hardcoded slot 0 */

	spin_lock(&jpeg->hw_lock);

	dec_ret = readl(reg + MXC_SLOT_OFFSET(slot, SLOT_STATUS));
	writel(dec_ret, reg + MXC_SLOT_OFFSET(slot, SLOT_STATUS)); /* w1c */

	ctx = v4l2_m2m_get_curr_priv(jpeg->m2m_dev);
	if (!ctx) {
		dev_err(dev,
			"Instance released before the end of transaction 0x%x.",
			dec_ret);
		/* soft reset only resets internal state, not registers */
		mxc_jpeg_sw_reset(reg);
		/* clear all interrupts */
		writel(0xFFFFFFFF, reg + MXC_SLOT_OFFSET(slot, SLOT_STATUS));
		goto job_unlock;
	}

	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);

	if (ctx->aborting) {
		dev_warn(dev, "Aborting current job\n");
		mxc_jpeg_sw_reset(reg);
		buf_state = VB2_BUF_STATE_ERROR;
		goto buffers_done;
	}

	if (dec_ret & SLOTa_STATUS_ENC_CONFIG_ERR) {
		u32 ret = readl(reg + CAST_STATUS12);

		dev_err(dev, "Encoder/decoder error, status=0x%08x", ret);
		mxc_jpeg_sw_reset(reg);
		buf_state = VB2_BUF_STATE_ERROR;
		goto buffers_done;
	}

	if (!(dec_ret & SLOTa_STATUS_FRMDONE))
		goto job_unlock;

	if (ctx->mode == MXC_JPEG_ENCODE
	    && ctx->enc_state == MXC_JPEG_ENC_CONF) {
		ctx->enc_state = MXC_JPEG_ENC_DONE;
		dev_dbg(dev, "Encoder config finished. Start encoding...\n");
		mxc_jpeg_enc_mode_go(dev, reg);
		goto job_unlock;
	}
	if (ctx->mode == MXC_JPEG_DECODE && ctx->dht_needed) {
		ctx->dht_needed = false;
		dev_dbg(dev, "Decoder DHT cfg finished. Start decoding...\n");
		goto job_unlock;
	}
	if (ctx->mode == MXC_JPEG_ENCODE) {
		payload_size = readl(reg + MXC_SLOT_OFFSET(slot, SLOT_BUF_PTR));
		vb2_set_plane_payload(dst_buf, 0, payload_size);
		dev_dbg(dev, "Encoding finished, payload_size: %ld\n",
			payload_size);
	} else {
		q_data = mxc_jpeg_get_q_data(ctx, cap_type);
		payload_size = q_data->sizeimage[0];
		vb2_set_plane_payload(dst_buf, 0, payload_size);
		vb2_set_plane_payload(dst_buf, 1, 0);
		if (q_data->fmt->colplanes == 2) {
			payload_size = q_data->sizeimage[1];
			vb2_set_plane_payload(dst_buf, 1, payload_size);
		}
		dev_dbg(dev, "Decoding finished, payload_size: %ld + %ld\n",
			vb2_get_plane_payload(dst_buf, 0),
			vb2_get_plane_payload(dst_buf, 1));
	}

	/* short preview of the results */
	dev_dbg(dev, "src_buf preview: ");
	print_buf_preview(dev, src_buf);
	dev_dbg(dev, "dst_buf preview: ");
	print_buf_preview(dev, dst_buf);
	buf_state = VB2_BUF_STATE_DONE;

buffers_done:
	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
	v4l2_m2m_buf_done(to_vb2_v4l2_buffer(src_buf), buf_state);
	v4l2_m2m_buf_done(to_vb2_v4l2_buffer(dst_buf), buf_state);
	spin_unlock(&jpeg->hw_lock);
	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
	return IRQ_HANDLED;
job_unlock:
	spin_unlock(&jpeg->hw_lock);
	return IRQ_HANDLED;
}

static void mxc_jpeg_config_dec_desc(struct vb2_buffer *out_buf,
			 int slot,
			 struct mxc_jpeg_ctx *ctx,
			 struct vb2_buffer *src_buf, struct vb2_buffer *dst_buf)
{
	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
	void __iomem *reg = jpeg->base_reg;
	struct mxc_jpeg_desc *desc = jpeg->slot_data[slot].desc;
	struct mxc_jpeg_desc *cfg_desc = jpeg->slot_data[slot].cfg_desc;
	dma_addr_t desc_handle = jpeg->slot_data[slot].desc_handle;
	dma_addr_t cfg_desc_handle = jpeg->slot_data[slot].cfg_desc_handle;
	dma_addr_t cfg_stream_handle = jpeg->slot_data[slot].cfg_stream_handle;
	unsigned int cfg_stream_size = jpeg->slot_data[slot].cfg_stream_size;

	if (ctx->dht_needed) {
		/*
		 * use the config descriptor to inject a default huffman table
		 * by chaining it before the decoding descriptor
		 */
		cfg_desc->next_descpt_ptr = desc_handle | MXC_NXT_DESCPT_EN;
		cfg_desc->buf_base0 = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
		cfg_desc->buf_base1 = 0;
		cfg_desc->imgsize = MXC_JPEG_MIN_WIDTH << 16;
		cfg_desc->imgsize |= MXC_JPEG_MIN_HEIGHT;
		cfg_desc->line_pitch = MXC_JPEG_MIN_WIDTH * 2;
		cfg_desc->stm_ctrl = STM_CTRL_IMAGE_FORMAT(MXC_JPEG_YUV422);
		cfg_desc->stm_bufbase = cfg_stream_handle;
		cfg_desc->stm_bufsize = mxc_jpeg_align(cfg_stream_size, 1024);
		print_descriptor_info(jpeg->dev, cfg_desc);
	}

	desc->next_descpt_ptr = 0; /* end of chain */
	mxc_jpeg_addrs(desc, dst_buf, src_buf, 0);
	mxc_jpeg_set_bufsize(desc,
			mxc_jpeg_align(vb2_plane_size(src_buf, 0), 1024));
	print_descriptor_info(jpeg->dev, desc);
	if (ctx->dht_needed) {
		/* validate the configuration descriptor */
		mxc_jpeg_set_desc(cfg_desc_handle, reg, slot);
	} else {
		/* validate the decoding descriptor */
		mxc_jpeg_set_desc(desc_handle, reg, slot);
	}
}

static int mxc_jpeg_fixup_sof(struct mxc_jpeg_sof *sof,
			      u32 fourcc,
			      u16 w, u16 h)
{
	int sof_length;

	sof->precision = 8; /* TODO allow 8/12 bit precision*/
	sof->height = h;
	_bswap16(&sof->height);
	sof->width = w;
	_bswap16(&sof->width);

	switch (fourcc) {
	case V4L2_PIX_FMT_NV12:
		sof->components_no = 3;
		sof->comp[0].v = 0x2; sof->comp[0].h = 0x2;
		break;
	case V4L2_PIX_FMT_YUYV:
		sof->components_no = 3;
		sof->comp[0].v = 0x1; sof->comp[0].h = 0x2;
		break;
	case V4L2_PIX_FMT_YUV24:
	case V4L2_PIX_FMT_RGB24:
	default:
		sof->components_no = 3;
		break;
	case V4L2_PIX_FMT_ARGB32:
		sof->components_no = 4;
		break;
	case V4L2_PIX_FMT_GREY:
		sof->components_no = 1;
		break;
	}
	sof_length = 8 + 3 * sof->components_no;
	sof->length = sof_length;
	_bswap16(&sof->length);

	return sof_length; /* not swaped */
}

static int mxc_jpeg_fixup_sos(struct mxc_jpeg_sos *sos,
			      u32 fourcc)
{
	int sos_length;
	u8 *sof_u8 = (u8 *)sos;

	switch (fourcc) {
	case V4L2_PIX_FMT_NV12:
		sos->components_no = 3;
		break;
	case V4L2_PIX_FMT_YUYV:
		sos->components_no = 3;
		break;
	case V4L2_PIX_FMT_YUV24:
	case V4L2_PIX_FMT_RGB24:
	default:
		sos->components_no = 3;
		break;
	case V4L2_PIX_FMT_ARGB32:
		sos->components_no = 4;
		break;
	case V4L2_PIX_FMT_GREY:
		sos->components_no = 1;
		break;
	}
	sos_length = 6 + 2 * sos->components_no;
	sos->length = sos_length;
	_bswap16(&sos->length);

	/* SOS ignorable bytes, not so ignorable after all */
	sof_u8[sos_length - 1] = 0x0;
	sof_u8[sos_length - 2] = 0x3f;
	sof_u8[sos_length - 3] = 0x0;

	return sos_length; /* not swaped */
}

static unsigned int mxc_jpeg_setup_cfg_stream(void *cfg_stream_vaddr,
					      u32 fourcc,
					      u16 w, u16 h)
{
	unsigned int offset = 0;
	u8 *cfg = (u8 *)cfg_stream_vaddr;
	struct mxc_jpeg_sof *sof;
	struct mxc_jpeg_sos *sos;

	memcpy(cfg + offset, jpeg_soi, ARRAY_SIZE(jpeg_soi));
	offset += ARRAY_SIZE(jpeg_soi);

	if (fourcc == V4L2_PIX_FMT_RGB24 ||
	    fourcc == V4L2_PIX_FMT_ARGB32) {
		memcpy(cfg + offset, jpeg_app14, sizeof(jpeg_app14));
		offset += sizeof(jpeg_app14);
	} else {
		memcpy(cfg + offset, jpeg_app0, sizeof(jpeg_app0));
		offset += sizeof(jpeg_app0);
	}

	memcpy(cfg + offset, jpeg_dqt, sizeof(jpeg_dqt));
	offset += sizeof(jpeg_dqt);

	memcpy(cfg + offset, jpeg_sof_maximal, sizeof(jpeg_sof_maximal));
	offset += 2; /* skip marker ID */
	sof = (struct mxc_jpeg_sof *)(cfg + offset);
	offset += mxc_jpeg_fixup_sof(sof, fourcc, w, h);

	memcpy(cfg + offset, jpeg_dht, sizeof(jpeg_dht));
	offset += sizeof(jpeg_dht);

	memcpy(cfg + offset, jpeg_dri, sizeof(jpeg_dri));
	offset += sizeof(jpeg_dri);

	memcpy(cfg + offset, jpeg_sos_maximal, sizeof(jpeg_sos_maximal));
	offset += 2; /* skip marker ID */
	sos = (struct mxc_jpeg_sos *)(cfg + offset);
	offset += mxc_jpeg_fixup_sos(sos, fourcc);

	memcpy(cfg + offset, jpeg_eoi, sizeof(jpeg_eoi));
	offset += sizeof(jpeg_eoi);

	return offset;
}

static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
			 int slot,
			 struct mxc_jpeg_ctx *ctx,
			 struct vb2_buffer *src_buf, struct vb2_buffer *dst_buf)
{
	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
	void __iomem *reg = jpeg->base_reg;
	struct mxc_jpeg_desc *desc = jpeg->slot_data[slot].desc;
	struct mxc_jpeg_desc *cfg_desc = jpeg->slot_data[slot].cfg_desc;
	dma_addr_t desc_handle = jpeg->slot_data[slot].desc_handle;
	dma_addr_t cfg_desc_handle = jpeg->slot_data[slot].cfg_desc_handle;
	struct mxc_jpeg_q_data *q_data;
	enum mxc_jpeg_image_format img_fmt;
	int w, h;

	q_data = mxc_jpeg_get_q_data(ctx, src_buf->vb2_queue->type);

	/* chain the config descriptor with the encoding descriptor */
	cfg_desc->next_descpt_ptr = desc_handle | MXC_NXT_DESCPT_EN;

	cfg_desc->buf_base0 = jpeg->slot_data[slot].cfg_stream_handle;
	cfg_desc->buf_base1 = 0;
	cfg_desc->line_pitch = 0;
	cfg_desc->stm_bufbase = 0;
	cfg_desc->stm_bufsize = 0x2000;
	cfg_desc->imgsize = 0;
	cfg_desc->stm_ctrl = STM_CTRL_CONFIG_MOD(1);

	desc->next_descpt_ptr = 0; /* end of chain */

	/* use adjusted resolution for CAST IP job */
	w = q_data->w_adjusted;
	h = q_data->h_adjusted;
	mxc_jpeg_set_res(desc, w, h);
	mxc_jpeg_set_line_pitch(desc, w * (q_data->fmt->depth / 8));
	mxc_jpeg_set_bufsize(desc, desc->line_pitch * h);
	img_fmt = mxc_jpeg_fourcc_to_imgfmt(q_data->fmt->fourcc);
	if (img_fmt == MXC_JPEG_INVALID)
		dev_err(jpeg->dev, "No valid image format detected\n");
	desc->stm_ctrl = STM_CTRL_CONFIG_MOD(0) |
			 STM_CTRL_IMAGE_FORMAT(img_fmt);
	mxc_jpeg_addrs(desc, src_buf, dst_buf, 0);
	dev_dbg(jpeg->dev, "cfg_desc - 0x%llx:\n", cfg_desc_handle);
	print_descriptor_info(jpeg->dev, cfg_desc);
	dev_dbg(jpeg->dev, "enc desc - 0x%llx:\n", desc_handle);
	print_descriptor_info(jpeg->dev, desc);
	print_wrapper_info(jpeg->dev, reg);
	print_cast_status(jpeg->dev, reg, MXC_JPEG_ENCODE);

	/* validate the configuration descriptor */
	mxc_jpeg_set_desc(cfg_desc_handle, reg, slot);
}

static void mxc_jpeg_device_run(void *priv)
{
	struct mxc_jpeg_ctx *ctx = priv;
	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
	void __iomem *reg = jpeg->base_reg;
	struct device *dev = jpeg->dev;
	struct vb2_buffer *src_buf, *dst_buf;
	unsigned long flags;
	int slot = 0;

	spin_lock_irqsave(&ctx->mxc_jpeg->hw_lock, flags);
	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
	if (!src_buf || !dst_buf) {
		dev_err(dev, "Null src or dst buf\n");
		goto end;
	}

	/*
	 * TODO: this reset should be removed, once we figure out
	 * how to overcome hardware issues both on encoder and decoder
	 */
	mxc_jpeg_sw_reset(reg);
	mxc_jpeg_enable(reg);
	mxc_jpeg_set_l_endian(reg, 1);

	slot = 0; /* TODO get slot */
	mxc_jpeg_enable_slot(reg, slot);
	mxc_jpeg_enable_irq(reg, slot);

	if (ctx->mode == MXC_JPEG_ENCODE) {
		dev_dbg(dev, "Encoding on slot %d\n", slot);
		ctx->enc_state = MXC_JPEG_ENC_CONF;
		mxc_jpeg_config_enc_desc(dst_buf, slot, ctx, src_buf, dst_buf);
		mxc_jpeg_enc_mode_conf(dev, reg);
	} else {
		dev_dbg(dev, "Decoding on slot %d\n", slot);
		print_nbuf_to_eoi(dev, src_buf, 0);
		mxc_jpeg_config_dec_desc(dst_buf, slot, ctx, src_buf, dst_buf);
		mxc_jpeg_dec_mode_go(dev, reg);
	}
end:
	spin_unlock_irqrestore(&ctx->mxc_jpeg->hw_lock, flags);
}

static int mxc_jpeg_decoder_cmd(struct file *file, void *priv,
				struct v4l2_decoder_cmd *cmd)
{
	struct v4l2_fh *fh = file->private_data;
	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(fh);
	struct device *dev = ctx->mxc_jpeg->dev;

	switch (cmd->cmd) {
	case V4L2_DEC_CMD_START:
		dev_dbg(dev, "V4L2_DEC_CMD_START not implemented");
		break;
	case V4L2_DEC_CMD_STOP:
		dev_dbg(dev, "Received V4L2_DEC_CMD_STOP");
		if (v4l2_m2m_num_src_bufs_ready(fh->m2m_ctx) == 0) {
			/* No more src bufs, notify app EOS */
			notify_eos(ctx);
		} else {
			/* will send EOS later*/
			ctx->stopping = 1;
		}
		return 0;
	case V4L2_DEC_CMD_PAUSE:
		dev_dbg(dev, "V4L2_DEC_CMD_PAUSE not implemented");
		break;
	case V4L2_DEC_CMD_RESUME:
		dev_dbg(dev, "V4L2_DEC_CMD_RESUME not implemented");
		break;
	default:
		return -EINVAL;
	}
	return 0;
}

static int mxc_jpeg_encoder_cmd(struct file *file, void *priv,
				struct v4l2_encoder_cmd *cmd)
{
	struct v4l2_fh *fh = file->private_data;
	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(fh);
	struct device *dev = ctx->mxc_jpeg->dev;

	switch (cmd->cmd) {
	case V4L2_ENC_CMD_START:
		dev_dbg(dev, "V4L2_ENC_CMD_START not implemented");
		break;
	case V4L2_ENC_CMD_STOP:
		dev_dbg(dev, "Received V4L2_ENC_CMD_STOP");
		if (v4l2_m2m_num_src_bufs_ready(fh->m2m_ctx) == 0) {
			/* No more src bufs, notify app EOS */
			notify_eos(ctx);
		} else {
			/* will send EOS later*/
			ctx->stopping = 1;
		}
		return 0;
	case V4L2_ENC_CMD_PAUSE:
		dev_dbg(dev, "V4L2_ENC_CMD_PAUSE not implemented");
		break;
	case V4L2_ENC_CMD_RESUME:
		dev_dbg(dev, "V4L2_ENC_CMD_RESUME not implemented");
		break;
	default:
		return -EINVAL;
	}
	return 0;
}

static int mxc_jpeg_job_ready(void *priv)
{
	struct mxc_jpeg_ctx *ctx = priv;
	unsigned int num_src_bufs_ready;
	unsigned int num_dst_bufs_ready;
	unsigned long flags;

	spin_lock_irqsave(&ctx->mxc_jpeg->hw_lock, flags);

	num_src_bufs_ready = v4l2_m2m_num_src_bufs_ready(ctx->fh.m2m_ctx);
	num_dst_bufs_ready = v4l2_m2m_num_dst_bufs_ready(ctx->fh.m2m_ctx);

	spin_unlock_irqrestore(&ctx->mxc_jpeg->hw_lock, flags);

	if (num_src_bufs_ready >= 1 && num_dst_bufs_ready >= 1)
		return 1;
	return 0;
}
static void mxc_jpeg_job_abort(void *priv)
{
	struct mxc_jpeg_ctx *ctx = priv;

	ctx->aborting = 1;
	dev_dbg(ctx->mxc_jpeg->dev, "Abort requested\n");
}

static int mxc_jpeg_queue_setup(struct vb2_queue *q,
				unsigned int *num_buffers,
				unsigned int *num_planes,
				unsigned int sizes[],
				struct device *alloc_ctxs[])
{
	struct mxc_jpeg_ctx *ctx = vb2_get_drv_priv(q);
	struct mxc_jpeg_q_data *q_data = NULL;
	int i;

	q_data = mxc_jpeg_get_q_data(ctx, q->type);
	if (!q_data)
		return -EINVAL;

	*num_planes = q_data->fmt->colplanes;

	for (i = 0; i < *num_planes; i++) {
		/* assuming worst case jpeg compression: 6 x raw file size */
		sizes[i] = q_data->w * q_data->h * 6;

		if (q_data->sizeimage[i] > 0)
			sizes[i] = q_data->sizeimage[i];
	}
	return 0;
}
static int mxc_jpeg_start_streaming(struct vb2_queue *q, unsigned int count)
{
	struct mxc_jpeg_ctx *ctx = vb2_get_drv_priv(q);
	int ret;

	dev_dbg(ctx->mxc_jpeg->dev, "Start streaming ctx=%p", ctx);
	ret = pm_runtime_get_sync(ctx->mxc_jpeg->dev);
	return ret > 0 ? 0 : ret;
}

static void release_active_buffers(struct vb2_queue *q, enum vb2_buffer_state s)
{
	struct vb2_buffer *vb;

	if (!list_empty(&q->queued_list))
		list_for_each_entry(vb, &q->queued_list, queued_entry) {
			if (vb->state == VB2_BUF_STATE_ACTIVE)
				vb2_buffer_done(vb, s);
		}
}

static void mxc_jpeg_stop_streaming(struct vb2_queue *q)
{
	struct mxc_jpeg_ctx *ctx = vb2_get_drv_priv(q);

	dev_dbg(ctx->mxc_jpeg->dev, "Stop streaming ctx=%p", ctx);

	/* Release all active buffers */
	release_active_buffers(q, VB2_BUF_STATE_ERROR);

	pm_runtime_put_sync(&ctx->mxc_jpeg->pdev->dev);
}
struct mxc_jpeg_stream {
	u8 *addr;
	u32 loc;
	u32 end;
};
static u8 get_byte(struct mxc_jpeg_stream *stream)
{
	u8 ret;

	if (stream->loc >= stream->end)
		return -1;
	ret = stream->addr[stream->loc];
	stream->loc++;
	return ret;
}

static int get_sof(struct device *dev,
	struct mxc_jpeg_stream *stream,
	struct mxc_jpeg_sof *sof)
{
	int i;

	if (stream->loc + sizeof(struct mxc_jpeg_sof) >= stream->end)
		return -1;
	memcpy(sof, &stream->addr[stream->loc], sizeof(struct mxc_jpeg_sof));
	_bswap16(&sof->length);
	_bswap16(&sof->height);
	_bswap16(&sof->width);
	dev_dbg(dev, "JPEG SOF: precision=%d\n", sof->precision);
	dev_dbg(dev, "JPEG SOF: height=%d, width=%d\n",
		sof->height, sof->width);
	for (i = 0; i < sof->components_no; i++) {
		dev_dbg(dev, "JPEG SOF: comp_id=%d, H=0x%x, V=0x%x\n",
			sof->comp[i].id, sof->comp[i].v, sof->comp[i].h);
	}
	return 0;
}

static int mxc_jpeg_valid_comp_id(
	struct device *dev,
	struct mxc_jpeg_sof *sof,
	struct mxc_jpeg_sos *sos)
{
	int valid = 1;
	int i;

	for (i = 0; i < sof->components_no; i++)
		if (sof->comp[i].id > MXC_JPEG_MAX_COMPONENTS) {
			valid = 0;
			dev_err(dev, "Component %d has invalid ID: %d",
				i, sof->comp[i].id);
		}
	if (!valid)
		/* patch all comp IDs if at least one is invalid */
		for (i = 0; i < sof->components_no; i++) {
			dev_warn(dev, "Component %d ID patched to: %d",
				 i, i + 1);
			sof->comp[i].id = i + 1;
			sos->comp[i].id = i + 1;
		}

	return valid;
}

static enum mxc_jpeg_image_format mxc_jpeg_get_image_format(
	struct device *dev,
	const struct mxc_jpeg_sof *sof)
{
	if (sof->components_no == 1) {
		dev_dbg(dev, "IMAGE_FORMAT is: MXC_JPEG_GRAY\n");
		return MXC_JPEG_GRAY;
	}
	if (sof->components_no == 3) {
		if (sof->comp[0].h == 2 && sof->comp[0].v == 2 &&
		    sof->comp[1].h == 1 && sof->comp[1].v == 1 &&
		    sof->comp[2].h == 1 && sof->comp[2].v == 1){
			dev_dbg(dev, "IMAGE_FORMAT is: MXC_JPEG_YUV420\n");
			return MXC_JPEG_YUV420;
		}
		if (sof->comp[0].h == 2 && sof->comp[0].v == 1 &&
		    sof->comp[1].h == 1 && sof->comp[1].v == 1 &&
		    sof->comp[2].h == 1 && sof->comp[2].v == 1){
			dev_dbg(dev, "IMAGE_FORMAT is: MXC_JPEG_YUV422\n");
			return MXC_JPEG_YUV422;
		}
		if (sof->comp[0].h == 1 && sof->comp[0].v == 1 &&
		    sof->comp[1].h == 1 && sof->comp[1].v == 1 &&
		    sof->comp[2].h == 1 && sof->comp[2].v == 1){
			dev_dbg(dev, "IMAGE_FORMAT is: MXC_JPEG_YUV444\n");
			return MXC_JPEG_YUV444;
		}
	}
	if (sof->components_no == 4) {
		if (sof->comp[0].h == 1 && sof->comp[0].v == 1 &&
		    sof->comp[1].h == 1 && sof->comp[1].v == 1 &&
		    sof->comp[2].h == 1 && sof->comp[2].v == 1 &&
		    sof->comp[3].h == 1 && sof->comp[3].v == 1){
			/* this is not tested */
			dev_dbg(dev, "IMAGE_FORMAT is: MXC_JPEG_ARGB\n");
			return MXC_JPEG_ARGB;
		}
	}
	dev_err(dev, "Could not identify image format\n");
	return MXC_JPEG_INVALID;
}

static u32 mxc_jpeg_get_line_pitch(
	struct device *dev,
	const struct mxc_jpeg_sof *sof,
	enum mxc_jpeg_image_format img_fmt)
{
	u32 line_pitch;

	switch (img_fmt) {
	case  MXC_JPEG_YUV420:
		line_pitch = sof->width * (sof->precision/8) * 1;
		break;
	case  MXC_JPEG_YUV422:
		line_pitch = sof->width * (sof->precision/8) * 2;
		break;
	case  MXC_JPEG_RGB:
		line_pitch = sof->width * (sof->precision/8) * 3;
		break;
	case  MXC_JPEG_ARGB:
		line_pitch = sof->width * (sof->precision/8) * 4;
		break;
	case  MXC_JPEG_YUV444:
		line_pitch = sof->width * (sof->precision/8) * 3;
		break;
	case  MXC_JPEG_GRAY:
		line_pitch = sof->width * (sof->precision/8) * 1;
		break;
	default:
		line_pitch = sof->width * (sof->precision/8) * 3;
		break;
	}
	dev_dbg(dev, "line_pitch = %d\n", line_pitch);
	return line_pitch;
}

static int mxc_jpeg_parse(struct mxc_jpeg_ctx *ctx,
	struct mxc_jpeg_desc *desc, u8 *src_addr, u32 size)
{
	struct device *dev = ctx->mxc_jpeg->dev;
	struct mxc_jpeg_q_data *q_data_out, *q_data_cap;
	enum v4l2_buf_type cap_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
	struct mxc_jpeg_stream stream;
	bool notfound = true;
	struct mxc_jpeg_sof sof, *psof = 0;
	struct mxc_jpeg_sos *psos = 0;
	u8 byte, *next = 0;
	enum mxc_jpeg_image_format img_fmt;
	u32 fourcc;

	memset(&sof, 0, sizeof(struct mxc_jpeg_sof));
	stream.addr = src_addr;
	stream.end = size;
	stream.loc = 0;
	ctx->dht_needed = true;
	while (notfound) {
		byte = get_byte(&stream);
		if (byte == -1)
			return -EINVAL;
		if (byte != 0xff)
			continue;
		do {
			byte = get_byte(&stream);
		} while (byte == 0xff);
		if (byte == -1)
			return false;
		if (byte == 0)
			continue;
		switch (byte) {
		case DHT:
			/* DHT marker present, no need to inject default one */
			ctx->dht_needed = false;
			break;
		case SOF2: /* Progressive DCF frame definition */
			dev_err(dev,
				"Progressive JPEG isn't supported by hardware");
			return -EINVAL;
		case SOF1: /* Extended sequential DCF frame definition */
		case SOF0: /* Baseline sequential DCF frame definition */
			if (get_sof(dev, &stream, &sof) == -1)
				break;
			next = stream.addr + stream.loc;
			psof = (struct mxc_jpeg_sof *)next;
			break;
		case SOS:
			next = stream.addr + stream.loc;
			psos = (struct mxc_jpeg_sos *)next;
			notfound = false;
			break;
		default:
			notfound = true;
		}
	}
	q_data_out = mxc_jpeg_get_q_data(ctx,
					 V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
	if (q_data_out->w == 0 && q_data_out->h == 0) {
		dev_warn(dev, "Invalid user resolution 0x0");
		dev_warn(dev, "Keeping resolution from JPEG: %dx%d",
			 sof.width, sof.height);
		 q_data_out->w = sof.width;
		 q_data_out->h = sof.height;
	} else if (sof.width != q_data_out->w || sof.height != q_data_out->h) {
		dev_err(dev,
			"Resolution mismatch: %dx%d (JPEG) versus %dx%d(user)",
			sof.width, sof.height, q_data_out->w, q_data_out->h);
		return -EINVAL;
	}
	if (sof.width % 8 != 0 || sof.height % 8 != 0) {
		dev_err(dev, "JPEG width or height not multiple of 8: %dx%d\n",
			sof.width, sof.height);
		return -EINVAL;
	}
	if (sof.width > MXC_JPEG_MAX_WIDTH ||
	    sof.height > MXC_JPEG_MAX_HEIGHT) {
		dev_err(dev, "JPEG width or height should be <= 8192: %dx%d\n",
			sof.width, sof.height);
		return -EINVAL;
	}
	if (sof.width < MXC_JPEG_MIN_WIDTH ||
	    sof.height < MXC_JPEG_MIN_HEIGHT) {
		dev_err(dev, "JPEG width or height should be > 64: %dx%d\n",
			sof.width, sof.height);
		return -EINVAL;
	}
	if (sof.components_no > MXC_JPEG_MAX_COMPONENTS) {
		dev_err(dev, "JPEG number of components should be <=%d",
			MXC_JPEG_MAX_COMPONENTS);
		return -EINVAL;
	}
	/* check and, if necessary, patch component IDs*/
	if (!mxc_jpeg_valid_comp_id(dev, psof, psos))
		dev_warn(dev, "JPEG component identifiers should be 0-3 or 1-4");

	img_fmt = mxc_jpeg_get_image_format(dev, &sof);
	if (img_fmt == MXC_JPEG_INVALID)
		return -EINVAL;
	if (mxc_jpeg_imgfmt_to_fourcc(img_fmt, &fourcc)) {
		dev_err(dev, "Fourcc not found for %d", img_fmt);
		return -EINVAL;
	}

	q_data_cap = mxc_jpeg_get_q_data(ctx, cap_type);
	if (q_data_cap->w == 0 && q_data_cap->h == 0) {
		dev_dbg(dev, "capture queue format is not set-up yet, using output queue settings");
		q_data_cap->w = q_data_out->w;
		q_data_cap->h = q_data_out->h;
		q_data_cap->fmt = mxc_jpeg_find_format(ctx, fourcc);
		q_data_cap->w_adjusted = q_data_cap->w;
		q_data_cap->h_adjusted = q_data_cap->h;
		/*
		 * align up the resolution for CAST IP,
		 * but leave the buffer resolution unchanged
		 * TODO check if jpeg_parse may be called later
		 */
		v4l_bound_align_image(&q_data_cap->w_adjusted,
				      q_data_cap->w_adjusted,  /* adjust up */
				      MXC_JPEG_MAX_WIDTH,
				      q_data_cap->fmt->h_align,
				      &q_data_cap->h_adjusted,
				      q_data_cap->h_adjusted, /* adjust up */
				      MXC_JPEG_MAX_HEIGHT,
				      q_data_cap->fmt->v_align,
				      0);
	}
	if (fourcc != q_data_cap->fmt->fourcc) {
		char *jpeg_format_name = fourcc_to_str(fourcc);
		char *user_format_name = fourcc_to_str(q_data_cap->fmt->fourcc);

		dev_warn(dev,
			 "Pixel format mismatch: jpeg(%s) versus user (%s)",
			 jpeg_format_name, user_format_name);
		dev_warn(dev, "Keeping user settings\n");
		kfree(jpeg_format_name);
		kfree(user_format_name);
		img_fmt = mxc_jpeg_fourcc_to_imgfmt(q_data_cap->fmt->fourcc);
	}
	/* use adjusted resolution for CAST IP job */
	sof.width = q_data_cap->w_adjusted;
	sof.height = q_data_cap->h_adjusted;
	desc->imgsize = sof.width << 16 | sof.height;
	dev_dbg(dev, "JPEG imgsize = 0x%x (%dx%d)\n", desc->imgsize,
		sof.width, sof.height);
	desc->stm_ctrl &= ~STM_CTRL_IMAGE_FORMAT(0xF); /* clear image format */
	desc->stm_ctrl |= STM_CTRL_IMAGE_FORMAT(img_fmt);
	desc->line_pitch = mxc_jpeg_get_line_pitch(dev, &sof, img_fmt);
	q_data_cap->stride = desc->line_pitch;
	q_data_cap->sizeimage[0] = q_data_cap->w * q_data_cap->h *
					q_data_cap->fmt->depth / 8;
	q_data_cap->sizeimage[1] = 0;
	if (q_data_cap->fmt->fourcc == V4L2_PIX_FMT_NV12) {
		q_data_cap->sizeimage[0] = q_data_cap->sizeimage[0] * 2 / 3;
		q_data_cap->sizeimage[1] = q_data_cap->sizeimage[0] / 2;
	}

	return 0;
}

static void mxc_jpeg_buf_queue(struct vb2_buffer *vb)
{
	int ret;
	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
	struct mxc_jpeg_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
	int slot = 0; /* TODO get slot*/

	if (vb->vb2_queue->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
		goto end;

	/* for V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE */
	if (ctx->mode != MXC_JPEG_DECODE)
		goto end;
	ret = mxc_jpeg_parse(ctx,
			ctx->mxc_jpeg->slot_data[slot].desc,
			(u8 *)vb2_plane_vaddr(vb, 0),
			vb2_get_plane_payload(vb, 0));
	if (ret) {
		v4l2_err(&ctx->mxc_jpeg->v4l2_dev,
			 "driver does not support this resolution/format\n");
		vb2_buffer_done(vb, VB2_BUF_STATE_ERROR);
		return;
	}


	if (ctx->state == MXC_JPEG_INIT) {
		static const struct v4l2_event ev_src_ch = {
			.type = V4L2_EVENT_SOURCE_CHANGE,
			.u.src_change.changes =
			V4L2_EVENT_SRC_CH_RESOLUTION,
		};

		v4l2_event_queue_fh(&ctx->fh, &ev_src_ch);
		ctx->state = MXC_JPEG_RUNNING;
	}

end:
	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
}
static int mxc_jpeg_buf_prepare(struct vb2_buffer *vb)
{
	struct mxc_jpeg_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
	struct mxc_jpeg_q_data *q_data = NULL;
	struct device *dev = ctx->mxc_jpeg->dev;
	unsigned long sizeimage;
	int i;

	q_data = mxc_jpeg_get_q_data(ctx, vb->vb2_queue->type);
	if (!q_data)
		return -EINVAL;
	for (i = 0; i < q_data->fmt->colplanes; i++) {
		sizeimage = q_data->sizeimage[i];
		if (vb2_plane_size(vb, i) < sizeimage) {
			dev_err(dev, "plane %d too small (%lu < %lu)",
				i, vb2_plane_size(vb, i), sizeimage);
			return -EINVAL;
		}
		vb2_set_plane_payload(vb, i, sizeimage);
	}
	return 0;
}

static void mxc_jpeg_buf_clean(struct vb2_buffer *vb)
{
	return;
}

static const struct vb2_ops mxc_jpeg_qops = {
	.queue_setup		= mxc_jpeg_queue_setup,
	.wait_prepare		= vb2_ops_wait_prepare,
	.wait_finish		= vb2_ops_wait_finish,
	.buf_prepare		= mxc_jpeg_buf_prepare,
	.buf_cleanup		= mxc_jpeg_buf_clean,
	.start_streaming	= mxc_jpeg_start_streaming,
	.stop_streaming		= mxc_jpeg_stop_streaming,
	.buf_queue		= mxc_jpeg_buf_queue,
};
static int mxc_jpeg_queue_init(void *priv, struct vb2_queue *src_vq,
			       struct vb2_queue *dst_vq)
{
	struct mxc_jpeg_ctx *ctx = priv;
	int ret;

	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
	src_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
	src_vq->drv_priv = ctx;
	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
	src_vq->ops = &mxc_jpeg_qops;
	src_vq->mem_ops = &vb2_dma_contig_memops;
	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
	src_vq->lock = &ctx->mxc_jpeg->lock;
	src_vq->dev = ctx->mxc_jpeg->dev;
	src_vq->allow_zero_bytesused = 1; /* keep old userspace apps working */

	ret = vb2_queue_init(src_vq);
	if (ret)
		return ret;

	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
	dst_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
	dst_vq->drv_priv = ctx;
	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
	dst_vq->ops = &mxc_jpeg_qops;
	dst_vq->mem_ops = &vb2_dma_contig_memops;
	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
	dst_vq->lock = &ctx->mxc_jpeg->lock;
	dst_vq->dev = ctx->mxc_jpeg->dev;

	ret = vb2_queue_init(dst_vq);
	return ret;
}

static int mxc_get_free_slot(struct mxc_jpeg_slot_data slot_data[], int n)
{
	int free_slot = 0;

	while (slot_data[free_slot].used && free_slot < n)
		free_slot++;

	return free_slot; /* >=n when there are no more free slots */
}

static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg, int slot)
{
	/* allocate descriptor for decoding/encoding phase */
	jpeg->slot_data[slot].desc = dma_zalloc_coherent(jpeg->dev,
		sizeof(struct mxc_jpeg_desc),
		&jpeg->slot_data[slot].desc_handle, GFP_ATOMIC);
	if (!jpeg->slot_data[slot].desc)
		goto err;

	/* allocate descriptor for configuration phase (encoder only) */
	jpeg->slot_data[slot].cfg_desc = dma_zalloc_coherent(jpeg->dev,
		sizeof(struct mxc_jpeg_desc),
		&jpeg->slot_data[slot].cfg_desc_handle, GFP_ATOMIC);
	if (!jpeg->slot_data[slot].cfg_desc)
		goto err;

	/* allocate configuration stream */
	jpeg->slot_data[slot].cfg_stream_vaddr = dma_zalloc_coherent(
		jpeg->dev,
		MXC_JPEG_MAX_CFG_STREAM,
		&jpeg->slot_data[slot].cfg_stream_handle, GFP_ATOMIC);
	if (!jpeg->slot_data[slot].cfg_stream_vaddr)
		goto err;

	jpeg->slot_data[slot].used = true;

	return true;
err:
	dev_err(jpeg->dev, "Could not allocate descriptors for slot %d", slot);
	return false;
}

static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg, int slot)
{
	if (slot >= MXC_MAX_SLOTS) {
		dev_err(jpeg->dev, "Invalid slot %d, nothing to free.", slot);
		return;
	}

	/* free descriptor for decoding/encoding phase */
	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
			  jpeg->slot_data[slot].desc,
			  jpeg->slot_data[slot].desc_handle);

	/* free descriptor for configuration phase (encoder only) */
	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
			  jpeg->slot_data[slot].cfg_desc,
			  jpeg->slot_data[slot].cfg_desc_handle);

	/* free configuration stream */
	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
			  jpeg->slot_data[slot].cfg_stream_vaddr,
			  jpeg->slot_data[slot].cfg_stream_handle);

	jpeg->slot_data[slot].used = false;
}

static int mxc_jpeg_open(struct file *file)
{
	struct mxc_jpeg_dev *mxc_jpeg = video_drvdata(file);
	struct video_device *mxc_vfd = video_devdata(file);
	struct device *dev = mxc_jpeg->dev;
	struct mxc_jpeg_ctx *ctx;
	struct mxc_jpeg_fmt *out_fmt, *cap_fmt;
	int ret = 0;

	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
	if (!ctx)
		return -ENOMEM;

	if (mutex_lock_interruptible(&mxc_jpeg->lock)) {
		ret = -ERESTARTSYS;
		goto free;
	}

	pm_runtime_get_sync(mxc_jpeg->dev);

	v4l2_fh_init(&ctx->fh, mxc_vfd);
	file->private_data = &ctx->fh;
	v4l2_fh_add(&ctx->fh);

	ctx->mxc_jpeg = mxc_jpeg;
	if (mxc_jpeg->mode == MXC_JPEG_ENCODE) {
		ctx->mode = MXC_JPEG_ENCODE;
		out_fmt = mxc_jpeg_find_format(ctx, V4L2_PIX_FMT_RGB24);
		cap_fmt = mxc_jpeg_find_format(ctx, V4L2_PIX_FMT_JPEG);
	} else {
		ctx->mode = MXC_JPEG_DECODE;
		out_fmt = mxc_jpeg_find_format(ctx, V4L2_PIX_FMT_JPEG);
		cap_fmt = mxc_jpeg_find_format(ctx, V4L2_PIX_FMT_RGB24);
	}
	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(mxc_jpeg->m2m_dev, ctx,
					    mxc_jpeg_queue_init);
	ctx->out_q.fmt = out_fmt;
	ctx->cap_q.fmt = cap_fmt;
	if (IS_ERR(ctx->fh.m2m_ctx)) {
		ret = PTR_ERR(ctx->fh.m2m_ctx);
		goto error;
	}

	ctx->slot = mxc_get_free_slot(mxc_jpeg->slot_data, MXC_MAX_SLOTS);
	if (ctx->slot >= MXC_MAX_SLOTS) {
		dev_err(dev, "No more free slots\n");
		ret = -EBUSY;
		goto error;
	}
	if (!mxc_jpeg_alloc_slot_data(mxc_jpeg, ctx->slot)) {
		ret = -ENOMEM;
		goto error;
	}

	if (mxc_jpeg->mode == MXC_JPEG_DECODE)
		dev_dbg(dev, "Opened JPEG decoder instance on slot %d.",
			ctx->slot);
	else
		dev_dbg(dev, "Opened JPEG encoder instance on slot %d.",
			ctx->slot);
	mutex_unlock(&mxc_jpeg->lock);
	return 0;

error:
	v4l2_fh_del(&ctx->fh);
	v4l2_fh_exit(&ctx->fh);
	mutex_unlock(&mxc_jpeg->lock);
free:
	kfree(ctx);
	return ret;
}

static int mxc_jpeg_querycap(struct file *file, void *priv,
			     struct v4l2_capability *cap)
{
	struct mxc_jpeg_dev *mxc_jpeg = video_drvdata(file);

	strlcpy(cap->driver, MXC_JPEG_NAME " decoder", sizeof(cap->driver));
	strlcpy(cap->card, MXC_JPEG_NAME " decoder", sizeof(cap->card));
	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
		 dev_name(mxc_jpeg->dev));
	cap->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M_MPLANE;
	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;

	return 0;
}
static int mxc_jpeg_enum_fmt_vid_cap(struct file *file, void *priv,
				     struct v4l2_fmtdesc *f)
{
	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(priv);

	if (ctx->mode == MXC_JPEG_ENCODE)
		return enum_fmt(mxc_formats, MXC_JPEG_NUM_FORMATS, f,
			MXC_IN_FORMAT);
	else
		return enum_fmt(mxc_formats, MXC_JPEG_NUM_FORMATS, f,
			MXC_OUT_FORMAT);
}

static int mxc_jpeg_enum_fmt_vid_out(struct file *file, void *priv,
				     struct v4l2_fmtdesc *f)
{
	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(priv);

	if (ctx->mode == MXC_JPEG_DECODE)
		return enum_fmt(mxc_formats, MXC_JPEG_NUM_FORMATS, f,
				MXC_IN_FORMAT);
	else
		return enum_fmt(mxc_formats, MXC_JPEG_NUM_FORMATS, f,
				MXC_OUT_FORMAT);
}

static int mxc_jpeg_bound_align_image(u32 *w, unsigned int wmin,
				       unsigned int wmax, unsigned int walign,
				       u32 *h, unsigned int hmin,
				       unsigned int hmax, unsigned int halign)
{
	int width, height, w_step, h_step;

	width = *w;
	height = *h;
	w_step = 1 << walign;
	h_step = 1 << halign;

	v4l_bound_align_image(w, wmin, wmax, walign, h, hmin, hmax, halign, 0);
	if (*w < width && (*w + w_step) <= wmax)
		*w += w_step;
	if (*h < height && (*h + h_step) <= hmax)
		*h += h_step;

	return (width != *w || height != *h);
}
static int mxc_jpeg_try_fmt(struct v4l2_format *f, struct mxc_jpeg_fmt *fmt,
			    struct mxc_jpeg_ctx *ctx, int q_type)
{
	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
	struct v4l2_plane_pix_format *pfmt;
	u32 w = pix_mp->width;
	u32 h = pix_mp->height;
	unsigned int mode = ctx->mode;
	int i;
	bool is_nv12 = (fmt->fourcc == V4L2_PIX_FMT_NV12);

	memset(pix_mp->reserved, 0, sizeof(pix_mp->reserved));
	pix_mp->field = V4L2_FIELD_NONE;
	pix_mp->num_planes = fmt->colplanes;
	pix_mp->pixelformat = fmt->fourcc;
	mxc_jpeg_bound_align_image(&w,
					MXC_JPEG_MIN_WIDTH,
					MXC_JPEG_MAX_WIDTH,
					MXC_JPEG_W_ALIGN,
					&h,
					MXC_JPEG_MIN_HEIGHT,
					MXC_JPEG_MAX_HEIGHT,
					MXC_JPEG_H_ALIGN);

	for (i = 0; i < pix_mp->num_planes; i++) {
		pfmt = &pix_mp->plane_fmt[i];
		memset(pfmt->reserved, 0, sizeof(pfmt->reserved));

		/* TODO try_fmt should not modify the state, move to s_fmt */
		if (q_type == MXC_JPEG_FMT_TYPE_ENC &&
		    mode == MXC_JPEG_DECODE) {
			pfmt->bytesperline = 0;
			/* Source size must be aligned to 128 */
			pfmt->sizeimage = mxc_jpeg_align(pfmt->sizeimage, 128);
			if (pfmt->sizeimage == 0)
				pfmt->sizeimage = MXC_JPEG_DEFAULT_SIZEIMAGE;
		} else if (q_type == MXC_JPEG_FMT_TYPE_RAW &&
		    mode == MXC_JPEG_DECODE) {
			pfmt->bytesperline = w * (fmt->depth / 8);
			pfmt->sizeimage = w * h * fmt->depth / 8;
			if (is_nv12 && i == 0) /* luma plane */
				pfmt->sizeimage = pfmt->sizeimage * 2 / 3;
			else if (is_nv12 && i == 1) /* chroma plane */
				pfmt->sizeimage = pfmt->sizeimage * 1 / 3;
		} else if (q_type == MXC_JPEG_FMT_TYPE_ENC &&
		    mode == MXC_JPEG_ENCODE) {
			pfmt->bytesperline = 0;
			/* assuming worst jpeg compression */
			pfmt->sizeimage = w * h * 6;
		} else { /* MXC_JPEG_FMT_TYPE_RAW && MXC_JPEG_ENCODE */
			pfmt->bytesperline = w * (fmt->depth / 8);
			pfmt->sizeimage = w * h * fmt->depth / 8;
			if (is_nv12 && i == 0) /* luma plane */
				pfmt->sizeimage = pfmt->sizeimage * 2 / 3;
			else if (is_nv12 && i == 1) /* chroma plane */
				pfmt->sizeimage = pfmt->sizeimage * 1 / 3;
		}
	}
	pix_mp->colorspace = V4L2_COLORSPACE_REC709;

	return 0;
}
static int mxc_jpeg_try_fmt_vid_cap(struct file *file, void *priv,
				struct v4l2_format *f)
{
	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(priv);
	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
	struct device *dev = jpeg->dev;
	struct mxc_jpeg_fmt *fmt;
	u32 fourcc = f->fmt.pix_mp.pixelformat;

	int q_type = (ctx->mode == MXC_JPEG_DECODE) ?
		     MXC_JPEG_FMT_TYPE_RAW : MXC_JPEG_FMT_TYPE_ENC;

	fmt = mxc_jpeg_find_format(ctx, f->fmt.pix_mp.pixelformat);
	if (!fmt || (fmt->flags != q_type)) {
		char *format_name = fourcc_to_str(fourcc);

		dev_err(dev, "Format not supported: %s.\n",
			format_name);
		kfree(format_name);
		return -1;
	}
	return mxc_jpeg_try_fmt(f, fmt, ctx, q_type);
}
static int mxc_jpeg_try_fmt_vid_out(struct file *file, void *priv,
				struct v4l2_format *f)
{
	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(priv);
	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
	struct device *dev = jpeg->dev;
	struct mxc_jpeg_fmt *fmt;
	u32 fourcc = f->fmt.pix_mp.pixelformat;

	int q_type = (ctx->mode == MXC_JPEG_ENCODE) ?
		     MXC_JPEG_FMT_TYPE_RAW : MXC_JPEG_FMT_TYPE_ENC;

	fmt = mxc_jpeg_find_format(ctx, fourcc);
	if (!fmt || (fmt->flags != q_type)) {
		char *format_name = fourcc_to_str(fourcc);

		dev_err(dev, "Format not supported: %s.\n",
			format_name);
		kfree(format_name);
		return -1;
	}
	return mxc_jpeg_try_fmt(f, fmt, ctx, q_type);
}
static int mxc_jpeg_s_fmt(struct mxc_jpeg_ctx *ctx,
			  struct v4l2_format *f)
{
	struct vb2_queue *vq;
	struct mxc_jpeg_q_data *q_data = NULL;
	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
	int i;
	void *cfg_stream_vaddr = jpeg->slot_data[ctx->slot].cfg_stream_vaddr;

	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
	if (!vq)
		return -EINVAL;

	q_data = mxc_jpeg_get_q_data(ctx, f->type);

	if (vb2_is_busy(vq)) {
		v4l2_err(&jpeg->v4l2_dev, "queue busy\n");
		return -EBUSY;
	}

	q_data->fmt = mxc_jpeg_find_format(ctx, pix_mp->pixelformat);
	q_data->w = pix_mp->width;
	q_data->h = pix_mp->height;

	q_data->w_adjusted = q_data->w;
	q_data->h_adjusted = q_data->h;
	if (ctx->mode == MXC_JPEG_DECODE) {
		/*
		 * align up the resolution for CAST IP,
		 * but leave the buffer resolution unchanged
		 * TODO check if CAST IP will write past the buffer
		 */
		v4l_bound_align_image(&q_data->w_adjusted,
				      q_data->w_adjusted,  /* adjust upwards */
				      MXC_JPEG_MAX_WIDTH,
				      q_data->fmt->h_align,
				      &q_data->h_adjusted,
				      q_data->h_adjusted, /* adjust upwards */
				      MXC_JPEG_MAX_HEIGHT,
				      q_data->fmt->v_align,
				      0);
		/*
		 * the config stream contains a huffman table, use it
		 * to inject a default huffman table for decoder
		 */
		if (q_data->fmt->flags == MXC_JPEG_FMT_TYPE_ENC) {
			jpeg->slot_data[ctx->slot].cfg_stream_size =
			mxc_jpeg_setup_cfg_stream(cfg_stream_vaddr,
						  V4L2_PIX_FMT_YUYV,
						  MXC_JPEG_MIN_WIDTH,
						  MXC_JPEG_MIN_HEIGHT);
		}
	} else {
		/*
		 * align down the resolution for CAST IP,
		 * but leave the buffer resolution unchanged
		 */
		v4l_bound_align_image(&q_data->w_adjusted,
				      MXC_JPEG_MIN_WIDTH,
				      q_data->w_adjusted, /* adjust downwards*/
				      q_data->fmt->h_align,
				      &q_data->h_adjusted,
				      MXC_JPEG_MIN_HEIGHT,
				      q_data->h_adjusted, /* adjust downwards*/
				      q_data->fmt->v_align,
				      0);
		if (q_data->fmt->flags == MXC_JPEG_FMT_TYPE_RAW)
			jpeg->slot_data[ctx->slot].cfg_stream_size =
			mxc_jpeg_setup_cfg_stream(cfg_stream_vaddr,
						  q_data->fmt->fourcc,
						  q_data->w_adjusted,
						  q_data->h_adjusted);
	}

	for (i = 0; i < pix_mp->num_planes; i++) {
		q_data->bytesperline[i] = pix_mp->plane_fmt[i].bytesperline;
		q_data->sizeimage[i] = pix_mp->plane_fmt[i].sizeimage;
	}

	return 0;
}
static int mxc_jpeg_s_fmt_vid_cap(struct file *file, void *priv,
				struct v4l2_format *f)
{
	int ret;

	ret = mxc_jpeg_try_fmt_vid_cap(file, priv, f);
	if (ret)
		return ret;

	return mxc_jpeg_s_fmt(mxc_jpeg_fh_to_ctx(priv), f);
}
static int mxc_jpeg_s_fmt_vid_out(struct file *file, void *priv,
				struct v4l2_format *f)
{
	int ret;

	ret = mxc_jpeg_try_fmt_vid_out(file, priv, f);
	if (ret)
		return ret;

	return mxc_jpeg_s_fmt(mxc_jpeg_fh_to_ctx(priv), f);
}
static int mxc_jpeg_g_fmt_vid_cap(struct file *file, void *priv,
				struct v4l2_format *f)
{
	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(priv);
	struct v4l2_pix_format_mplane   *pix_mp = &f->fmt.pix_mp;
	struct mxc_jpeg_q_data *q_data = mxc_jpeg_get_q_data(ctx, f->type);
	int i;

	pix_mp->pixelformat = q_data->fmt->fourcc;
	pix_mp->width = q_data->w;
	pix_mp->height = q_data->h;
	pix_mp->field = V4L2_FIELD_NONE;
	pix_mp->colorspace = V4L2_COLORSPACE_REC709;
	pix_mp->num_planes = q_data->fmt->colplanes;
	for (i = 0; i < pix_mp->num_planes; i++) {
		pix_mp->plane_fmt[i].bytesperline = q_data->stride;
		pix_mp->plane_fmt[i].sizeimage = q_data->sizeimage[i];
	}

	return 0;
}
static int mxc_jpeg_g_fmt_vid_out(struct file *file, void *priv,
				struct v4l2_format *f)
{
	return 0;
}

static int mxc_jpeg_subscribe_event(struct v4l2_fh *fh,
		const struct v4l2_event_subscription *sub)
{
	switch (sub->type) {
	case V4L2_EVENT_EOS:
		return v4l2_event_subscribe(fh, sub, 0, NULL);
	case V4L2_EVENT_SOURCE_CHANGE:
		return v4l2_src_change_event_subscribe(fh, sub);
	default:
		return -EINVAL;
	}
}

static int mxc_jpeg_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
{
	struct v4l2_fh *fh = file->private_data;
	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(priv);
	struct device *dev = ctx->mxc_jpeg->dev;
	struct vb2_queue *vq;

	dev_dbg(dev, "QBUF type=%d, index=%d", buf->type, buf->index);
	vq = v4l2_m2m_get_vq(fh->m2m_ctx, buf->type);
	if (buf->index >= vq->num_buffers) {
		dev_err(dev, "buffer index out of range\n");
		return -EINVAL;
	}

	return v4l2_m2m_qbuf(file, fh->m2m_ctx, buf);
}

static int mxc_jpeg_dqbuf(struct file *file, void *priv,
			  struct v4l2_buffer *buf)
{
	struct v4l2_fh *fh = file->private_data;
	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(priv);
	struct device *dev = ctx->mxc_jpeg->dev;
	int num_src_ready = v4l2_m2m_num_src_bufs_ready(fh->m2m_ctx);
	int ret;

	dev_dbg(dev, "DQBUF type=%d, index=%d", buf->type, buf->index);
	if (ctx->stopping == 1	&& num_src_ready == 0) {
		/* No more src bufs, notify app EOS */
		notify_eos(ctx);
		ctx->stopping = 0;
	}

	ret = v4l2_m2m_dqbuf(file, fh->m2m_ctx, buf);
	buf->field = V4L2_FIELD_NONE;

	return ret;
}
static const struct v4l2_ioctl_ops mxc_jpeg_ioctl_ops = {
	.vidioc_querycap		= mxc_jpeg_querycap,
	.vidioc_enum_fmt_vid_cap_mplane	= mxc_jpeg_enum_fmt_vid_cap,
	.vidioc_enum_fmt_vid_out_mplane	= mxc_jpeg_enum_fmt_vid_out,

	.vidioc_try_fmt_vid_cap_mplane		= mxc_jpeg_try_fmt_vid_cap,
	.vidioc_try_fmt_vid_out_mplane		= mxc_jpeg_try_fmt_vid_out,

	.vidioc_s_fmt_vid_cap_mplane		= mxc_jpeg_s_fmt_vid_cap,
	.vidioc_s_fmt_vid_out_mplane		= mxc_jpeg_s_fmt_vid_out,

	.vidioc_g_fmt_vid_cap_mplane		= mxc_jpeg_g_fmt_vid_cap,
	.vidioc_g_fmt_vid_out_mplane		= mxc_jpeg_g_fmt_vid_out,

	.vidioc_subscribe_event		= mxc_jpeg_subscribe_event,
	.vidioc_decoder_cmd		= mxc_jpeg_decoder_cmd,
	.vidioc_encoder_cmd		= mxc_jpeg_encoder_cmd,

	.vidioc_qbuf			= mxc_jpeg_qbuf,
	.vidioc_dqbuf                   = mxc_jpeg_dqbuf,

	.vidioc_create_bufs		= v4l2_m2m_ioctl_create_bufs,
	.vidioc_prepare_buf		= v4l2_m2m_ioctl_prepare_buf,
	.vidioc_reqbufs                 = v4l2_m2m_ioctl_reqbufs,
	.vidioc_querybuf                = v4l2_m2m_ioctl_querybuf,
	.vidioc_expbuf                  = v4l2_m2m_ioctl_expbuf,
	.vidioc_streamon                = v4l2_m2m_ioctl_streamon,
	.vidioc_streamoff               = v4l2_m2m_ioctl_streamoff,
};

static int mxc_jpeg_release(struct file *file)
{
	struct mxc_jpeg_dev *mxc_jpeg = video_drvdata(file);
	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(file->private_data);
	struct device *dev = mxc_jpeg->dev;

	mutex_lock(&mxc_jpeg->lock);
	if (mxc_jpeg->mode == MXC_JPEG_DECODE)
		dev_dbg(dev, "Release JPEG decoder instance on slot %d.",
			ctx->slot);
	else
		dev_dbg(dev, "Release JPEG encoder instance on slot %d.",
			ctx->slot);
	mxc_jpeg_free_slot_data(mxc_jpeg, ctx->slot);
	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
	v4l2_fh_del(&ctx->fh);
	v4l2_fh_exit(&ctx->fh);
	kfree(ctx);
	mutex_unlock(&mxc_jpeg->lock);

	pm_runtime_put_sync(mxc_jpeg->dev);
	return 0;
}

static const struct v4l2_file_operations mxc_jpeg_fops = {
	.owner		= THIS_MODULE,
	.open		= mxc_jpeg_open,
	.release	= mxc_jpeg_release,
	.poll		= v4l2_m2m_fop_poll,
	.unlocked_ioctl	= video_ioctl2,
	.mmap		= v4l2_m2m_fop_mmap,
};
static struct v4l2_m2m_ops mxc_jpeg_m2m_ops = {
	.device_run	= mxc_jpeg_device_run,
	.job_ready	= mxc_jpeg_job_ready,
	.job_abort	= mxc_jpeg_job_abort,
};

static int mxc_jpeg_probe(struct platform_device *pdev)
{
	struct mxc_jpeg_dev *jpeg;
	struct device *dev = &pdev->dev;
	struct resource *res;
	int dec_irq;
	int ret;
	int mode;
	const struct of_device_id *of_id;

	of_id = of_match_node(mxc_jpeg_match, dev->of_node);
	mode = (int)(u64) of_id->data;

	jpeg = devm_kzalloc(dev, sizeof(struct mxc_jpeg_dev), GFP_KERNEL);
	if (!jpeg)
		return -ENOMEM;

	mutex_init(&jpeg->lock);
	spin_lock_init(&jpeg->hw_lock);

	if (dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32))) {
		dev_err(&pdev->dev, "No suitable DMA available.\n");
		return -EINVAL;
	}

	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
	dec_irq = platform_get_irq(pdev, 0);
	if (!res || dec_irq < 0) {
		dev_err(&pdev->dev, "Failed to get dec_irq %d.\n", dec_irq);
		ret = -EINVAL;
		goto err_irq;
	}
	ret = devm_request_irq(&pdev->dev, dec_irq, mxc_jpeg_dec_irq, 0,
			       pdev->name, jpeg);
	if (ret) {
		dev_err(&pdev->dev, "Failed to request dec_irq %d (%d)\n",
			dec_irq, ret);
		ret = -EINVAL;
		goto err_irq;
	}
	jpeg->base_reg = devm_ioremap_resource(&pdev->dev, res);
	if (IS_ERR(jpeg->base_reg))
		return PTR_ERR(jpeg->base_reg);

	jpeg->pdev = pdev;
	jpeg->dev = dev;
	jpeg->mode = mode;

	/* Start clock */
	jpeg->clk_ipg = devm_clk_get(dev, "ipg");
	if (IS_ERR(jpeg->clk_ipg)) {
		dev_err(dev, "failed to get clock: ipg\n");
		goto err_clk;
	}

	jpeg->clk_per = devm_clk_get(dev, "per");
	if (IS_ERR(jpeg->clk_per)) {
		dev_err(dev, "failed to get clock: per\n");
		goto err_clk;
	}

	/* v4l2 */
	ret = v4l2_device_register(dev, &jpeg->v4l2_dev);
	if (ret) {
		dev_err(dev, "failed to register v4l2 device\n");
		goto err_register;
	}
	jpeg->m2m_dev = v4l2_m2m_init(&mxc_jpeg_m2m_ops);
	if (IS_ERR(jpeg->m2m_dev)) {
		dev_err(dev, "failed to register v4l2 device\n");
		goto err_m2m;
	}

	jpeg->dec_vdev = video_device_alloc();
	if (!jpeg->dec_vdev) {
		dev_err(dev, "failed to register v4l2 device\n");
		goto err_vdev_alloc;
	}
	if (mode == MXC_JPEG_ENCODE)
		snprintf(jpeg->dec_vdev->name,
				sizeof(jpeg->dec_vdev->name),
				"%s-enc", MXC_JPEG_M2M_NAME);
	else
		snprintf(jpeg->dec_vdev->name,
				sizeof(jpeg->dec_vdev->name),
				"%s-dec", MXC_JPEG_M2M_NAME);

	jpeg->dec_vdev->fops = &mxc_jpeg_fops;
	jpeg->dec_vdev->ioctl_ops = &mxc_jpeg_ioctl_ops;
	jpeg->dec_vdev->minor = -1;
	jpeg->dec_vdev->release = video_device_release;
	jpeg->dec_vdev->lock = &jpeg->lock; /* lock for ioctl serialization*/
	jpeg->dec_vdev->v4l2_dev = &jpeg->v4l2_dev;
	jpeg->dec_vdev->vfl_dir = VFL_DIR_M2M;
	jpeg->dec_vdev->device_caps = V4L2_CAP_STREAMING |
					V4L2_CAP_VIDEO_M2M_MPLANE;

	ret = video_register_device(jpeg->dec_vdev, VFL_TYPE_GRABBER, -1);
	if (ret) {
		dev_err(dev, "failed to register video device\n");
		goto err_vdev_register;
	}
	video_set_drvdata(jpeg->dec_vdev, jpeg);
	if (mode == MXC_JPEG_ENCODE)
		v4l2_info(&jpeg->v4l2_dev,
			"encoder device registered as /dev/video%d (%d,%d)\n",
			jpeg->dec_vdev->num, VIDEO_MAJOR,
			jpeg->dec_vdev->minor);
	else
		v4l2_info(&jpeg->v4l2_dev,
			"decoder device registered as /dev/video%d (%d,%d)\n",
			jpeg->dec_vdev->num, VIDEO_MAJOR,
			jpeg->dec_vdev->minor);

	platform_set_drvdata(pdev, jpeg);
	pm_runtime_enable(dev);
	return 0;

err_vdev_register:
	video_device_release(jpeg->dec_vdev);

err_vdev_alloc:
	v4l2_m2m_release(jpeg->m2m_dev);

err_m2m:
	v4l2_device_unregister(&jpeg->v4l2_dev);

err_register:
err_irq:
err_clk:
	return ret;
}

#ifdef CONFIG_PM
static int mxc_jpeg_runtime_resume(struct device *dev)
{
	struct mxc_jpeg_dev *jpeg = dev_get_drvdata(dev);
	int ret;

	ret = clk_prepare_enable(jpeg->clk_ipg);
	if (ret < 0) {
		dev_err(dev, "failed to enable clock: ipg\n");
		goto err_clk;
	}

	ret = clk_prepare_enable(jpeg->clk_per);
	if (ret < 0) {
		dev_err(dev, "failed to enable clock: per\n");
		goto err_clk;
	}

	return 0;

err_clk:
	return ret;
}

static int mxc_jpeg_runtime_suspend(struct device *dev)
{
	struct mxc_jpeg_dev *jpeg = dev_get_drvdata(dev);

	clk_disable_unprepare(jpeg->clk_ipg);
	clk_disable_unprepare(jpeg->clk_per);

	return 0;
}
#endif

static const struct dev_pm_ops	mxc_jpeg_pm_ops = {
	SET_RUNTIME_PM_OPS(mxc_jpeg_runtime_suspend,
			   mxc_jpeg_runtime_resume, NULL)
};

static int mxc_jpeg_remove(struct platform_device *pdev)
{
	struct mxc_jpeg_dev *jpeg = platform_get_drvdata(pdev);

	pm_runtime_disable(&pdev->dev);
	video_unregister_device(jpeg->dec_vdev);
	video_device_release(jpeg->dec_vdev);
	v4l2_m2m_release(jpeg->m2m_dev);
	v4l2_device_unregister(&jpeg->v4l2_dev);

	return 0;
}

MODULE_DEVICE_TABLE(of, mxc_jpeg_match);

static struct platform_driver mxc_jpeg_driver = {
	.probe = mxc_jpeg_probe,
	.remove = mxc_jpeg_remove,
	.driver = {
		.name = "mxc-jpeg",
		.of_match_table = mxc_jpeg_match,
		.pm = &mxc_jpeg_pm_ops,
	},
};
module_platform_driver(mxc_jpeg_driver);
MODULE_LICENSE("GPL v2");
