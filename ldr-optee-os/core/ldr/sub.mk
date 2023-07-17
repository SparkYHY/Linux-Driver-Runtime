global-incdirs-y += include

# srcs-y += clist.c
# srcs-y += cobject.c
srcs-y += ldr.c
srcs-y += module.c
srcs-y += driver_registration.c

srcs-y += ldr_callback.c
srcs-y += ldr_callback_asm.S

srcs-y += sysfs.c
srcs-y += thermal.c
srcs-y += regmap.c
srcs-y += cdev.c

srcs-y += state_var.c

srcs-y += ldr_dac.c
srcs-y += ldr_dac_asm.S
srcs-y += ldr_gate.c
srcs-y += ldr_gate_asm.S

ifeq ($(CFG_LDR_DEBUG),y)
subdirs-y += dtc
# subdirs-y += samples
endif