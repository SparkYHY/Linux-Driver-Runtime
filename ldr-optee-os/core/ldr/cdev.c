/**
 * /linux/fs/char_dev.c
 * 
 * This .c source file implements the ldr lightweighted module
 * management system. For now, we only provide support for cdev.
 * 
 * TODO: description.
 * 
 * For now, we only consider 32-bit ELF for ARMv7
 * 
*/

#include <arm.h>
#include <assert.h>
#include <compiler.h>
#include <config.h>
#include <console.h>
#include <initcall.h>
#include <inttypes.h>
#include <keep.h>
#include <kernel/boot.h>
#include <kernel/export.h>
#include <kernel/interrupt.h>
#include <kernel/linker.h>
#include <kernel/misc.h>
#include <kernel/panic.h>
#include <kernel/thread.h>
#include <libfdt.h>
#include <malloc.h>
#include <mm/core_memprot.h>
#include <mm/core_mmu.h>
#include <mm/tee_mm.h>
#include <mm/tee_mmu.h>
#include <mm/tee_pager.h>
#include <stdio.h>
#include <sys/queue.h>
#include <trace.h>
#include <utee_defines.h>
#include <optee_rpc_cmd.h>
// #include "dtc_util.h"

#include "module.h"
#include "cdev.h"

#include <ldr/ldr.h>		/* LDR */

/**
 * All modules will be placed inside a queue for now.
*/

TAILQ_HEAD(cdev_queue, core_cdev_node);

struct cdev_queue core_cdev_queue = 
	TAILQ_HEAD_INITIALIZER(core_cdev_queue);

struct core_cdev_node *find_cdev(const char *name) {
	struct core_cdev_node *cdev_node;

	if (TAILQ_EMPTY(&core_cdev_queue)) {
		EMSG("ERROR: core_cdev_queue is empty.");
		return NULL;
	}

	TAILQ_FOREACH(cdev_node, &core_cdev_queue, link) {
		if (strcmp(cdev_node->cdev->name, name) == 0) {
			return cdev_node;
		}
	}

	EMSG("ERROR: no driver named: %s", name);
	return NULL;
}

void cdev_init(struct cdev *cdev, const struct file_operations *fops)
{
	memset(cdev, 0, sizeof *cdev);
	cdev->ops = fops;
}

int cdev_add(struct cdev *p, dev_t dev, unsigned count)
{
	int error;

	p->dev = dev;
	p->count = count;
	p->name = p->owner->name;

	DMSG("Add new cdev: %s.", p->name);

	struct core_cdev_node *cdev_node = 
			calloc(1, sizeof(*cdev_node));
	struct inode *cdev_inode = 
			calloc(1, sizeof(*cdev_inode));
	
	if (cdev_node == NULL || cdev_inode == NULL) {
		EMSG("ERROR: allocation fails");
		return TEE_ERROR_OUT_OF_MEMORY;
	}

	cdev_inode->i_cdev = p;

	cdev_node->cdev = p;
	cdev_node->inode = cdev_inode;

	TAILQ_INSERT_TAIL(&core_cdev_queue, cdev_node, link);

	return 0;
}

void cdev_del(struct cdev *p)
{
	if (p->count > 0) {
		EMSG("ERROR: cdev still in use, cannot remove.");
	}

	struct core_cdev_node *cdev_node;
	TAILQ_FOREACH(cdev_node, &core_cdev_queue, link) {
		if (strcmp(cdev_node->cdev->name, p->name) == 0) {
			TAILQ_REMOVE(&core_cdev_queue, cdev_node, link);
		}
	}

	free(p);
}

TEE_EXPORT_SYMBOL(cdev_init);
TEE_EXPORT_SYMBOL(cdev_add);
TEE_EXPORT_SYMBOL(cdev_del);

typedef unsigned long dev_t;
int alloc_chrdev_region(dev_t *a, unsigned b, unsigned c, const char *d) {
	return 0;
}
int register_chrdev_region(dev_t a, unsigned b, const char *c ) {
	return 0;
}
void unregister_chrdev_region(dev_t a, unsigned b) {}
TEE_EXPORT_SYMBOL(alloc_chrdev_region);
TEE_EXPORT_SYMBOL(register_chrdev_region);
TEE_EXPORT_SYMBOL(unregister_chrdev_region);

unsigned long
arm_copy_to_user(void *to, const void *from, unsigned long n) {
	memcpy(to, from, n);
	return 0;
}

