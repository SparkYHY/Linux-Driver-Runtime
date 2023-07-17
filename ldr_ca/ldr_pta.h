/**
 * This header file outlines commands exported by LDR PTA.
 * 
 * TODO:A user TA trampline should be created because CAs
 *	are not supposed to communicate with PTAs directly
 *	and PTAs are only meant to provide interfaces to 
 *	TAs.
 *
 */

#ifndef __LDR_TA_H__
#define __LDR_TA_H__

/* UUID of the LDR PTA */
#define PTA_LDR_UUID \
	{ 0x13e7ebe3, 0x121c, 0x48e0, \
	{ 0xb9, 0xee, 0x9f, 0x2a, 0xd2, 0x26, 0x10, 0x80 } }

/*
 * LDR_CMD_LOAD_MODULE - Load a Linux module
 * param[0] [I/O] (value)  flags
 * param[1] [I/O] (memref) module binary
 * param[2] unused
 * param[3] unused
 */
#define LDR_CMD_LOAD_MODULE		0

/* char device commands */
#define LDR_CMD_CDEV_OPEN		0x21
#define LDR_CMD_CDEV_RELEASE		0x22
#define LDR_CMD_CDEV_READ		0x23
#define LDR_CMD_CDEV_WRITE		0x24


#endif /* __LDR_TA_H__ */
