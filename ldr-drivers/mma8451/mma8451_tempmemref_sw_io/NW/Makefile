ifneq ($(KERNELRELEASE),) 
# kbuild part of makefile
obj-m := $(MOD_NAME).o 

$(MOD_NAME)-objs := mxc_mma8451.o

else 
# normal makefile 
CFLAGS := "-marm -nostdlib -fno-exceptions -lc -lgcc_eh -Wno-unused-variable"

KDIR        ?= $(LINUX_BUILD) 
STRIP       := $(CROSS)strip

all:
	make ARCH=arm CROSS_COMPILE=$(CROSS) CFLAGS=$(CFLAGS) -C $(KDIR) M=$$PWD 

strip:
	$(STRIP) --strip-unneeded $(MOD_NAME).ko

install:
	cp $(MOD_NAME).ko $(INSTALL_MOD_PATH)

clean:
	rm -rf *.o .*.cmd *.ko *.a *.mod *.mod.c modules.order Module.symvers .tmp_versions modules.builtin
endif
