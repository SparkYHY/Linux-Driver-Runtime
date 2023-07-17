#include <linux/cdev.h>
#include <linux/cred.h>
#include <linux/fs.h>
#include <linux/idr.h>
#include <linux/kdev_t.h>
#include <linux/module.h>
#include <linux/slab.h>
#include <linux/tee.h>
#include <linux/tee_drv.h>
#include <linux/teek.h>
#include <linux/uaccess.h>
#include <crypto/hash.h>
#include <crypto/sha.h>
#include "tee_private.h"

struct tee_device* teek_tee_device;

TEEK_Result TEEK_InitializeContext(TEEK_Context *teek_ctx) {
	struct tee_context *ctx;

	if (!teek_ctx) {
		pr_err("ERROR: NULL teek context.\n");
		return TEEK_ERROR_BAD_PARAMETERS;
	}		

	if (teek_tee_device == NULL) {
		pr_err("ERROR: teek tee device uninitialized.\n");
		return TEEK_ERROR_BAD_STATE;
	}

	ctx = teedev_open(teek_tee_device);
	if (IS_ERR(ctx))
		return PTR_ERR(ctx);

	teek_ctx->ctx = ctx;
	/* For now, teek only uses temp mem */
	teek_ctx->reg_mem = false;

	pr_debug("teek context initialized successfully.\n");

	return TEEK_SUCCESS;
}

void TEEK_FinalizeContext(TEEK_Context *teek_ctx) {
	teedev_close_context(teek_ctx->ctx);

	pr_debug("teek context finalized successfully.\n");
}

static void uuid_to_octets(uint8_t d[TEE_IOCTL_UUID_LEN], const TEEK_UUID *s)
{
	d[0] = s->timeLow >> 24;
	d[1] = s->timeLow >> 16;
	d[2] = s->timeLow >> 8;
	d[3] = s->timeLow;
	d[4] = s->timeMid >> 8;
	d[5] = s->timeMid;
	d[6] = s->timeHiAndVersion >> 8;
	d[7] = s->timeHiAndVersion;
	memcpy(d + 8, s->clockSeqAndNode, sizeof(s->clockSeqAndNode));
}

#define TEEK_PARAM_SIZE(x) (sizeof(struct tee_param) * (x))

static int teek_shm_alloc(struct tee_context *ctx, void **buf,
			  size_t size, int *id)
{
	struct teek_shm_alloc_data data;
	struct tee_shm *shm;

	memset(&data, 0, sizeof(data));

	data.size = size;
	shm = tee_shm_alloc(ctx, data.size, 
			TEE_SHM_MAPPED | TEE_SHM_DMA_BUF);
	if (IS_ERR(shm))
		return TEEK_ERROR_OUT_OF_MEMORY;

	data.id = shm->id;
	data.flags = shm->flags;
	data.size = shm->size;

	pr_debug("teek: shm allocation successfull.\n");
	// pr_debug("  allocation data: \n");
	// pr_debug("	length	: 0x%08x\n", data.size);
	pr_debug("  shm info: \n");
	pr_debug("	ctx	: %s\n", shm->ctx->teedev->name);
	pr_debug("	paddr	: 0x%08x\n", shm->paddr);
	pr_debug("	kaddr	: 0x%08x\n", shm->kaddr);
	pr_debug("	size	: 0x%08x\n", shm->size);
	pr_debug("	id	: 0x%08x\n", shm->id);

	*id = data.id;
	*buf = shm->kaddr;

	return TEEK_SUCCESS;
}

