#ifndef __TEEK_H
#define __TEEK_H

#include <linux/device.h>
#include <linux/idr.h>
#include <linux/kref.h>
#include <linux/list.h>
#include <linux/mod_devicetable.h>
#include <linux/tee.h>
#include <linux/tee_drv.h>
#include <linux/types.h>
#include <linux/uuid.h>

#define TEEK_CONFIG_PAYLOAD_REF_COUNT	4

#define TEEK_CONFIG_SHAREDMEM_MAX_SIZE	ULONG_MAX

#define TEEK_NONE			0x00000000
#define TEEK_VALUE_INPUT		0x00000001
#define TEEK_VALUE_OUTPUT		0x00000002
#define TEEK_VALUE_INOUT		0x00000003
#define TEEK_MEMREF_TEMP_INPUT		0x00000005
#define TEEK_MEMREF_TEMP_OUTPUT		0x00000006
#define TEEK_MEMREF_TEMP_INOUT		0x00000007
#define TEEK_MEMREF_WHOLE		0x0000000C
#define TEEK_MEMREF_PARTIAL_INPUT	0x0000000D
#define TEEK_MEMREF_PARTIAL_OUTPUT	0x0000000E
#define TEEK_MEMREF_PARTIAL_INOUT	0x0000000F

#define TEEK_MEM_INPUT	0x00000001
#define TEEK_MEM_OUTPUT	0x00000002

#define TEEK_SUCCESS				0x00000000
#define TEEK_ERROR_STORAGE_NOT_AVAILABLE	0xF0100003
#define TEEK_ERROR_GENERIC			0xFFFF0000
#define TEEK_ERROR_ACCESS_DENIED		0xFFFF0001
#define TEEK_ERROR_CANCEL			0xFFFF0002
#define TEEK_ERROR_ACCESS_CONFLICT		0xFFFF0003
#define TEEK_ERROR_EXCESS_DATA			0xFFFF0004
#define TEEK_ERROR_BAD_FORMAT			0xFFFF0005
#define TEEK_ERROR_BAD_PARAMETERS		0xFFFF0006
#define TEEK_ERROR_BAD_STATE			0xFFFF0007
#define TEEK_ERROR_ITEM_NOT_FOUND		0xFFFF0008
#define TEEK_ERROR_NOT_IMPLEMENTED		0xFFFF0009
#define TEEK_ERROR_NOT_SUPPORTED		0xFFFF000A
#define TEEK_ERROR_NO_DATA			0xFFFF000B
#define TEEK_ERROR_OUT_OF_MEMORY		0xFFFF000C
#define TEEK_ERROR_BUSY				0xFFFF000D
#define TEEK_ERROR_COMMUNICATION		0xFFFF000E
#define TEEK_ERROR_SECURITY			0xFFFF000F
#define TEEK_ERROR_SHORT_BUFFER			0xFFFF0010
#define TEEK_ERROR_EXTERNAL_CANCEL		0xFFFF0011
#define TEEK_ERROR_TARGET_DEAD			0xFFFF3024

#define TEEK_ORIGIN_API			0x00000001
#define TEEK_ORIGIN_COMMS		0x00000002
#define TEEK_ORIGIN_TEE			0x00000003
#define TEEK_ORIGIN_TRUSTED_APP		0x00000004

#define TEEK_LOGIN_PUBLIC		0x00000000
#define TEEK_LOGIN_USER			0x00000001
#define TEEK_LOGIN_GROUP		0x00000002
#define TEEK_LOGIN_APPLICATION		0x00000004
#define TEEK_LOGIN_USER_APPLICATION	0x00000005
#define TEEK_LOGIN_GROUP_APPLICATION	0x00000006
#define TEEK_LOGIN_REE_KERNEL		0x80000000

#define TEEK_PARAM_TYPES(p0, p1, p2, p3) \
	((p0) | ((p1) << 4) | ((p2) << 8) | ((p3) << 12))

#define TEEK_PARAM_TYPE_GET(p, i) (((p) >> (i * 4)) & 0xF)

struct teek_shm_register_data {
	__u64 addr;
	__u64 length;
	__u32 flags;
	__s32 id;
};

struct teek_shm_alloc_data {
	__u64 size;
	__u32 flags;
	__s32 id;
};


struct teek_buf_data {
	__u64 buf_ptr;
	__u64 buf_len;
};

struct teek_param_memref {
	__u64 shm_offs;
	__u64 size;
	__s64 shm_id;
};

struct teek_param_value {
	__u64 a;
	__u64 b;
	__u64 c;
};

struct teek_param {
	__u64 attr;
	union {
		struct teek_param_memref memref;
		struct teek_param_value value;
	} u;
};

#define TEEK_UUID_LEN		16

struct teek_open_session_arg {
	__u8 uuid[TEEK_UUID_LEN];
	__u8 clnt_uuid[TEEK_UUID_LEN];
	__u32 clnt_login;
	__u32 cancel_id;
	__u32 session;
	__u32 ret;
	__u32 ret_origin;
	__u32 num_params;
	/* num_params tells the actual number of element in params */
	struct teek_param params[];
};

struct teek_invoke_arg {
	__u32 func;
	__u32 session;
	__u32 cancel_id;
	__u32 ret;
	__u32 ret_origin;
	__u32 num_params;
} __aligned(8);

struct teek_close_session_arg {
	__u32 session;
};

typedef uint32_t TEEK_Result;

typedef struct {
	uint32_t timeLow;
	uint16_t timeMid;
	uint16_t timeHiAndVersion;
	uint8_t clockSeqAndNode[8];
} TEEK_UUID;

typedef struct {
	struct tee_context *ctx;
	bool reg_mem;
} TEEK_Context;

typedef struct {
	TEEK_Context *ctx;
	uint32_t session_id;
} TEEK_Session;

typedef struct {
	void *buffer;
	size_t size;
} TEEK_TempMemoryReference;

typedef struct {
	uint32_t a;
	uint32_t b;
} TEEK_Value;

typedef struct {
	void *buffer;
	size_t size;
	uint32_t flags;

	int id;
	size_t alloced_size;
	void *shadow_buffer;
	int registered_fd;
	bool buffer_allocated;
} TEEK_SharedMemory;

typedef struct {
	TEEK_SharedMemory *parent;
	size_t size;
	size_t offset;
} TEEK_RegisteredMemoryReference;

typedef union {
	TEEK_TempMemoryReference tmpref;
	TEEK_RegisteredMemoryReference memref;
	TEEK_Value value;
} TEEK_Parameter;

typedef struct {
	uint32_t started;
	uint32_t paramTypes;
	TEEK_Parameter params[TEEK_CONFIG_PAYLOAD_REF_COUNT];
	TEEK_Session *session;
} TEEK_Operation;

TEEK_Result TEEK_InitializeContext(TEEK_Context *teek_ctx);
void TEEK_FinalizeContext(TEEK_Context *teek_ctx);
TEEK_Result TEEK_OpenSession(TEEK_Context *ctx, 
			TEEK_Session *session,
			const TEEK_UUID *destination,
			uint32_t connection_method, const void *connection_data,
			TEEK_Operation *operation, uint32_t *ret_origin);
TEEK_Result TEEK_CloseSession(TEEK_Session *session);
TEEK_Result TEEK_InvokeCommand(TEEK_Session *session, 
			uint32_t cmd_id,
			TEEK_Operation *operation, 
			uint32_t *error_origin);

#endif