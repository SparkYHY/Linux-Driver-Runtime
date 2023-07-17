/**
 * This header file outlines commands exported by LDR PTA.
 *
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

/*
 * LDR_CMD_SW_DRIVER_PROBE - Invoke sw_probe() of a driver
 * param[0] [I] (value)  driver ID + function ID
 * param[1] [I] (memref) state var
 * param[2] [O] (value)  shm pa + shm size
 * param[3] [I] (value)  nw sv pa
 */
#define LDR_CMD_SW_DRIVER_PROBE		1

/*
 * LDR_CMD_INVOKE_FUNCTION - Invoke a function from a driver
 * param[0] [I] (value)  driver ID + function ID
 * param[1] [I] (memref) param buffer
 * param[2] unused
 * param[3] unused
 */
#define LDR_CMD_INVOKE_FUNCTION		2

#endif /* __LDR_TA_H__ */
