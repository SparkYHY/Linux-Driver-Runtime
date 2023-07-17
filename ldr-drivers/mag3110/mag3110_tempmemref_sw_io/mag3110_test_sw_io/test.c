/* hello_world.c */ 
#include <linux/init.h> 
#include <linux/module.h> 
#include <linux/kernel.h>
#include <linux/time.h>

extern uint32_t attr_show_str(const char *func_name, char *buf);
extern uint32_t attr_store_str(const char *func_name, char *buf, size_t count);

#define BUFFER_SIZE	128
char buf[BUFFER_SIZE];

extern void ldr_dump(void *addr, size_t len);
extern int mag3110_read_data(short *x, short *y, short *z);

extern ssize_t mag3110_enable_show(struct device *dev,
				   struct device_attribute *attr, char *buf);
extern ssize_t mag3110_enable_store(struct device *dev,
				    struct device_attribute *attr,
				    const char *buf, size_t count);

static int __init first_init(void) 
{
	size_t i, j = 0;
	short x, y, z;
	ktime_t start, end;
	s64 interval;

	printk("test mag3110 sw I/O.\n");

	/* show mag3110 enable state */
	mag3110_enable_show(NULL, NULL, buf);
	printk("mag3110 enable state: %s.\n", buf);

	/* enable mag3110 */
	buf[0] = '1';
	buf[1] = '\0';
	mag3110_enable_store(NULL, NULL, buf, 1);

	/* show mag3110 enable state */
	mag3110_enable_show(NULL, NULL, buf);
	printk("mag3110 enable state: %s.\n", buf);

	/* read data from mag3110 */

	for (j = 0; j < 30; j++) {
		start = ktime_get();

		for (i = 0; i < 240; i++) {
			mag3110_read_data(&x, &y, &z);
		}

		end = ktime_get();
		if (end < start)
			end += 0xffffffff;
		interval = ktime_to_ms(ktime_sub(end, start));
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
