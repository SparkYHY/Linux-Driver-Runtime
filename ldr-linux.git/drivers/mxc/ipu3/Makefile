# CFLAGS_ipu_capture.o := -DDEBUG
# CFLAGS_ipu_common.o := -DDEBUG
# CFLAGS_ipu_ic.o := -DDEBUG

# obj-$(CONFIG_MXC_IPU_V3) = mxc_ipu.o
obj-m = mxc_ipu.o

# obj-$(CONFIG_MXC_IPU_V3_PRG) += prg.o
# obj-$(CONFIG_MXC_IPU_V3_PRE) += pre.o
obj-m += prg.o
obj-m += pre.o

mxc_ipu-objs := ipu_common.o ipu_ic.o ipu_disp.o ipu_capture.o ipu_device.o \
		ipu_calc_stripes_sizes.o vdoa.o ipu_pixel_clk.o
