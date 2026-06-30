#
# Copyright (C) 2026 The Android Open Source Project
# Device configuration for Motorola mt6878 (nice)
#

DEVICE_PATH := device/motorola/nice

# API Levels & VNDK Configuration
PRODUCT_SHIPPING_API_LEVEL := 35
PRODUCT_BOARD_API_LEVEL := 34
PRODUCT_TARGET_VNDK_VERSION := 34

# A/B Updates & Virtual A/B Configurations
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    init_boot \
    vendor_boot \
    dtbo \
    product \
    system \
    system_ext \
    vendor \
    vbmeta \
    vbmeta_system

# Enable Virtual A/B with compression and io_uring
PRODUCT_VIRTUAL_AB_ENABLED := true
PRODUCT_VIRTUAL_AB_COMPRESSION_METHOD := zstd
PRODUCT_PACKAGES += \
    snapuserd.rc

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlay

#===============================================================================
# PRODUCT_PACKAGES

# Boot Control HAL (Necessário para recuperação e atualizações A/B)
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-service \
    android.hardware.boot@1.2-mtkimpl \
    android.hardware.boot@1.2-mtkimpl.recovery

# Graphics & SurfaceFlinger Settings
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_3.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_3.xml

# Renderscript & Mapper (Mapeados do manifest.xml)
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl \
    android.hardware.graphics.mapper@4.0-impl

# Audio HAL (Casado com o HIDL do manifest)
PRODUCT_PACKAGES += \
    android.hardware.audio@7.1-impl \
    android.hardware.audio.effect@7.0-impl \
    vendor.mediatek.hardware.audio-service

# Soundtrigger & Dolby/CrystalTalk Support
PRODUCT_PACKAGES += \
    android.hardware.soundtrigger3-impl

# Telephony / Radio (Mapeado das propriedades dsds e AIDL do manifest)
PRODUCT_PACKAGES += \
    android.hardware.radio.config-service \
    android.hardware.radio.data-service \
    android.hardware.radio.messaging-service \
    android.hardware.radio.modem-service \
    android.hardware.radio.network-service \
    android.hardware.radio.sim-service \
    android.hardware.radio.voice-service \
    vendor.mediatek.hardware.mtkradioex.data-service

# Secure Element & Trustonic TEE (Declarados no manifest)
PRODUCT_PACKAGES += \
    android.hardware.secure_element-service \
    vendor.trustonic.tee@1.1-service \
    vendor.trustonic.tee.tui@1.0-service

# MediaTek Picture Quality (PQ AIDL v7 do manifest)
PRODUCT_PACKAGES += \
    vendor.mediatek.hardware.pq_aidl-service \
    vendor.mediatek.hardware.composer_ext-service

# Storage/F2FS Tools (Baseado na criptografia inline e projid do fstab)
PRODUCT_PACKAGES += \
    fsck.f2fs \
    make_f2fs \
    f2fs_io

# USB Configuration
PRODUCT_PACKAGES += \
    android.hardware.usb-service

================================================================================
#
================================================================================
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/etc/fstab.mt6878:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.mt6878 \
    $(DEVICE_PATH)/rootdir/etc/fstab.mt6878:$(TARGET_COPY_OUT_RAMDISK)/fstab.mt6878

PRODUCT_COMPATIBILITY_MATRIX_FILE_LIST += $(DEVICE_PATH)/manifest.xml
