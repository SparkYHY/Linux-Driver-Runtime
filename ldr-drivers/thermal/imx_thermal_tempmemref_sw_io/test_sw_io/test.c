/* hello_world.c */ 
#include <linux/init.h> 
#include <linux/module.h> 
#include <linux/kernel.h> 

#define THERMAL_DRIVER_ID 4

extern uint32_t attr_show_str(const char *func_name, char *buf);
extern uint32_t attr_store_str(const char *func_name, char *buf, size_t count);

#define BUFFER_SIZE	128
char buf[BUFFER_SIZE];

extern void ldr_dump(void *addr, size_t len);
extern int imx_get_temp(void *tz, int *temp);
extern int register_thermal_device(int driver_id, void *devdata);
extern struct thermal_zone_device *find_thermal(int driver_id);

static int __init first_init(void)
{
	size_t i = 0;
	int temp;

	printk("test imx thermal sw I/O.\n");

	struct thermal_zone_device * tzd;
	tzd = find_thermal(THERMAL_DRIVER_ID);
	if (tzd == NULL) {
		pr_err("ERROR: cannot find thermal device.\n");
		return -1;
	}

	/* read data from thermal */
	for (i = 0; i < 10; i++) {
		imx_get_temp(tzd, &temp);
		printk("imx temperature: %d.\n", temp);
	}

	return 0; 
}

static void __exit first_exit(void) 
{
	printk("Bye\n"); 
}

module_init(first_init);
module_exit(first_exit);
