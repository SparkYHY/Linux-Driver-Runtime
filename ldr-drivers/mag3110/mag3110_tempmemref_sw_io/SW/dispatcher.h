#ifndef _MAG3110_DISPATCHER_H_
#define _MAG3110_DISPATCHER_H_

#define MAX_PARAM_BUF_SIZE	256

#define MAG3110_DRIVER_ID	3

enum mag3110_func {
	MAG3110_PROBE,
};

int sw_probe(unsigned char *param_buf);

int dispatch(unsigned int func_id, unsigned char *param_buf);

/* SW Routines - undefined during building */
unsigned int get_device_base(unsigned int pa);
int ldr_sw_driver_register(unsigned int driver_id, 
	int (*dispatch)(unsigned int func_id, unsigned char *param_buf),
	void *sv);

#endif