#ifndef _HW_DISPATCHER_H_
#define _HW_DISPATCHER_H_

#define MAX_PARAM_BUF_SIZE	256

#define HW_DRIVER_ID	8757

enum hw_func {
	HW_PROBE,
};

int sw_probe(unsigned char *param_buf);

int dispatch(unsigned int func_id, unsigned char *param_buf);

/* SW Routines - undefined during building */
unsigned int get_device_base(unsigned int pa);
int ldr_sw_driver_register(unsigned int driver_id, 
	int (*dispatch)(unsigned int func_id, unsigned char *param_buf),
	void *sv);

#endif