TEEK_Result TEEK_AllocateSharedMemory(TEEK_Context *ctx, 
				      TEEK_SharedMemory *shm)
{
	size_t s = 0;
	TEEK_Result res;

	if (!ctx || !shm) {
		pr_err("ERROR: NULL ctx or shm.\n");
		return TEEK_ERROR_BAD_PARAMETERS;
	}

	if (!shm->flags || (shm->flags & ~(TEEK_MEM_INPUT | TEEK_MEM_OUTPUT)))
		return TEEK_ERROR_BAD_PARAMETERS;

	s = shm->size;
	if (!s)
		s = 8;

	/* For now, teek only uses temp mem */
	res = teek_shm_alloc(ctx->ctx, &shm->buffer, s, &shm->id);
	if (res != TEEK_SUCCESS) {
		pr_err("ERROR: teek_shm_alloc(): outof memory.\n");
		return TEEK_ERROR_OUT_OF_MEMORY;
	}
		

	if (IS_ERR(shm->buffer)) {
		pr_err("ERROR: teek_shm_alloc(): invalid shm buf ptr.\n");
		return TEEK_ERROR_GENERIC;
	}

	shm->shadow_buffer = NULL;
	shm->alloced_size = s;
	shm->buffer_allocated = true;

	return TEEK_SUCCESS;
}

static TEEK_Result 
teek_pre_process_tmpref(TEEK_Context *ctx,
			uint32_t param_type, TEEK_TempMemoryReference *tmpref,
			struct teek_param *param,
			TEEK_SharedMemory *shm)
{
	TEEK_Result res = TEEK_ERROR_GENERIC;

	switch (param_type) {
	case TEEK_MEMREF_TEMP_INPUT:
		param->attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
		shm->flags = TEEK_MEM_INPUT;
		break;
	case TEEK_MEMREF_TEMP_OUTPUT:
		param->attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT;
		shm->flags = TEEK_MEM_OUTPUT;
		break;
	case TEEK_MEMREF_TEMP_INOUT:
		param->attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT;
		shm->flags = TEEK_MEM_INPUT | TEEK_MEM_OUTPUT;
		break;
	default:
		return TEEK_ERROR_BAD_PARAMETERS;
	}
	shm->size = tmpref->size;

	pr_debug("trying to allocate shared mem ...\n");
	res = TEEK_AllocateSharedMemory(ctx, shm);
	pr_debug("shared mem allocation success.\n");

	if (res != TEEK_SUCCESS)
		return res;

	memcpy(shm->buffer, tmpref->buffer, tmpref->size);
	param->u.memref.size = tmpref->size;
	param->u.memref.shm_id = shm->id;

	return TEEK_SUCCESS;
}

static TEEK_Result 
teek_pre_process_operation(TEEK_Context *ctx,
			   TEEK_Operation *operation,
			   struct teek_param *params,
			   TEEK_SharedMemory *shms) {
	TEEK_Result res = TEEK_ERROR_GENERIC;
	size_t n = 0;

	pr_debug("inside %s():\n", __func__);

	memset(shms, 0, sizeof(TEEK_SharedMemory) *
			TEEK_CONFIG_PAYLOAD_REF_COUNT);
	if (!operation) {
		memset(params, 0, sizeof(struct tee_param) *
			TEEK_CONFIG_PAYLOAD_REF_COUNT);
		return TEEK_SUCCESS;
	}

	for (n = 0; n < TEEK_CONFIG_PAYLOAD_REF_COUNT; n++) {
		uint32_t param_type = 0;

		param_type = TEEK_PARAM_TYPE_GET(operation->paramTypes, n);
		switch (param_type) {
		case TEEK_NONE:
			params[n].attr = param_type;
			break;
		case TEEK_VALUE_INPUT:
		case TEEK_VALUE_OUTPUT:
		case TEEK_VALUE_INOUT:
			params[n].attr = param_type;
			params[n].u.value.a = operation->params[n].value.a;
			params[n].u.value.b = operation->params[n].value.b;
			pr_debug("\tteek value a: %lld.\n", params[n].u.value.a);
			pr_debug("\tteek value b: %lld.\n", params[n].u.value.b);
			break;
		case TEEK_MEMREF_TEMP_INPUT:
		case TEEK_MEMREF_TEMP_OUTPUT:
		case TEEK_MEMREF_TEMP_INOUT:
			res = teek_pre_process_tmpref(ctx, 
						param_type, // in
						&operation->params[n].tmpref, // in
						params + n, // out
						shms + n); // tmp
			if (res != TEEK_SUCCESS) {
				pr_err("ERROR: teek_pre_process_tmpref().\n");
				return res;
			}
			break;

		default:
			pr_err("ERROR: unknown teek param type.\n");
			return TEEK_ERROR_BAD_PARAMETERS;
		}
	}

	return TEEK_SUCCESS;
}

