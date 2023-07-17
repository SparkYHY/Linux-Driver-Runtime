#ifndef _LDR_DISPATCHER_H_
#define _LDR_DISPATCHER_H_

#define MAX_PARAM_BUF_SIZE	256

enum ipu_func {
	IPU_PROBE,
	IPU_INIT_CHANNEL,
	IPU_UNINIT_CHANNEL,
	IPU_INIT_CHANNEL_BUFFER,
	IPU_UPDATE_CHANNEL_BUFFER,
	IPU_SELECT_BUFFER,
	IPU_ENABLE_CHANNEL,
	IPU_DISABLE_CHANNEL,
	IPU_ENABLE_CSI,
	IPU_DISABLE_CSI,
	IPU_REQUEST_IRQ,
	IPU_FREE_IRQ,
};

enum itr_return {
	ITRR_NONE,
	ITRR_HANDLED,
};

struct itr_handler {
	size_t it;
	uint32_t flags;
	enum itr_return (*handler)(struct itr_handler *h);
	void *data;
	void *link;
};

int sw_probe(unsigned char *param_buf);

int sw_ipu_init_channel(unsigned char *param_buf);
int sw_ipu_uninit_channel(unsigned char *param_buf);
int sw_ipu_init_channel_buffer(unsigned char *param_buf);
int sw_ipu_update_channel_buffer(unsigned char *param_buf);
int sw_ipu_select_buffer(unsigned char *param_buf);
int sw_ipu_enable_channel(unsigned char *param_buf);
int sw_ipu_disable_channel(unsigned char *param_buf);
int sw_ipu_enable_csi(unsigned char *param_buf);
int sw_ipu_disable_csi(unsigned char *param_buf);
int sw_ipu_request_irq(unsigned char *param_buf);
int sw_ipu_free_irq(unsigned char *param_buf);

enum itr_return sw_ipu_sync_irq_handler(struct itr_handler *h);
enum itr_return sw_ipu_err_irq_handler(struct itr_handler *h);

int dispatch(unsigned int func_id, unsigned char *param_buf);

/* SW Routines - undefined during building */
unsigned int get_device_base(unsigned int pa);
int ldr_sw_driver_register(unsigned int driver_id, 
	int (*dispatch)(unsigned int func_id, unsigned char *param_buf),
	void *sv);
uint32_t ldr_sw_irq_register(unsigned int irq,
			     enum itr_return (*handler)(struct itr_handler *h),
			     void *sv);
uint32_t ldr_sw_set_cur_driver_id(unsigned int driver_id);

#endif