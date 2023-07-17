/* hello_world.c */ 
#include <linux/init.h> 
#include <linux/module.h> 
#include <linux/kernel.h>
#include <linux/delay.h>

#include <linux/time.h>

extern uint32_t attr_show_str(const char *func_name, char *buf);
extern uint32_t attr_store_str(const char *func_name, char *buf, size_t count);

#define BUFFER_SIZE	128
char buf[BUFFER_SIZE];

extern void ldr_dump(void *addr, size_t len);
extern void sw_mpl3115_read_data(int *pres, short *temp);

extern ssize_t mpl3115_enable_show(struct device *dev,
				   struct device_attribute *attr, char *buf);
extern ssize_t mpl3115_enable_store(struct device *dev,
				    struct device_attribute *attr,
				    const char *buf, size_t count);

static int __init first_init(void) 
{
	size_t i, j = 0;
	int pre_pres, pressure;
	short pre_temp, temperature;
	ktime_t start, end;
	s64 interval;
	int count = 1;
	int c = 0;

	msleep(100);

	pressure = pre_pres = 0;
	temperature = pre_temp = 0;

	printk("test mpl3115 sw I/O.\n");

	/* show mpl3115 enable */
	mpl3115_enable_show(NULL, NULL, buf);
	printk("mpl3115 enable: %s.\n", buf);

	/* activate mpl3115 */
	buf[0] = '1';
	buf[1] = '\0';
	mpl3115_enable_store(NULL, NULL, buf, 2);
	printk("mpl3115 enabled.\n");

	/* show mpl3115 enable */
	mpl3115_enable_show(NULL, NULL, buf);
	printk("mpl3115 enable: %s.\n", buf);

	/* read data from mpl3115 */	
	for (j = 0; j < 30; j++) {
		start = ktime_get_real_seconds();
		count = 0;

		while (1) {
			sw_mpl3115_read_data(&pressure, &temperature);
			// printk("%d, %d.\n", pressure, temperature);

			if (count >= 10) {
				break;
			}

			if (pressure != pre_pres || temperature != pre_temp) {
				pre_pres = pressure;
				pre_temp = temperature;
				count++;
			} else {
				continue;
			}
		}

		end = ktime_get_real_seconds();
		interval = ktime_sub(end, start);
		printk("round %d: %ld\n", j, interval);
	}

	return 0; 
}

static void __exit first_exit(void) 
{
	printk("Bye\n"); 
}

module_init(first_init);
module_exit(first_exit);