static int params_from_teek(struct tee_context *ctx, 
			    struct tee_param *params,
			    size_t num_params,
			    struct teek_param *teek_params)
{
	size_t n;
	struct tee_shm *shm;
	struct teek_param *ip;

	for (n = 0; n < num_params; n++) {
		ip = teek_params + n;
		if (!ip) {
			pr_err("ERROR: null ip.\n");
			return TEEK_ERROR_BAD_PARAMETERS;
		}

		/* All unused attribute bits has to be zero */
		if (ip->attr & ~TEE_IOCTL_PARAM_ATTR_MASK)
			return -EINVAL;

		params[n].attr = ip->attr;
		switch (ip->attr & TEE_IOCTL_PARAM_ATTR_TYPE_MASK) {
		case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
			break;
		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
			params[n].u.value.a = ip->u.value.a;
			params[n].u.value.b = ip->u.value.b;
			params[n].u.value.c = ip->u.value.c;
			break;
		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
			shm = tee_shm_get_from_id(ctx, ip->u.memref.shm_id);
			if (IS_ERR(shm))
				return PTR_ERR(shm);

			if ((ip->u.memref.shm_offs + ip->u.memref.size) 
				< ip->u.memref.shm_offs ||
			    (ip->u.memref.shm_offs + ip->u.memref.size) 
			    	> shm->size) {
				tee_shm_put(shm);
				return -EINVAL;
			}

			params[n].u.memref.shm_offs = ip->u.memref.shm_offs;
			params[n].u.memref.size = ip->u.memref.size;
			params[n].u.memref.shm = shm;
			break;

		default:
			return -EINVAL;
		}
	}

	return TEEK_SUCCESS;
}

static int params_to_teek(struct tee_context *ctx, 
			  struct tee_param *params,
			  size_t num_params,
			  struct teek_param *teek_params)
{
	size_t n;
	struct tee_shm *shm;
	struct teek_param *ip;

	for (n = 0; n < num_params; n++) {
		ip = teek_params + n;
		if (!ip) {
			pr_err("ERROR: null ip.\n");
			return TEEK_ERROR_BAD_PARAMETERS;
		}

		/* All unused attribute bits has to be zero */
		if (ip->attr & ~TEE_IOCTL_PARAM_ATTR_MASK)
			return -EINVAL;

		params[n].attr = ip->attr;
		switch (ip->attr & TEE_IOCTL_PARAM_ATTR_TYPE_MASK) {
		case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
			break;
		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
			ip->u.value.a = params[n].u.value.a;
			ip->u.value.b = params[n].u.value.b;
			ip->u.value.c = params[n].u.value.c;
			break;
		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
			break;
		default:
			pr_err("ERROR: unknown teek param type.\n");
			return -EINVAL;
		}
	}

	return TEEK_SUCCESS;
}

static int teek_open_session(struct tee_context *ctx,
			     struct teek_buf_data *buf)
{
	int rc;
	size_t n;
	struct teek_open_session_arg *arg;
	struct teek_param *teek_params;
	struct tee_param *tee_params = NULL;
	bool have_session = false;

	if (!ctx->teedev->desc->ops->open_session)
		return -EINVAL;

	if (buf->buf_len > TEE_MAX_ARG_SIZE ||
	    buf->buf_len < sizeof(struct teek_open_session_arg))
		return -EINVAL;

