################################################################################
# Android optee-client and optee-supplicant makefile                                                #
################################################################################
LOCAL_PATH := $(call my-dir)

MAJOR_VERSION := $(shell echo $(PLATFORM_VERSION) | cut -d "." -f1)
ANDROID_VERSION_GE_O := $(shell if [ $(MAJOR_VERSION) -ge 8 ];then echo "true";fi)

# set CFG_TEE_CLIENT_LOAD_PATH before include config.mk
ifeq ($(ANDROID_VERSION_GE_O), true)
CFG_TEE_CLIENT_LOAD_PATH ?= /vendor/lib
CFG_TEE_FS_PARENT_PATH ?= /data/vendor
else
CFG_TEE_CLIENT_LOAD_PATH ?= /system/lib
CFG_TEE_FS_PARENT_PATH ?= /data
endif

################################################################################
# Include optee-client common config and flags                                 #
################################################################################
include $(LOCAL_PATH)/config.mk
include $(LOCAL_PATH)/android_flags.mk

optee_CFLAGS = $(CFLAGS)

################################################################################
# Build libteec.so - TEE (Trusted Execution Environment) shared library        #
################################################################################
include $(CLEAR_VARS)
LOCAL_CFLAGS += $(optee_CFLAGS)

ifneq ($(CFG_TEE_CLIENT_LOG_FILE),)
LOCAL_CFLAGS += -DTEEC_LOG_FILE=$(CFG_TEE_CLIENT_LOG_FILE)
endif

LOCAL_CFLAGS += -DDEBUGLEVEL_$(CFG_TEE_CLIENT_LOG_LEVEL)
LOCAL_CFLAGS += -DBINARY_PREFIX=\"TEEC\"

LOCAL_SRC_FILES := libteec/src/tee_client_api.c\
                   libteec/src/teec_trace.c
ifeq ($(CFG_TEE_BENCHMARK),y)
LOCAL_CFLAGS += -DCFG_TEE_BENCHMARK
LOCAL_SRC_FILES += teec_benchmark.c
endif

LOCAL_C_INCLUDES := $(LOCAL_PATH)/public \
                    $(LOCAL_PATH)/libteec/include \

LOCAL_PRELINK_MODULE := false
LOCAL_MODULE := libteec
LOCAL_MODULE_TAGS := optional

ifeq ($(ANDROID_VERSION_GE_O), true)
LOCAL_VENDOR_MODULE := true
endif
LOCAL_PROPRIETARY_MODULE := true

LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/public

include $(BUILD_SHARED_LIBRARY)

# TEE Supplicant
include $(LOCAL_PATH)/tee-supplicant/tee_supplicant_android.mk
