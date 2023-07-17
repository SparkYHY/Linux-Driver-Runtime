#include <linux/delay.h>
#include <linux/device.h>
#include <linux/mm.h>
#include <linux/list.h>
#include <linux/slab.h>
#include <linux/teek.h>
#include <linux/tee_drv.h>
#include <linux/clk.h>
#include <linux/clk-provider.h>
#include "optee_private.h"
#include "optee_smc.h"
#include "optee_msg.h"

#include <linux/ldr.h>

typedef int (*ldr_rpc_stub_ret)(unsigned int a0,
				unsigned int a1,
				unsigned int a2,
				unsigned int a3);

typedef void (*ldr_rpc_stub_void)(unsigned int a0,
				  unsigned int a1,
				  unsigned int a2,
				  unsigned int a3);

union ldr_rpc_stub_func {
	ldr_rpc_stub_ret ldr_rpc_stub_ret;
	ldr_rpc_stub_void ldr_rpc_stub_void;
};

spinlock_t ldr_rpc_spin_lock;

#define MAX_ARG_COUNT	4
#define LDR_RPC_ARG_TYPE_MASK(n)	0xff << n
/* indicate whether the argument is a pointer to a member of sv(1) or
 * just a regular value(0).
 */
#define LDR_RPC_ARG_TYPE(u, n) u & (LDR_RPC_ARG_TYPE_MASK(n))

int ldr_rpc(struct optee_msg_arg *arg) {
	/**
	 * @params[0].u.value.a	driver ID to retrieve the driver's sv
	 * @params[0].u.value.b	target linux function address (linux kaddress)
	 * @params[0].u.value.c	target linux function type (1-ret, 0-void)
	 * 
	 * @params[1].u.value.a	target linux function arg type
	 * @params[1].u.value.b	1st arguement to the target linux function
	 * @params[1].u.value.c	2nd arguement to the target linux function
	 * 
	 * @params[2].u.value.a	3rd arguement to the target linux function
	 * @params[2].u.value.b	4th arguement to the target linux function
	 * @params[2].u.value.c	result for return functions [out]
	*/

	unsigned int driver_id = arg->params[0].u.value.a;
	union ldr_rpc_stub_func ldr_rpc_stub_func;

	unsigned int args[MAX_ARG_COUNT];
	unsigned int arg_type = arg->params[1].u.value.a;
	unsigned int a0 = arg->params[1].u.value.b;
	unsigned int a1 = arg->params[1].u.value.c;
	unsigned int a2 = arg->params[2].u.value.a;
	unsigned int a3 = arg->params[2].u.value.b;

	unsigned int func_type = arg->params[0].u.value.c;
	int res;

	if (arg->num_params != 3){
		pr_err("ERROR: ldr_rpc() param # is not 3.\n");
	}
	if ((arg->params[0].attr & OPTEE_MSG_ATTR_TYPE_MASK) !=
			OPTEE_MSG_ATTR_TYPE_VALUE_INOUT ||
	    (arg->params[1].attr & OPTEE_MSG_ATTR_TYPE_MASK) !=
			OPTEE_MSG_ATTR_TYPE_VALUE_INOUT ||
	    (arg->params[2].attr & OPTEE_MSG_ATTR_TYPE_MASK) !=
			OPTEE_MSG_ATTR_TYPE_VALUE_INOUT) {
		pr_err("ERROR: ldr_rpc() param type wrong.\n");
	}

	pr_debug("inside ldr rpc linux backward invocation:\n");
	pr_debug("driver id:\t%d\n", driver_id);
	pr_debug("functype:\t%s\n", func_type ? "ret" : "void");

	/* get the nw driver sv */
	void *driver_sv_ptr = ldr_nw_get_driver_sv(driver_id);

	/* prepare arg 0 */
	if (LDR_RPC_ARG_TYPE(arg_type, 0)) { /* ptr to sv member */
		args[0] = (unsigned int)driver_sv_ptr + a0;
		pr_debug("offset: %d\n", a0);
		pr_debug("final address: 0x%08x\n", args[0]);
	} else { /* regular value */
		args[0] = a0;
		pr_debug("final value: 0x%08x\n", args[0]);
	}

	/* prepare arg 1 */
	if (LDR_RPC_ARG_TYPE(arg_type, 4)) { /* ptr to sv member */
		args[1] = (unsigned int)driver_sv_ptr + a1;
		pr_debug("offset: %d\n", a1);
		pr_debug("final address: 0x%08x\n", args[1]);
	} else { /* regular value */
		args[1] = a1;
		pr_debug("final value: 0x%08x\n", args[1]);
	}

	/* prepare arg 2 */
	if (LDR_RPC_ARG_TYPE(arg_type, 8)) { /* ptr to sv member */
		args[2] = (unsigned int)driver_sv_ptr + a2;
		pr_debug("offset: %d\n", a2);
		pr_debug("final address: 0x%08x\n", args[2]);
	} else { /* regular value */
		args[2] = a2;
		pr_debug("final value: 0x%08x\n", args[2]);
	}

	/* prepare arg 3 */
	if (LDR_RPC_ARG_TYPE(arg_type, 12)) { /* ptr to sv member */
		args[3] = (unsigned int)driver_sv_ptr + a3;
		pr_debug("offset: %d\n", a3);
		pr_debug("final address: 0x%08x\n", args[3]);
	} else { /* regular value */
		args[3] = a3;
		pr_debug("final value: 0x%08x\n", args[3]);
	}

	pr_debug("a0: 0x%08x, a1: 0x%08x, a2: 0x%08x, a3: 0x%08x.\n",
		args[0], args[1], args[2], args[3]);

	/* recognize function type */
	if (func_type) { /* func with return */
		ldr_rpc_stub_func.ldr_rpc_stub_ret 
			= arg->params[0].u.value.b;
		res = (*ldr_rpc_stub_func.ldr_rpc_stub_ret)(args[0],
							    args[1],
							    args[2],
							    args[3]);
		arg->params[2].u.value.c = res;
		pr_debug("ldr linux rpc res: %d.\n", res);
	} else { /* func with void */
		ldr_rpc_stub_func.ldr_rpc_stub_void 
			= arg->params[0].u.value.b;
		(*ldr_rpc_stub_func.ldr_rpc_stub_void)(args[0],
						       args[1],
						       args[2],
						       args[3]);
	}

	arg->ret = TEEC_SUCCESS;

	return 0;
}