	arg = (struct teek_open_session_arg *)buf->buf_ptr;
	teek_params = (struct teek_param *)(arg + 1);

	pr_debug("arg header size	: 0x%08x.\n", sizeof(arg));
	pr_debug("params number		: 0x%08x.\n", arg->num_params);
	pr_debug("buffer len		: 0x%llx.\n", buf->buf_len);

	if (arg->num_params) {
		teek_params = (struct teek_param *)(arg + 1);
		tee_params = kcalloc(arg->num_params, sizeof(struct tee_param),
				 GFP_KERNEL);
		if (!tee_params)
			return -ENOMEM;
	
		rc = params_from_teek(ctx, tee_params, arg->num_params, teek_params);
		if (rc != TEEK_SUCCESS) {
			pr_err("ERROR: during params from teek to tee.\n");
			return TEEK_ERROR_GENERIC;
		}
	}

	if (arg->clnt_login != TEEK_LOGIN_REE_KERNEL) {
		pr_err("ERROR: teek_open_session() only for kernel clients.\n");
		rc = -EPERM;
		goto out;
	}

	rc = ctx->teedev->desc->ops->open_session(ctx, 
		(struct tee_ioctl_open_session_arg *)arg, tee_params);
	if (rc) {
		pr_err("ERROR: during optee open_session()\n");
		goto out;
	}
	have_session = true;

	rc = params_to_teek(ctx, tee_params, arg->num_params, teek_params);
	if (rc != TEEK_SUCCESS)
		return TEEK_ERROR_GENERIC;

out:
	/*
	 * If we've succeeded to open the session but failed to communicate
	 * it back to user space, close the session again to avoid leakage.
	 */
	if (rc && have_session && ctx->teedev->desc->ops->close_session)
		ctx->teedev->desc->ops->close_session(ctx, arg->session);

	return rc;
}

static void 
teek_post_process_tmpref(uint32_t param_type,
			 TEEK_TempMemoryReference *tmpref,
			 struct teek_param *param,
			 TEEK_SharedMemory *shm)
{
	if (param_type != TEEK_MEMREF_TEMP_INPUT) {
		if (param->u.memref.size <= tmpref->size 
		    && tmpref->buffer)
			memcpy(tmpref->buffer, shm->buffer, 
				param->u.memref.size);

		tmpref->size = param->u.memref.size;
	}
}

static void 
teek_post_process_operation(TEEK_Operation *operation,
			    struct teek_param *params,
			    TEEK_SharedMemory *shms)
{
	size_t n = 0;

	if (!operation)
		return;

	for (n = 0; n < TEEK_CONFIG_PAYLOAD_REF_COUNT; n++) {
		uint32_t param_type = 0;

		param_type = TEEK_PARAM_TYPE_GET(operation->paramTypes, n);
		switch (param_type) {
		case TEEK_VALUE_INPUT:
			break;
		case TEEK_VALUE_OUTPUT:
		case TEEK_VALUE_INOUT:
			operation->params[n].value.a = params[n].u.value.a;
			operation->params[n].value.b = params[n].u.value.b;
			pr_debug("teek_post_process_operation:\n");
			pr_debug("\tteek value a: %lld.\n", params[n].u.value.a);
			pr_debug("\tteek value b: %lld.\n", params[n].u.value.b);
			break;
		case TEEK_MEMREF_TEMP_INPUT:
		case TEEK_MEMREF_TEMP_OUTPUT:
		case TEEK_MEMREF_TEMP_INOUT:
			teek_post_process_tmpref(param_type,
				&operation->params[n].tmpref, params + n,
				shms + n);
			break;

		default:
			break;
		}
	}
}