unsigned long
arm_copy_from_user(void *to, const void *from, unsigned long n) {
	memcpy(to, from, n);
	return 0;
}
TEE_EXPORT_SYMBOL(arm_copy_to_user);
TEE_EXPORT_SYMBOL(arm_copy_from_user);

/**
 * device ops provided to user TAs.
*/
unsigned int sess_counter = 1;

#define O_ACCMODE	00000003
#define O_RDONLY	00000000
#define O_WRONLY	00000001

TAILQ_HEAD(ldr_sess_queue, ldr_session);

struct ldr_sess_queue ldr_sess_queue = 
	TAILQ_HEAD_INITIALIZER(ldr_sess_queue);

struct ldr_sesstion *_find_sess(int32_t sess_num) {
	struct ldr_session *sess;

	if (TAILQ_EMPTY(&ldr_sess_queue)) {
		EMSG("ERROR: ldr_sess_queue is empty.");
		return NULL;
	}

	TAILQ_FOREACH(sess, &ldr_sess_queue, link) {
		if (sess->s_num == sess_num) {
			sess->s_cdev->count--;
			DMSG("found sess #%d from cdev: %s", 
				sess_num, sess->s_cdev->name);
			return sess;
		}
	}

	return NULL;
}

/**
 * instead of using the complex linux dentry system, the single
 * string of char device driver is used to identify a specific
 * ldr driver module.
*/
int _cdev_open(const char *name) {
	struct ldr_session *sess;

	sess = malloc(sizeof(struct ldr_session));
	if (sess == NULL) {
		return TEE_ERROR_OUT_OF_MEMORY;
	}
	sess->s_num = sess_counter++;
	DMSG("open ldr device driver: %s, sess num: %d", 
		name, sess->s_num);

	struct core_cdev_node *core_cdev_node;
	core_cdev_node = find_cdev(name);
	if (core_cdev_node == NULL) {
		return TEE_ERROR_BAD_PARAMETERS;
	}
	sess->s_cdev = core_cdev_node->cdev;
	sess->s_cdev->count++;
	sess->s_inode = core_cdev_node->inode;

	sess->s_file = malloc(sizeof(struct file));
	if (sess->s_file == NULL) {
		EMSG("ERROR: s_file alloction fails.");
		return TEE_ERROR_OUT_OF_MEMORY;
	}
	sess->s_file->f_flags |= O_WRONLY;

	// add new session to the global session queue
	TAILQ_INSERT_TAIL(&ldr_sess_queue, sess, link);

	/**
	 * For now, ldr only considers char devices. Therefore, there
	 * is one-to-one mapping relationship between an inode and a
	 * cdev. Here, we uses cdev to manage char device drives.
	*/
	if (sess->s_cdev->ops->open != NULL) {
		sess->s_cdev->ops->open(sess->s_inode, sess->s_file);
	} else {
		DMSG("ERROR: NULL open function.");
		return 0;
	}

	return sess->s_num;
}

int _cdev_release(int32_t sess_num) {
	struct ldr_session *sess;
	sess = _find_sess(sess_num);

	if (sess == NULL) {
		EMSG("ERROR: session number %d not found.", sess_num);
		return TEE_ERROR_BAD_PARAMETERS;
	}

	if (sess->s_cdev->ops->release != NULL) {
		sess->s_cdev->ops->release(sess->s_inode, sess->s_file);
	}

	TAILQ_REMOVE(&ldr_sess_queue, sess, link);
	
	free(sess->s_file);
	free(sess);

	return TEE_SUCCESS;
}

int _cdev_read(unsigned int sess_num, char *buf,
		size_t count, unsigned int f_pos) {
	struct ldr_session *sess;
	sess = _find_sess(sess_num);
	loff_t pos;

	if (sess == NULL) {
		EMSG("ERROR: session number %d not found.", sess_num);
		return TEE_ERROR_BAD_PARAMETERS;
	}

	pos = f_pos;

	if (sess->s_cdev->ops->read != NULL) {
		return sess->s_cdev->ops->read(
			sess->s_file, buf, count, &pos);
	} else {
		EMSG("ERROR: no read op is implemented for driver %s",
			sess->s_cdev->name);
		return 0;
	}
}

int _cdev_write(unsigned int sess_num, const char *buf,
		size_t count, unsigned int f_pos) {
	struct ldr_session *sess;
	sess = _find_sess(sess_num);
	loff_t pos;

	if (sess == NULL) {
		EMSG("ERROR: session number %d not found.", sess_num);
		return TEE_ERROR_BAD_PARAMETERS;
	}

	pos = f_pos;

	DMSG("cdev write: ");
	DMSG("buf content: %s", buf);
	DMSG("sess num: %d, buf ptr: 0x%08x, count: %d, f_pos: %ld",
		sess_num, buf, count, pos);

	if (sess->s_cdev->ops->write != NULL) {
		return sess->s_cdev->ops->write(
			sess->s_file, buf, count, &pos);
	} else {
		EMSG("ERROR: no write op is implemented for driver %s",
			sess->s_cdev->name);
		return 0;
	}
}

