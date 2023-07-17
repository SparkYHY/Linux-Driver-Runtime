#ifndef _MAX8451_DISPATCHER_H_
#define _MAX8451_DISPATCHER_H_

#define MAX_PARAM_BUF_SIZE	256

#define MAX8451_DRIVER_ID	2

enum max8451_func {
	MAX8451_PROBE,
	MAX8451_READ_DATA,
};

int sw_probe(unsigned char *param_buf);

int sw_mma8451_read_data(unsigned char *param_buf);

int dispatch(unsigned int func_id, unsigned char *param_buf);

/* SW Routines - undefined during building */
unsigned int get_device_base(unsigned int pa);
int ldr_sw_driver_register(unsigned int driver_id, 
	int (*dispatch)(unsigned int func_id, unsigned char *param_buf),
	void *sv);

#endif