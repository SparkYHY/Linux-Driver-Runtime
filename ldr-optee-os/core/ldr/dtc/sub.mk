global-incdirs-y += include

srcs-y += data.c
srcs-y += flattree.c
srcs-y += treesource.c
srcs-y += livetree.c
srcs-y += dtc.c

cflags-y += -Wno-cast-align
cflags-y += -Wno-sign-compare
cflags-y += -Wno-switch-default