cflags-y += -Wno-sign-compare
cflags-y += -Wno-parentheses
cflags-remove-y += -Wcast-align

srcs-y += abs.c
srcs-y += bcmp.c
srcs-y += memchr.c
srcs-y += memcmp.c
srcs-y += memcpy.c
cflags-memcpy.c-y += -O2
srcs-y += memmove.c
srcs-y += memset.c
srcs-y += strchr.c
srcs-y += strcmp.c
srcs-y += strcpy.c
srcs-y += string.c
srcs-y += strlen.c
srcs-y += strncmp.c
srcs-y += strncpy.c
srcs-y += strnlen.c
srcs-y += strrchr.c
srcs-y += strstr.c
srcs-y += strtoul.c
