LOCAL_PATH := $(call my-dir)
COMMON_LUNCH_CHOICES := twrp_nice-eng

ifeq ($(TARGET_DEVICE),nice)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
