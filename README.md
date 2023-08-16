# LDR: Secure and Efficient Linux Driver Runtime for Embedded TEE Systems

Our paper has been accepted to appear in NDSS 2024.

Author List: 

 - Huaiyu Yan (Southeast University)
 - Zhen Ling (Southeast University)
 - Haobo Li (Southeast University)
 - Lan Luo (Southeast University)
 - Xinhui Shao (Southeast University)
 - Kai Dong (Southeast University)
 - Ping Jiang (Southeast University)
 - Ming Yang (Southeast University)
 - Junzhou Luo (Southeast University)
 - Xinwen Fu (University of Massachusetts Lowell)

This repository contains all source files to evaluate LDR, including

 - uboot
 - LDR Linux kernel
 - LDR OPTEE OS (including LDR PTA)
 - OPTEE client library
 - LDR Client Application (CA)
 - LDR NW & SW drivers

Building environment:

 - An Ubuntu 16.04 VM
 - Toolchain: you can choose two toolchains 1) Linaro toolchains, available [here](https://releases.linaro.org/components/toolchain/binaries/latest-7/arm-linux-gnueabihf/). or 2) ARM official toolchains shipped with Ubuntu. In this tutorial, we will use the ARM official toolchains.

### Uboot Building and Installation

Clone `uboot` into your working directory, and compile `uboot` using the following instructions.

    make ARCH=arm mx6qsabresd_defconfig  
    CROSS_COMPILE=arm-linux-gnueabihf- make ARCH=arm  

After a successful compilation, you can get `u-boot-dtb.imx`.
Now prepare an SD card, plug it into your SD card reader and connect the reader to your VM. Then, burn the compiled `uboot` image into the SD card using the following instructions.

    sudo dd if=u-boot-dtb.imx of=/dev/sdb bs=512 seek=2 conv=sync conv=notrunc

### LDR Linux Building

Clone `linux-imx` into your working directory, and compile `linux-imx` using the following instructions.
Note that the LDR Linux kernel has already been properly configured, so you can directly compile it.

    CROSS_COMPILE=arm-linux-gnueabihf- make ARCH=arm -j4

After a successful compilation, you can get `zImage` inside `arch/arm/boot/` and `imx6q-sabresd.dtb` inside `arch/arm/boot/dts/`. Now, copy these two image into your VM's `tftp` server directory.

Drivers related to image capturing are compiled as kernel modules and will reside in `drivers/media/platform/mxc/capture/` and copy all `*.ko` inside this folder into your file system.

### LDR OPTEE OS Building

Clone `optee-os-LDRv2.3` into your working directory, and compile `optee-os-LDRv2.3` using the following instructions.

    CROSS_COMPILE=arm-linux-gnueabihf- make CFLAGS="-w" PLATFORM=imx-mx6qsabresd ARCH=arm CFG_BUILT_IN_ARGS=y CFG_PAGEABLE_ADDR=0 CFG_NS_ENTRY_ADDR=0x12000000 CFG_DT=y CFG_PSCI_ARM32=y DEBUG=y CFG_TEE_CORE_LOG_LEVEL=4 CFG_BOOT_SYNC_CPU=n CFG_BOOT_SECONDARY_REQUEST=y CFG_NXPCRYPT=y CFG_CRYPTO_WITH_BLOB=y CFG_NXP_CAAM=y -j4

Then make a bootable `uboot` image, i.e. `uTEE`,

    mkimage -A arm -O linux -C none -a 0x13ffffe4 -e 0x14000000 -d out/arm-plat-imx/core/tee.bin uTee
Now, copy `uTEE` image into your VM's `tftp` server directory.

### OPTEE Client Building

Clone `imx-optee-client` into your working directory. You can compile it yourself.

```
make ARCH=arm
```

### LDR Client Application Building

Clone `ldr_ca` into your working directory, and compile `ldr_ca` using the following instructions. Please make sure you configure all paths right.

    export OPTEE_OS_PATH=your_optee_os_path
    export OPTEE_CLIENT_PATH=your_optee_client_path
    export FS_LIB_PATH=your_fs_lib_path
    export FS_USR_LIB_PATH=your_fs_usr_lib_path
    arm-linux-gnueabihf-gcc ./main.c -o ldr -I$OPTEE_OS_PATH/lib/libutee/include -I$OPTEE_CLIENT_PATH/out/export/include -L$FS_LIB_PATH/lib -lteec -L$FS_USR_LIB_PATH/usr/lib
After a successful compilation, you can get `ldr` and copy it into your filesystem.
