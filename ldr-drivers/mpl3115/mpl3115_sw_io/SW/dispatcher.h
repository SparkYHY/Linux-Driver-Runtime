#ifndef _MPL3115_DISPATCHER_H_
#define _MPL3115_DISPATCHER_H_

#define MAX_PARAM_BUF_SIZE	256

#define MPL3115_DRIVER_ID	15

enum mpl3115_func {
	MPL3115_PROBE,
};

int sw_probe(unsigned char *param_buf);

int dispatch(unsigned int func_id, unsigned char *param_buf);

/* SW Routines - undefined during building */
int ldr_sw_driver_register(unsigned int driver_id, 
	int (*dispatch)(unsigned int func_id, unsigned char *param_buf),
	void *sv);

#endif