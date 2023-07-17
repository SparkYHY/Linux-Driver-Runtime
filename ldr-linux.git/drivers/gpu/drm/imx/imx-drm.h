/* SPDX-License-Identifier: GPL-2.0 */
#ifndef _IMX_DRM_H_
#define _IMX_DRM_H_

#define MAX_CRTC	4

struct device_node;
struct drm_crtc;
struct drm_connector;
struct drm_device;
struct drm_display_mode;
struct drm_encoder;
struct drm_fbdev_cma;
struct drm_framebuffer;
struct drm_plane;
struct imx_drm_crtc;
struct platform_device;

struct imx_drm_device {
	struct drm_device			*drm;
	unsigned int				pipes;
	struct drm_fbdev_cma			*fbhelper;
	struct drm_atomic_state			*state;

	struct workqueue_struct			*dpu_nonblock_commit_wq;
	struct workqueue_struct			*dcss_nonblock_commit_wq;
	struct {
		wait_queue_head_t wait;
		bool pending;
	} commit;
};

struct imx_crtc_state {
	struct drm_crtc_state			base;
	u32					bus_format;
	u32					bus_flags;
	int					di_hsync_pin;
	int					di_vsync_pin;
};

static inline struct imx_crtc_state *to_imx_crtc_state(struct drm_crtc_state *s)
{
	return container_of(s, struct imx_crtc_state, base);
}
int imx_drm_init_drm(struct platform_device *pdev,
		int preferred_bpp);
int imx_drm_exit_drm(void);

void imx_drm_mode_config_init(struct drm_device *drm);

struct drm_gem_cma_object *imx_drm_fb_get_obj(struct drm_framebuffer *fb);

int imx_drm_encoder_parse_of(struct drm_device *drm,
	struct drm_encoder *encoder, struct device_node *np);

void imx_drm_connector_destroy(struct drm_connector *connector);
void imx_drm_encoder_destroy(struct drm_encoder *encoder);

int ipu_planes_assign_pre(struct drm_device *dev,
			  struct drm_atomic_state *state);

#endif /* _IMX_DRM_H_ */
