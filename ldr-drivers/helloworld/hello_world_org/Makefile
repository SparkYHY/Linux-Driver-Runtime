ifneq ($(KERNELRELEASE),) 
# kbuild part of makefile 
obj-m := hello_world.o 

else 
# normal makefile 
KDIR ?= $(LINUX_BUILD) 
CFLAGS := "-w"

all:
	make ARCH=arm CROSS_COMPILE=$(CROSS) CFLAGS_MODULE=$(CFLAGS) -C $(KDIR) M=$$PWD 

install:
	cp hello_world.ko $(INSTALL_MOD_PATH)

clean:
	rm -rf *.o .*.cmd *.ko *.a *.mod hello_world.mod.c modules.order Module.symvers .tmp_versions
endif