TEE_Result cdev_open(uint32_t type, TEE_Param p[TEE_NUM_PARAMS]) {
	if (TEE_PARAM_TYPES(
		TEE_PARAM_TYPE_VALUE_INOUT,
		TEE_PARAM_TYPE_MEMREF_INOUT,
		TEE_PARAM_TYPE_NONE,
		TEE_PARAM_TYPE_NONE) != type) {
		return TEE_ERROR_BAD_PARAMETERS;
	}

	/**
	 * TEE_Param[0].value.a			sess num
	 * TEE_Param[0].value.b 		unused
	 * 
	 * TEE_Param[1].memref.buffer	cdev name buffer
	 * TEE_Param[1].memref.size   	cdev name buffer size
	*/
	p[0].value.a = _cdev_open(p[1].memref.buffer);

	return TEE_SUCCESS;
}

TEE_Result cdev_release(uint32_t type, TEE_Param p[TEE_NUM_PARAMS]) {
	if (TEE_PARAM_TYPES(
		TEE_PARAM_TYPE_VALUE_INOUT,
		TEE_PARAM_TYPE_NONE,
		TEE_PARAM_TYPE_NONE,
		TEE_PARAM_TYPE_NONE) != type) {
		return TEE_ERROR_BAD_PARAMETERS;
	}

	/**
	 * TEE_Param[0].value.a			sess num
	 * TEE_Param[0].value.b 		unused
	*/
	return _cdev_release(p[0].value.a);
}

TEE_Result cdev_read(uint32_t type, TEE_Param p[TEE_NUM_PARAMS]) {
	if (TEE_PARAM_TYPES(
		TEE_PARAM_TYPE_VALUE_INOUT,
		TEE_PARAM_TYPE_VALUE_INOUT,
		TEE_PARAM_TYPE_MEMREF_INOUT,
		TEE_PARAM_TYPE_NONE) != type) {
		return TEE_ERROR_BAD_PARAMETERS;
	}

	/**
	 * TEE_Param[0].value.a		sess num
	 * TEE_Param[0].value.b 	# of chars actually read
	 * 
	 * TEE_Param[1].value.a		required count
	 * TEE_Param[1].value.b 	pos
	 * 
	 * TEE_Param[2].memref.buffer	buffer
	 * TEE_Param[2].memref.size   	buffer size
	*/
	if (p[2].memref.size < p[1].value.a) {
		EMSG("ERROR: Required read count %d exceeds buf size: %d",
			p[1].value.a, p[2].memref.size);
		return TEE_ERROR_BAD_PARAMETERS;
	}

	p[0].value.b = _cdev_read(p[0].value.a, 
			p[2].memref.buffer, 
			p[1].value.a, 
			p[1].value.b);

	return TEE_SUCCESS;
}

TEE_Result cdev_write(uint32_t type, TEE_Param p[TEE_NUM_PARAMS]) {
	if (TEE_PARAM_TYPES(
		TEE_PARAM_TYPE_VALUE_INOUT,
		TEE_PARAM_TYPE_VALUE_INOUT,
		TEE_PARAM_TYPE_MEMREF_INOUT,
		TEE_PARAM_TYPE_NONE) != type) {
		return TEE_ERROR_BAD_PARAMETERS;
	}

	/**
	 * TEE_Param[0].value.a		sess num
	 * TEE_Param[0].value.b 	# of chars actually write
	 * 
	 * TEE_Param[1].value.a		required count
	 * TEE_Param[1].value.b 	pos
	 * 
	 * TEE_Param[2].memref.buffer	buffer
	 * TEE_Param[2].memref.size   	buffer size
	*/
	if (p[2].memref.size < p[1].value.a) {
		EMSG("ERROR: Required write count %d exceeds buf size: %d",
			p[1].value.a, p[2].memref.size);
		return TEE_ERROR_BAD_PARAMETERS;
	}

	DMSG("write: buf content: %s", p[2].memref.buffer);

	p[0].value.b = _cdev_write(p[0].value.a, 
			p[2].memref.buffer, 
			p[1].value.a, 
			p[1].value.b);

	return TEE_SUCCESS;
}
