#ifndef _THERMAL_DISPATCHER_H_
#define _THERMAL_DISPATCHER_H_

#define MAX_PARAM_BUF_SIZE	256

#define THERMAL_DRIVER_ID	4

enum thermal_func {
	THERMAL_PROBE,
};

int sw_probe(unsigned char *param_buf);

int dispatch(unsigned int func_id, unsigned char *param_buf);

#define ANALOG_BASE			0x020C8000

/* SW Routines - undefined during building */
unsigned int get_device_base(unsigned int pa);
int ldr_sw_driver_register(unsigned int driver_id, 
	int (*dispatch)(unsigned int func_id, unsigned char *param_buf),
	void *sv);

#endif