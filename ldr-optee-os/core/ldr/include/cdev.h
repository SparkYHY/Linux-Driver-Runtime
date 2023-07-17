#include <compiler.h>
#include <inttypes.h>
#include <malloc.h>
#include <mm/core_mmu.h>
#include <mm/tee_pager.h>
#include <mm/tee_mm.h>
#include <stdio.h>
#include <string.h>
#include <string_ext.h>
#include <tee_internal_api_extensions.h>
#include <types_ext.h>

#include "module.h"

#define CONFIG_EPOLL 1
#define CONFIG_FS_POSIX_ACL 1
#define __NEED_I_SIZE_ORDERED 1
#define CONFIG_FSNOTIFY 1
#define CONFIG_FILE_LOCKING 1

typedef unsigned long dev_t;
typedef unsigned long long loff_t;

struct file_operations {
	struct module *owner;
	void *llseek;
	ssize_t (*read) (struct file *, char *, size_t, loff_t *); //
	ssize_t (*write) (struct file *, const char *, size_t, loff_t *); //
	void *read_iter;
	void *write_iter;
	void *iterate;
	void *iterate_shared;
	void *poll;
	void *unlocked_ioctl;
	void *compat_ioctl;
	void *mmap;
	int (*open) (struct inode *, struct file *); //
	void *flush;
	int (*release) (struct inode *, struct file *); //
	// the last function defined by scull
};

/**
 * For now, ldr identifies each cdev driver by its name.
 * 
 * TODO: We may need 'struct kobject' to manage dependency relationship 
 *       between modules.
 * TODO: add major and minor number to identify a cdev
*/
struct cdev {
	// struct kobject kobj;
	char *name; // first field of struct kobject
	unsigned char kobj[32];
	struct module *owner;
	const struct file_operations *ops;
	struct list_head list;
	dev_t dev; // not used for now
	unsigned int count;
};

struct file {
	union {
		unsigned char fu_llist[4];
		unsigned char fu_rcuhead[8];
	} f_u;
	unsigned char f_path[8];
	struct inode *f_inode; //
	const struct file_operations *f_op; //

	unsigned char f_lock[4];
	unsigned char f_write_hint[4];
	unsigned char f_count[4];
	unsigned int f_flags; //
	unsigned char f_mode[4];
	unsigned char f_pos_lock[20];
	uint64_t f_pos; // 
	unsigned char f_owner[24];
	unsigned char f_cred[8]; // with padding of 4 bytes
	unsigned char f_ra[32];

	unsigned char f_version[8];
#ifdef CONFIG_SECURITY
	void *f_security;
#endif
	/* needed for tty driver, and maybe others */
	void *private_data;

#ifdef CONFIG_EPOLL
	/* Used by fs/eventpoll.c to link all the hooks to this file */
	unsigned char f_ep_links[8];
	unsigned char f_tfile_llink[8];
#endif /* #ifdef CONFIG_EPOLL */
	unsigned char f_mapping[4];
	unsigned char f_wb_err[4];
} __attribute__((__aligned__(4)));

struct inode {
	unsigned char i_mode[2];
	unsigned char i_opflags[2];
	unsigned char i_uid[4];
	unsigned char i_gid[4];
	unsigned int i_flags; // 

#ifdef CONFIG_FS_POSIX_ACL
	unsigned char i_acl[4];
	unsigned char i_default_acl[4];
#endif

	unsigned char i_op[4];
	unsigned char i_sb[4];
	unsigned char i_mapping[4];

#ifdef CONFIG_SECURITY
	unsigned char i_security[4];
#endif

	unsigned char i_ino[4];
	union {
		unsigned char i_nlink[4];
		unsigned char __i_nlink[4];
	};
	unsigned char i_rdev[4];
	unsigned char i_size[8];
	unsigned char i_atime[8];
	unsigned char i_mtime[8];
	unsigned char i_ctime[8];
	unsigned char i_lock[4]; 
	unsigned char i_bytes[4]; // 2 bytes padding
	unsigned char i_blkbits[4];
	unsigned char i_write_hint[4];
	unsigned char i_blocks[8];

#ifdef __NEED_I_SIZE_ORDERED
	unsigned char i_size_seqcount[4];
#endif

	/* Misc */
	unsigned char i_state[4];
	unsigned char i_rwsem[24];

	unsigned char dirtied_when[4];
	unsigned char dirtied_time_when[4];

	unsigned char i_hash[8];
	unsigned char i_io_list[8];
#ifdef CONFIG_CGROUP_WRITEBACK
	struct bdi_writeback *i_wb;

	int i_wb_frn_winner;
	u16 i_wb_frn_avg_time;
	u16 i_wb_frn_history;
#endif
	unsigned char i_lru[8];
	unsigned char i_sb_list[8];
	unsigned char i_wb_list[8];
	union {
		unsigned char i_dentry[4];
		unsigned char i_rcu[8];
	};
	unsigned char i_version[8];
	unsigned char i_count[4];
	unsigned char i_dio_count[4];
	unsigned char i_writecount[4];
#if defined(CONFIG_IMA)
	unsigned char i_readcount[4];
#endif

	const struct file_operations *i_fop; //
	unsigned char i_flctx[4];
	unsigned char i_data[96];
	unsigned char i_devices[8];
	union {
		unsigned char i_pipe[4];
		unsigned char i_bdev[4];
		struct cdev *i_cdev; // 
		unsigned char i_link[4];
		unsigned char i_dir_seq[4];
	};

	unsigned char i_generation[4];

#ifdef CONFIG_FSNOTIFY
	unsigned char i_fsnotify_mask[4];
	unsigned char i_fsnotify_marks[4];
#endif

#ifdef CONFIG_FS_ENCRYPTION
	struct fscrypt_info *i_crypt_info;
#endif

	void *i_private;
} __attribute__((aligned(4)));

struct core_cdev_node {
	struct cdev *cdev;
	struct inode *inode;
	TAILQ_ENTRY(core_cdev_node) link;
};

struct ldr_session {
	unsigned int s_num;
	struct cdev *s_cdev;
	struct inode *s_inode;
	struct file *s_file;
	TAILQ_ENTRY(ldr_session) link;
};

struct core_cdev_node *find_cdev(const char *name);
