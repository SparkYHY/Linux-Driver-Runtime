/* hello_world.c */ 
#include <linux/init.h> 
#include <linux/module.h> 
#include <linux/kernel.h>
#include <linux/delay.h>

#include <linux/time.h>

#define BUFFER_SIZE	128
char buf[BUFFER_SIZE];

extern void ldr_dump(void *addr, size_t len);
extern int sw_isl29023_get_adc_value(void);

extern ssize_t isl29023_show_power_state(struct device *dev,
					 struct device_attribute *attr,
					 char *buf);
extern ssize_t isl29023_store_power_state(struct device *dev,
					  struct device_attribute *attr,
					  const char *buf, size_t count);
extern ssize_t isl29023_show_mode(struct device *dev,
				  struct device_attribute *attr, char *buf);
extern ssize_t isl29023_store_mode(struct device *dev,
		struct device_attribute *attr, const char *buf, size_t count);

extern void ldr_tlbi_all(void);
extern void ldr_icache_inv_all(void);
extern void ldr_dcache_op_all(unsigned long op_type);

static int __init first_init(void) 
{
	size_t i, j = 0;
	int lux, pre_lux;
	ktime_t start, end;
	s64 interval;
	int count = 1;
	int c = 0;

	pre_lux = 0;
	lux = 0;

	printk("test isl29023 sw I/O.\n");

	pre_lux = 1;
	lux = 1;

	/* show isl29023 power state */
	isl29023_show_power_state(NULL, NULL, buf);
	printk("isl29023 power state: %s.\n", buf);

	/* activate isl29023 */
	buf[0] = '1';
	buf[1] = '\0';
	isl29023_store_power_state(NULL, NULL, buf, 1);

	/* show isl29023 power state */
	isl29023_show_power_state(NULL, NULL, buf);
	printk("isl29023 power state: %s.\n", buf);

	/* show isl29023 mode */
	isl29023_show_mode(NULL, NULL, buf);
	printk("isl29023 mode: %s.\n", buf);

	/* set isl29023 to polling mode */
	buf[0] = '5';
	buf[1] = '\0';
	isl29023_store_mode(NULL, NULL, buf, 1);

	/* show isl29023 mode */
	isl29023_show_mode(NULL, NULL, buf);
	printk("isl29023 mode: %s.\n", buf);

	/* read data from isl29023 */	

	for (j = 0; j < 20; j++) {
		start = ktime_get();

		count = 0;

		while (1) {
			lux = sw_isl29023_get_adc_value();

			if (lux != pre_lux) {
				count++;
				pre_lux = lux;

				if (count >= 33) {
					break;
				}
			}
		}

		end = ktime_get();
		interval = ktime_to_ms(ktime_sub(end, start));
		printk("round %d: %ld\n", j, interval);
		printk("round %d: %d\n", j, count);
	}

	return 0; 
}

static void __exit first_exit(void) 
{
	printk("Bye\n"); 
}

module_init(first_init);
module_exit(first_exit);
