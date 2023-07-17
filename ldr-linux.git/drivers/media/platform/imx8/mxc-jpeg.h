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

#include <media/v4l2-ctrls.h>
#include <media/v4l2-device.h>
#include <media/v4l2-fh.h>

#ifndef _MXC_JPEG_CORE_H
#define _MXC_JPEG_CORE_H

#define MXC_JPEG_M2M_NAME		"mxc-jpeg"
#define MXC_JPEG_NAME			"mxc-jpeg"
#define MXC_IN_FORMAT			0
#define MXC_OUT_FORMAT			1
#define MXC_JPEG_INIT			0
#define MXC_JPEG_RUNNING		1
#define MXC_JPEG_FMT_TYPE_ENC		0
#define MXC_JPEG_FMT_TYPE_RAW		1
#define MXC_JPEG_MIN_HEIGHT		64
#define MXC_JPEG_MIN_WIDTH		64
#define MXC_JPEG_MAX_HEIGHT		0x2000
#define MXC_JPEG_MAX_WIDTH		0x2000
#define MXC_JPEG_MAX_CFG_STREAM		0x1000
#define MXC_JPEG_H_ALIGN		3
#define MXC_JPEG_W_ALIGN		3
#define MXC_JPEG_DEFAULT_SIZEIMAGE	10000
#define MXC_JPEG_ENC_CONF		1
#define MXC_JPEG_ENC_DONE		0
#define SOF0				0xC0
#define SOF1				0xC1
#define SOF2				0xC2
#define SOS				0xDA
#define DHT				0xC4
#define MXC_JPEG_ENC_CONF_DONE		1
#define MXC_JPEG_MAX_PLANES		2


/**
 * struct jpeg_fmt - driver's internal color format data
 * @name:	format description
 * @fourcc:	fourcc code, 0 if not applicable
 * @depth:	number of bits per pixel
 * @colplanes:	number of color planes (1 for packed formats)
 * @h_align:	horizontal alignment order (align to 2^h_align)
 * @v_align:	vertical alignment order (align to 2^v_align)
 * @flags:	flags describing format applicability
 */
struct mxc_jpeg_fmt {
	char	*name;
	u32	fourcc;
	int	depth;
	int	colplanes;
	int	memplanes;
	int	h_align;
	int	v_align;
	int	subsampling;
	u32	flags;
};
struct mxc_jpeg_desc {
	u32 next_descpt_ptr;
	u32 buf_base0;
	u32 buf_base1;
	u32 line_pitch;
	u32 stm_bufbase;
	u32 stm_bufsize;
	u32 imgsize;
	u32 stm_ctrl;
} __packed;

struct mxc_jpeg_q_data {
	struct mxc_jpeg_fmt	*fmt;
	u32			sizeimage[MXC_JPEG_MAX_PLANES];
	u32			bytesperline[MXC_JPEG_MAX_PLANES];
	int w;
	int w_adjusted;
	int h;
	int h_adjusted;
	u32			stride;
};
struct mxc_jpeg_ctx {
	struct mxc_jpeg_dev		*mxc_jpeg;
	struct mxc_jpeg_q_data		out_q;
	struct mxc_jpeg_q_data		cap_q;
	struct v4l2_rect		crop_rect;
	unsigned long			state;
	struct v4l2_fh			fh;
	unsigned int			mode;
	unsigned int			enc_state;
	unsigned int			aborting;
	unsigned int			stopping;
	unsigned int			dht_needed;
	unsigned int			slot;
};

struct mxc_jpeg_slot_data {
	bool used;
	struct mxc_jpeg_desc *desc; // enc/dec descriptor
	struct mxc_jpeg_desc *cfg_desc; // configuration descriptor
	void *cfg_stream_vaddr; // configuration bitstream virtual address
	unsigned int cfg_stream_size;
	int flags;
	dma_addr_t desc_handle;
	dma_addr_t cfg_desc_handle; // configuration descriptor dma address
	dma_addr_t cfg_stream_handle; // configuration bitstream dma address
};

struct mxc_jpeg_dev {
	spinlock_t				hw_lock;
	unsigned int				mode;
	struct mutex			lock;
	bool					enc;
	bool					dec;
	struct clk				*clk_ipg;
	struct clk				*clk_per;
	struct platform_device			*pdev;
	struct device				*dev;
	void __iomem				*base_reg;
	void __iomem				*enc_reg;
	struct v4l2_device			v4l2_dev;
	struct v4l2_m2m_dev			*m2m_dev;
	struct video_device			*dec_vdev;
	unsigned int				irq;
	int					id;

	struct mxc_jpeg_slot_data slot_data[MXC_MAX_SLOTS];
};

#define MXC_JPEG_MAX_COMPONENTS 4
/* JPEG Start Of Frame marker fields*/
struct mxc_jpeg_sof_comp {
	u8 id; /*component id*/
	u8 v :4; /* vertical sampling*/
	u8 h :4; /* horizontal sampling*/
	u8 quantization_table_no;
} __packed;

struct mxc_jpeg_sof {
	u16 length;
	u8 precision;
	u16 height, width;
	u8 components_no;
	struct mxc_jpeg_sof_comp comp[MXC_JPEG_MAX_COMPONENTS];
} __packed;

/* JPEG Start Of Scan marker fields*/
struct mxc_jpeg_sos_comp {
	u8 id; /*component id*/
	u8 huffman_table_no;
} __packed;
struct mxc_jpeg_sos {
	u16 length;
	u8 components_no;
	struct mxc_jpeg_sos_comp comp[MXC_JPEG_MAX_COMPONENTS];
	u8 ignorable_bytes[3];
} __packed;

#endif
