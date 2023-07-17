#include <trace.h>

#ifndef barrier_before_unreachable
#define barrier_before_unreachable() do { } while (0)
#endif

#ifndef HAVE_ARCH_BUG
#define BUG() do { \
	EMSG("BUG: failure at %s:%d/%s()!\n", __FILE__, __LINE__, __func__); \
	barrier_before_unreachable(); \
	panic("BUG!"); \
} while (0)
#endif

#ifndef HAVE_ARCH_BUG_ON
#define BUG_ON(condition) do { if ((condition)) BUG(); } while (0)
#endif