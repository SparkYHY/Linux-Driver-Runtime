/* hello_world.c */ 
#include <linux/init.h> 
#include <linux/module.h> 
#include <linux/kernel.h> 
#include <linux/time.h>

extern uint32_t attr_show_str(const char *func_name, char *buf);
extern uint32_t attr_store_str(const char *func_name, char *buf, size_t count);

extern int mma8451_read_data(short *x, short *y, short *z);

#define BUFFER_SIZE	128
char buf[BUFFER_SIZE];

extern void ldr_dump(void *addr, size_t len);
extern ssize_t mma8451_enable_show(struct device *dev,
				   struct device_attribute *attr, char *buf);
extern ssize_t mma8451_enable_store(struct device *dev,
				    struct device_attribute *attr,
				    const char *buf, size_t count);

static int __init first_init(void) 
{
	size_t i, j = 0;
	short x, y, z;
	short lx, ly, lz;
	int count;
	ktime_t start, end;
	s64 interval;

	printk("test mma8451 sw I/O.\n");

	/* show mma8451 enable state */
	mma8451_enable_show(NULL, NULL, buf);
	printk("mma8451 enable state: %s.\n", buf);

	/* enable mma8451 */
	buf[0] = '1';
	buf[1] = '\0';
	mma8451_enable_store(NULL, NULL, buf, 1);

	/* show mma8451 enable state */
	mma8451_enable_show(NULL, NULL, buf);
	printk("mma8451 enable state: %s.\n", buf);

	/* read data from mma8451 */
	for (j = 0; j < 20; j++) {
		start = ktime_get();

		count = 1;
		while (1) {
			mma8451_read_data(&x, &y, &z);

			if (x == lx && y == ly && z ==lz) {
				continue;
			}

			if (count >= 2400) {
				break;
			}

			lx = x;
			ly = y;
			lz = z;

			count++;
		}

		end = ktime_get();
		if (end < start)
			end += 0xffffffff;
		interval = ktime_to_ms(ktime_sub(end, start));
		printk("round %d: %lld\n", j, interval);
	}

	return 0; 
}

static void __exit first_exit(void) 
{
	printk("Bye\n"); 
}

module_init(first_init);
module_exit(first_exit);
