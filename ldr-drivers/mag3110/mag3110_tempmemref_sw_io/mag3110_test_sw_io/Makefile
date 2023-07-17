ifneq ($(KERNELRELEASE),) 
# kbuild part of makefile
obj-m := $(MOD_NAME).o 

$(MOD_NAME)-objs := test.o

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
	rm -rf *.o *.o.d .*.cmd *.ko *.a *.mod *.mod.c modules.order Module.symvers .tmp_versions modules.builtin
endif
