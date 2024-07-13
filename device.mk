#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit virtual_ab_ota product
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Project ID Quota
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Boot control HAL
PRODUCT_PACKAGES += \
    com.android.hardware.boot \
    android.hardware.boot-service.default_recovery

# A/B
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *


# Rootdir
PRODUCT_PACKAGES += \
	 fstab.mt6893 \
	 fstab.mt6893.ramdisk \

PRODUCT_PACKAGES += \
	init.connectivity.rc \
	init.mi_thermald.rc \
	init.modem.rc \
	init.mt6893.rc \
	init.mt6893.usb.rc \
	init.project.rc \
	init.sensor_2_0.rc \
        ueventd.mt6893.rc   


PRODUCT_PACKAGES += \
    init.recovery.mt6893.rc

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 30

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/mediatek

# Kernel Build Options
BUILD_SOURCE_KERNEL=no
PREBUILT_DTB=no

# Inherit the proprietary files
$(call inherit-product, vendor/xiaomi/chopin/chopin-vendor.mk)
