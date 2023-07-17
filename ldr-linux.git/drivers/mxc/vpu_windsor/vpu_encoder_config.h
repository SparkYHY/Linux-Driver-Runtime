/*
 * Copyright 2018-2019 NXP
 */

/*
 * The code contained herein is licensed under the GNU General Public
 * License. You may obtain a copy of the GNU General Public License
 * Version 2 or later at the following locations:
 *
 * http://www.opensource.org/licenses/gpl-license.html
 * http://www.gnu.org/copyleft/gpl.html
 */

#ifndef _VPU_ENCODER_CONFIG_H
#define _VPU_ENCODER_CONFIG_H

#define VPU_ENC_WIDTH_MAX		1920
#define VPU_ENC_HEIGHT_MAX		1920
#define VPU_ENC_WIDTH_MIN		64
#define VPU_ENC_HEIGHT_MIN		48
#define VPU_ENC_WIDTH_STEP		16
#define VPU_ENC_HEIGHT_STEP		2
#define VPU_ENC_FRAMERATE_MAX		120
#define VPU_ENC_FRAMERATE_MIN		1
#define VPU_ENC_FRAMERATE_STEP		1

#define VPU_ENC_WIDTH_DEFAULT		1920
#define VPU_ENC_HEIGHT_DEFAULT		1080
#define VPU_ENC_FRAMERATE_DEFAULT	30

#define VPU_MEM_PATTERN			0x5a5a5a5a

#define VPU_TAIL_SERACH_SIZE		16
#define VPU_STRM_END_PATTERN		{0x0, 0x0, 0x1, 0xb}
#define VPU_STRM_BEGIN_PATTERN		{0x0, 0x0, 0x1}

#define MSG_DATA_DEFAULT_SIZE		256
#define MSG_COUNT_THD			16
#define FRAME_COUNT_THD			16

#define VPU_WATCHDOG_INTERVAL_MS	1000
#define VPU_ENC_HANG_THD		15

#define VPU_FPS_STS_CNT			3
#define VPU_FPS_STS_THDS		{1, 3, 0}
#define VPU_FPS_COEF			100

#define VPU_DETAIL_INDEX_DFT		0xffff

#define VPU_MU_MAX_ADDRESS		0x40000000
#define VPU_ENC_SEQ_CAPACITY		32
#define VPU_ENC_INVALID_TIMESTAMP	0

#endif
