/**
 * LDR CA
 *
 */

#include <err.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

/* OP-TEE TEE client API (built by optee_client) */
#include <tee_client_api.h>

/* For the UUID (found in the TA's h-file(s)) */
#include "ldr_pta.h"

/* TEE resources */
struct ldr_ctx {
	TEEC_Context ctx;
	TEEC_Session sess;
};

void prepare_tee_session(struct ldr_ctx *ctx)
{
	TEEC_UUID uuid = PTA_LDR_UUID;
	uint32_t origin;
	TEEC_Result res;

	/* Initialize a context connecting us to the TEE */
	res = TEEC_InitializeContext(NULL, &ctx->ctx);
	if (res != TEEC_SUCCESS)
		errx(1, "TEEC_InitializeContext failed with code 0x%x", res);

	/* Open a session with the TA */
	res = TEEC_OpenSession(&ctx->ctx, &ctx->sess, &uuid,
			       TEEC_LOGIN_PUBLIC, NULL, NULL, &origin);
	if (res != TEEC_SUCCESS)
		errx(1, "TEEC_Opensession failed with code 0x%x origin 0x%x",
			res, origin);
}

void terminate_tee_session(struct ldr_ctx *ctx)
{
	TEEC_CloseSession(&ctx->sess);
	TEEC_FinalizeContext(&ctx->ctx);
}

void load_module(struct ldr_ctx *ctx, char *mod_path)
{
	TEEC_Operation op;
	uint32_t origin;
	TEEC_Result res;

	int ko_fd;
	unsigned char *buf;
	long buf_size = 0x20000;
	long module_size;

	// open the .ko file
	ko_fd = open(mod_path, O_RDWR);
	if (ko_fd < 0) {
		printf("module file open fails.\n");
		exit(-1);
	}

	/**
	 * allocate a buffer of 0x20 pages, may take some while.
	 * 
	 * A big buffer size like 0x1000000 for a temperary buffer will
	 * cause panic inside OPTEE. Here, we only use a small buffer
	 * which is just enough to load our hello_world module (0x152f0)
	 * 
	 * TODO: Use shared memory registration routines provided by
	 * 	 OPTEE.
	*/
	buf = malloc(buf_size);
	if (!buf) {
		printf("NW buffer allocation fails.\n");
		exit(-1);
	}

	// read the .ko file into the module_buffer
	module_size = read(ko_fd, buf, buf_size);
	if (module_size <= 0) {
		printf(".ko file read fails.\n");
		exit(-1);
	} else {
		printf("Total size read : 0x%08x bytes.\n", module_size);
	}

	memset(&op, 0, sizeof(op));
	op.paramTypes = TEEC_PARAM_TYPES(TEEC_VALUE_INOUT,
					 TEEC_MEMREF_TEMP_INOUT,
					 TEEC_NONE,
					 TEEC_NONE);

	op.params[0].value.a = 0;
	op.params[0].value.b = module_size;
	op.params[1].tmpref.buffer = buf;
	op.params[1].tmpref.size = buf_size;

	res = TEEC_InvokeCommand(&ctx->sess, LDR_CMD_LOAD_MODULE,
				 &op, &origin);
	if (res != TEEC_SUCCESS)
		errx(1, "TEEC_InvokeCommand(PREPARE) failed 0x%x origin 0x%x",
			res, origin);
}

int open_cdev(struct ldr_ctx *ctx, char *mod_name)
{
	TEEC_Operation op;
	uint32_t origin;
	TEEC_Result res;

	unsigned char *buf;
	long buf_size = 0x20;

	if (strlen(mod_name) >= buf_size) {
		printf("ERROR: mod name too long.\n");
		return -1;
	}

	buf = malloc(buf_size);
	if (!buf) {
		printf("NW buffer allocation fails.\n");
		exit(-1);
	}

	memset(buf, NULL, buf_size);
	memcpy(buf, mod_name, strlen(mod_name));

	memset(&op, 0, sizeof(op));
	op.paramTypes = TEEC_PARAM_TYPES(TEEC_VALUE_INOUT,
					 TEEC_MEMREF_TEMP_INOUT,
					 TEEC_NONE,
					 TEEC_NONE);

	op.params[0].value.a = 0;
	op.params[0].value.b = 0;
	op.params[1].tmpref.buffer = buf;
	op.params[1].tmpref.size = buf_size;

	res = TEEC_InvokeCommand(&ctx->sess, LDR_CMD_CDEV_OPEN,
				 &op, &origin);
	if (res != TEEC_SUCCESS || op.params[0].value.a == 0)
		errx(1, "cdev open failed 0x%x origin 0x%x",
			res, origin);
	else
		printf("ldr session number: %d\n", op.params[0].value.a);
}

