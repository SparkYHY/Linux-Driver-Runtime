ifneq ($(KERNELRELEASE),) 
# kbuild part of makefile
obj-m := $(MOD_NAME).o 
# CFLAGS_ipu_common.o := -marm -DDEBUG
# CFLAGS_ipu_ic.o := -marm -DDEBUG
# CFLAGS_ipu_capture.o := -marm -DDEBUG
# CFLAGS_dispatcher.o := -marm -DDEBUG

# ipu_device.o vdoa.o - discard
# ipu_disp.o - all empty function bodies

$(MOD_NAME)-objs := ipu_common.o ipu_ic.o ipu_capture.o \
		ipu_calc_stripes_sizes.o ipu_disp.o ipu_pixel_clk.o \
		dispatcher.o

else 
# normal makefile 
CFLAGS_MODULE := "-w"

KDIR        ?= $(LINUX_BUILD) 
STRIP       := $(CROSS)strip

all:
	make ARCH=arm CROSS_COMPILE=$(CROSS) CFLAGS_MODULE=$(CFLAGS_MODULE) -C $(KDIR) M=$$PWD 

strip:
	$(STRIP) --strip-unneeded $(MOD_NAME).ko

install:
	cp $(MOD_NAME).ko $(INSTALL_MOD_PATH)

clean:
	rm -rf *.o .*.cmd *.ko *.a *.mod *.mod.c modules.order Module.symvers .tmp_versions modules.builtin
endif