TEEK_Result TEEK_OpenSession(TEEK_Context *ctx, TEEK_Session *session,
			const TEEK_UUID *destination,
			uint32_t connection_method, const void *connection_data,
			TEEK_Operation *operation, uint32_t *ret_origin)
{
	struct teek_open_session_arg *arg = NULL;
	struct teek_param *params = NULL;
	TEEK_Result res = TEEK_ERROR_GENERIC;
	uint32_t eorig = 0;
	const size_t arg_size = sizeof(struct teek_open_session_arg) +
					TEEK_CONFIG_PAYLOAD_REF_COUNT *
					sizeof(struct teek_param);
	union {
		struct teek_open_session_arg arg;
		uint8_t data[arg_size];
	} buf;
	struct teek_buf_data buf_data;
	TEEK_SharedMemory shm[TEEK_CONFIG_PAYLOAD_REF_COUNT];

	memset(&buf, 0, sizeof(buf));
	memset(&shm, 0, sizeof(shm));
	memset(&buf_data, 0, sizeof(buf_data));

	(void)&connection_data;

	if (!ctx || !session) {
		eorig = TEEK_ORIGIN_API;
		res = TEEK_ERROR_BAD_PARAMETERS;
		goto out;
	}
	pr_debug("TEEK_OpenSession() params checking success.\n");

	buf_data.buf_ptr = (uintptr_t)&buf;
	buf_data.buf_len = sizeof(buf);

	arg = &buf.arg;
	arg->num_params = TEEK_CONFIG_PAYLOAD_REF_COUNT;
	params = (struct teek_param *)(arg + 1);

	uuid_to_octets(arg->uuid, destination);
	arg->clnt_login = connection_method;

	res = teek_pre_process_operation(ctx, operation, params, shm);
	if (res != TEEK_SUCCESS) {
		eorig = TEEK_ORIGIN_API;
		goto out;
	}
	pr_debug("teek_pre_process_operation() success.\n");

	res = teek_open_session(ctx->ctx, &buf_data);
	if (res != TEEK_SUCCESS) {
		pr_err("ERROR: during open session.\n");
		eorig = TEEK_ORIGIN_COMMS;
		goto out;
	}

	res = arg->ret;
	eorig = arg->ret_origin;
	if (res == TEEK_SUCCESS) {
		session->ctx = ctx;
		session->session_id = arg->session;
	} else {
		pr_err("ERROR: in tee.\n");
		goto out;
	}
	pr_debug("teek_open_session() success.\n");

	teek_post_process_operation(operation, params, shm);
	pr_debug("teek_post_process_operation() success.\n");

	return TEEK_SUCCESS;

out:
	if (ret_origin)
		*ret_origin = eorig;
	return res;
}

TEEK_Result TEEK_CloseSession(TEEK_Session *session)
{
	struct teek_close_session_arg arg;
	int rc;

	memset(&arg, 0, sizeof(arg));

	if (!session)
		return;

	arg.session = session->session_id;

	if (!session->ctx->ctx->teedev->desc->ops->close_session)
		return -EINVAL;

	return session->ctx->ctx->teedev->desc \
		->ops->close_session(session->ctx->ctx, arg.session);
}

static int teek_invoke(struct tee_context *ctx,
				struct teek_buf_data *buf)
{
	int rc;
	size_t n;
	struct teek_invoke_arg *arg;
	struct teek_param *teek_params;
	struct tee_param *tee_params;

	if (!ctx->teedev->desc->ops->invoke_func)
		return -EINVAL;

	if (buf->buf_len > TEE_MAX_ARG_SIZE ||
		buf->buf_len < sizeof(struct teek_invoke_arg))
		return -EINVAL;

	arg = (struct teek_invoke_arg *)buf->buf_ptr;
	teek_params = (struct teek_param *)(arg + 1);

	pr_debug("arg header size	: 0x%08x.\n", sizeof(arg));
	pr_debug("params number		: 0x%08x.\n", arg->num_params);
	pr_debug("buffer len		: 0x%llx.\n", buf->buf_len);