int release_cdev(struct ldr_ctx *ctx, unsigned int sess_num)
{
	TEEC_Operation op;
	uint32_t origin;
	TEEC_Result res;

	memset(&op, 0, sizeof(op));
	op.paramTypes = TEEC_PARAM_TYPES(TEEC_VALUE_INOUT,
					 TEEC_NONE,
					 TEEC_NONE,
					 TEEC_NONE);

	op.params[0].value.a = sess_num;
	op.params[0].value.b = 0;

	res = TEEC_InvokeCommand(&ctx->sess, LDR_CMD_CDEV_RELEASE,
				 &op, &origin);
	if (res != TEEC_SUCCESS)
		errx(1, "sess release failed 0x%x origin 0x%x",
			res, origin);
	else
		printf("ldr session %d released successfully.\n", 
			op.params[0].value.a);
}


int read_cdev(struct ldr_ctx *ctx, 
              unsigned int sess_num,
			  unsigned char *buf,
			  size_t buf_size,
			  size_t count,
			  unsigned int pos)
{
	TEEC_Operation op;
	uint32_t origin;
	TEEC_Result res;

	/**
	 * TEE_Param[0].value.a			sess num
	 * TEE_Param[0].value.b 		# of chars actually read
	 * 
	 * TEE_Param[1].value.a			required count
	 * TEE_Param[1].value.b 		pos
	 * 
	 * TEE_Param[2].memref.buffer	buffer
	 * TEE_Param[2].memref.size   	buffer size
	*/

	memset(&op, 0, sizeof(op));
	op.paramTypes = TEEC_PARAM_TYPES(TEEC_VALUE_INOUT,
					 TEEC_VALUE_INOUT,
					 TEEC_MEMREF_TEMP_INOUT,
					 TEEC_NONE);

	op.params[0].value.a = sess_num;
	op.params[0].value.b = 0;

	op.params[1].value.a = count;
	op.params[1].value.b = pos;

	op.params[2].tmpref.buffer = buf;
	op.params[2].tmpref.size = buf_size;

	res = TEEC_InvokeCommand(&ctx->sess, LDR_CMD_CDEV_READ,
				 &op, &origin);
	if (res != TEEC_SUCCESS)
		errx(1, "read from sess %d failed 0x%x origin 0x%x",
			sess_num, res, origin);
	else
		printf("%d bytes read from sess %d.\n", 
			op.params[0].value.b, op.params[0].value.a);
}

int write_cdev(struct ldr_ctx *ctx, 
              unsigned int sess_num,
			  unsigned char *buf,
			  size_t buf_size,
			  size_t count,
			  unsigned int pos)
{
	TEEC_Operation op;
	uint32_t origin;
	TEEC_Result res;

	if (buf_size < count) {
		printf("ERROR: write exceeds buffer.\n");
		return 0;
	}

	/**
	 * TEE_Param[0].value.a			sess num
	 * TEE_Param[0].value.b 		# of chars actually write
	 * 
	 * TEE_Param[1].value.a			required count
	 * TEE_Param[1].value.b 		pos
	 * 
	 * TEE_Param[2].memref.buffer	buffer
	 * TEE_Param[2].memref.size   	buffer size
	*/

	memset(&op, 0, sizeof(op));
	op.paramTypes = TEEC_PARAM_TYPES(TEEC_VALUE_INOUT,
					 TEEC_VALUE_INOUT,
					 TEEC_MEMREF_TEMP_INOUT,
					 TEEC_NONE);

	op.params[0].value.a = sess_num;
	op.params[0].value.b = 0;

	op.params[1].value.a = count;
	op.params[1].value.b = pos;

	op.params[2].tmpref.buffer = malloc(buf_size);
	op.params[2].tmpref.size = buf_size;
	memcpy(op.params[2].tmpref.buffer, buf, buf_size);

	printf("%s\n", op.params[2].tmpref.buffer);

	res = TEEC_InvokeCommand(&ctx->sess, LDR_CMD_CDEV_WRITE,
				 &op, &origin);
	if (res != TEEC_SUCCESS)
		errx(1, "write to sess %d failed 0x%x origin 0x%x",
			sess_num, res, origin);
	else
		printf("%d bytes write to sess %d.\n", 
			op.params[0].value.b, op.params[0].value.a);
}

void print_usage() {
	printf("$ ldr load_module @mod_path \n");
	printf("$ ldr open_cdev @mod_name \n");
	printf("$ ldr release_cdev @sess_num \n");
	printf("$ ldr read_cdev @sess_num @count @buf_size @pos \n");
	printf("$ ldr write_cdev @sess_num @string @pos \n");
}

