#ifndef _ISL29023_DISPATCHER_H_
#define _ISL29023_DISPATCHER_H_

#define MAX_PARAM_BUF_SIZE	256

#define ISL29023_DRIVER_ID	11

enum isl29023_func {
	ISL29023_PROBE,
};

int sw_probe(unsigned char *param_buf);

int dispatch(unsigned int func_id, unsigned char *param_buf);

/* SW Routines - undefined during building */
int ldr_sw_driver_register(unsigned int driver_id, 
	int (*dispatch)(unsigned int func_id, unsigned char *param_buf),
	void *sv);

#endif