	if (arg->num_params) {
		tee_params = kcalloc(arg->num_params, sizeof(struct tee_param),
				 GFP_KERNEL);
		if (!tee_params)
			return -ENOMEM;
		rc = params_from_teek(ctx, tee_params, 
					arg->num_params, teek_params);
		if (rc)
			goto out;
	}

	pr_debug("invoking TA/PTA invoke command ... \n");

	rc = ctx->teedev->desc->ops->invoke_func(ctx, 
			(struct tee_ioctl_invoke_arg *)arg, tee_params);
	if (rc)
		goto out;

	rc = params_to_teek(ctx, tee_params, 
			arg->num_params, teek_params);
	if (rc != TEEK_SUCCESS) {
		return TEEK_ERROR_GENERIC;
	}
out:
	if (tee_params) {
		/* Decrease ref count for all valid shared memory pointers */
		for (n = 0; n < arg->num_params; n++)
			if (tee_param_is_memref(tee_params + n) &&
				tee_params[n].u.memref.shm)
				tee_shm_put(tee_params[n].u.memref.shm);
		kfree(tee_params);
	}
	return rc;
}

spinlock_t teek_spin_lock;

TEEK_Result TEEK_InvokeCommand(TEEK_Session *session, uint32_t cmd_id,
			TEEK_Operation *operation, uint32_t *error_origin)
{
	struct teek_invoke_arg *arg = NULL;
	struct teek_param *params = NULL;
	TEEK_Result res = TEEK_ERROR_GENERIC;
	uint32_t eorig = 0;
	const size_t arg_size = sizeof(struct teek_invoke_arg) +
				TEEK_CONFIG_PAYLOAD_REF_COUNT *
					sizeof(struct teek_param);
	union {
		struct teek_invoke_arg arg;
		uint8_t data[arg_size];
	} buf;
	struct teek_buf_data buf_data;
	TEEK_SharedMemory shm[TEEK_CONFIG_PAYLOAD_REF_COUNT];
	int lock_flags;

	spin_lock_irqsave(&teek_spin_lock, lock_flags);

	memset(&buf, 0, sizeof(buf));
	memset(&buf_data, 0, sizeof(buf_data));
	memset(&shm, 0, sizeof(shm));

	if (!session) {
		pr_err("ERROR: NULL session ptr.\n");
		eorig = TEEK_ORIGIN_API;
		res = TEEK_ERROR_BAD_PARAMETERS;
		goto out;
	}

	buf_data.buf_ptr = (uintptr_t)&buf;
	buf_data.buf_len = sizeof(buf);

	arg = &buf.arg;
	arg->num_params = TEEK_CONFIG_PAYLOAD_REF_COUNT;
	params = (struct teek_param *)
			((unsigned char *)arg + sizeof(struct teek_invoke_arg));

	arg->session = session->session_id;
	arg->func = cmd_id;

	if (operation) {
		operation->session = session;
	}

	res = teek_pre_process_operation(session->ctx, operation, params, shm);
	if (res != TEEK_SUCCESS) {
		pr_err("ERROR: during params from teek to tee.");
		eorig = TEEK_ORIGIN_API;
		goto out;
	} else {
		pr_debug("Success: param from ops to teek_params");
	}

	res = teek_invoke(session->ctx->ctx, &buf_data);
	if (res != TEEK_SUCCESS) {
		pr_err("ERROR: during invoking commands.\n");
		eorig = TEEK_ORIGIN_COMMS;
		goto out;
	}

	res = arg->ret;
	eorig = arg->ret_origin;
	teek_post_process_operation(operation, params, shm);

	spin_unlock_irqrestore(&teek_spin_lock, lock_flags);

out:
	if (error_origin)
		*error_origin = eorig;
	return res;
}

EXPORT_SYMBOL(TEEK_InitializeContext);
EXPORT_SYMBOL(TEEK_FinalizeContext);
EXPORT_SYMBOL(TEEK_OpenSession);
EXPORT_SYMBOL(TEEK_CloseSession);
EXPORT_SYMBOL(TEEK_InvokeCommand);