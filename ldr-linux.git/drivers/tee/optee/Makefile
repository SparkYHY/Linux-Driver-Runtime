# SPDX-License-Identifier: GPL-2.0
# CFLAGS_core.o := -DDEBUG
# CFLAGS_call.o := -DDEBUG
# CFLAGS_rpc.o := -DDEBUG
# CFLAGS_ldr.o := -DDEBUG
# CFLAGS_ldr_rpc.o := -DDEBUG
# CFLAGS_ldr_callback.o := -DDEBUG

obj-$(CONFIG_OPTEE) += optee.o
optee-objs += core.o
optee-objs += call.o
optee-objs += rpc.o
optee-objs += supp.o

optee-objs += ldr.o
optee-objs += ldr_rpc.o
optee-objs += ldr_redbench.o
optee-objs += ldr_callback.o