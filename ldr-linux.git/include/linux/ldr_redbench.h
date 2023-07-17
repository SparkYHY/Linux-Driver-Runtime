#ifndef _LINUX_LDR_REDBENCH_H_
#define _LINUX_LDR_REDBENCH_H_

#include <linux/bitops.h>
#include <linux/types.h>
#include <linux/list.h>

/**
 * used to evaluate pointer to sv non-sec elements.
 * we will have corresponding test kernel functions.
*/
struct dummy {
	unsigned int dum0;
	unsigned int dum1;
	unsigned int dum2;
	unsigned int dum3;
};

#endif /* _LINUX_LDR_REDBENCH_H_ */