int main(int argc, char **argv)
{
	struct ldr_ctx ctx;
	char* mod_path;
	unsigned int command;
	unsigned int sess_num;
	size_t count;
	unsigned char *buf;
	size_t buf_size;
	size_t pos;

	if (argc < 3) {
		printf("Invalid arguments.\n");
		return -1;
	}

	if (strcmp(argv[1], "load_module") == 0) {
		command = LDR_CMD_LOAD_MODULE;
	} else if (strcmp(argv[1], "open_cdev") == 0) {
		command = LDR_CMD_CDEV_OPEN;
	} else if (strcmp(argv[1], "release_cdev") == 0) {
		command = LDR_CMD_CDEV_RELEASE;
	} else if (strcmp(argv[1], "write_cdev") == 0) {
		command = LDR_CMD_CDEV_WRITE;
	} else if (strcmp(argv[1], "read_cdev") == 0) {
		command = LDR_CMD_CDEV_READ;
	} else {
		printf("ERROR: Unknown command.\n");
		print_usage();
		return -1;
	}

	switch (command) {
		case LDR_CMD_LOAD_MODULE:
			// $ ldr load_module @mod_path
			mod_path = argv[2];
			printf("Module name: %s.\n", mod_path);

			printf("Prepare session with LDR PTA\n");
			prepare_tee_session(&ctx);

			printf("Invoke load_module function of LDR PTA.\n");
			load_module(&ctx, mod_path);

			terminate_tee_session(&ctx);
			return 0;

		case LDR_CMD_CDEV_OPEN:
			// $ ldr open_cdev @mod_name
			mod_path = argv[2];
			printf("open new session to driver %s.\n", mod_path);

			printf("Prepare session with LDR PTA\n");
			sleep(0.5);
			prepare_tee_session(&ctx);

			printf("Invoke cdev_open function of LDR PTA.\n");
			sleep(0.5);
			open_cdev(&ctx, mod_path);

			terminate_tee_session(&ctx);
			return 0;

		case LDR_CMD_CDEV_RELEASE:
			// $ ldr release_cdev @sess_num
			sess_num = argv[2][0] - '0';
			printf("sess num: %d\n", sess_num);

			printf("Prepare session with LDR PTA\n");
			sleep(0.5);
			prepare_tee_session(&ctx);

			printf("Invoke cdev_release function of LDR PTA.\n");
			sleep(0.5);
			release_cdev(&ctx, sess_num);

			terminate_tee_session(&ctx);
			return 0;

		case LDR_CMD_CDEV_READ:
			// $ ldr read_cdev @sess_num @count @buf_size @pos
			sess_num = argv[2][0] - '0';
			if (argv[3] == NULL) {
				printf("ERROR: count missing for read.\n");
				return -1;
			} else {
				count = atoi(argv[3]);
			}
			if (argv[4] == NULL) {
				buf_size = count;
			} else {
				buf_size = atoi(argv[4]);
			}			
			if (argv[5] == NULL) {
				pos = 0;
			} else {
				pos = atoi(argv[5]);
			}

			printf("Prepare reading from SW scull: \n");
			
			buf = malloc(buf_size);

			printf("  sess num: %d\n", sess_num);
			printf("  buf ptr : 0x%08x\n", buf);
			printf("  buf size: %d\n", buf_size);
			printf("  count   : %d\n", count);
			printf("  pos     : %d\n", pos);

			printf("Prepare session with LDR PTA\n");
			sleep(0.5);
			prepare_tee_session(&ctx);

			printf("Invoke cdev_read function of LDR PTA.\n");
			sleep(0.5);
			read_cdev(&ctx, sess_num, buf, buf_size, count, pos);

			/**
			 * TODO: a well structured dump
			*/
			printf("read: %s\n", buf);

			sleep(0.5);
			terminate_tee_session(&ctx);
			return 0;

		case LDR_CMD_CDEV_WRITE:
			// $ ldr write_cdev @sess_num @string @pos
			sess_num = argv[2][0] - '0';
			if (argv[3] == NULL) {
				printf("ERROR: input missing for write.\n");
				return -1;
			} else {
				buf_size = strlen(argv[3]) + 1;
				count = strlen(argv[3]);
				buf = malloc(buf_size);
				memcpy(buf, argv[3], buf_size);
			}
			if (argv[4] == NULL) {
				pos = 0;
			} else {
				pos = atoi(argv[4]);
			}

			printf("Prepare writing to SW scull: \n");

			printf("  sess num: %d\n", sess_num);
			printf("  buf     : %s\n", buf);
			printf("  buf size: %d\n", buf_size);
			printf("  count   : %d\n", count);
			printf("  pos     : %d\n", pos);

			printf("Prepare session with LDR PTA\n");
			sleep(0.5);
			prepare_tee_session(&ctx);

			printf("Invoke cdev_write function of LDR PTA.\n");
			sleep(0.5);
			write_cdev(&ctx, sess_num, buf, buf_size, count, pos);

			sleep(0.5);
			terminate_tee_session(&ctx);
			return 0;

		default:		
		break;
	}
	return 0;
}
