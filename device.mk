#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit virtual_ab_ota product
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Project ID Quota
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)


# Dalvik VM Configuration
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Boot control HAL
PRODUCT_PACKAGES += \
            android.hardware.boot@1.2-impl \
	    android.hardware.boot@1.2-impl.recovery \
	    android.hardware.boot@1.2-service
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

# Health
PRODUCT_PACKAGES += \
        android.hardware.health@2.1-impl \
	android.hardware.health@2.1-impl.recovery \
	android.hardware.health@2.1-service

# Keymaster
PRODUCT_PACKAGES += \
		android.hardware.keymaster@4.0.vendor \
		libkeymaster4support.vendor \
	    	libkeymaster4.vendor \
	        libpuresoftkeymasterdevice.vendor \
		libsoft_attestation_cert.vendor

# Gatekeeper
PRODUCT_PACKAGES += \
	     android.hardware.gatekeeper@1.0-impl \
	     android.hardware.gatekeeper@1.0-service


# GNSS
PRODUCT_PACKAGES += \
		        android.hardware.gnss.measurement_corrections@1.1.vendor \
			android.hardware.gnss.visibility_control@1.0.vendor \
			android.hardware.gnss-V1-ndk.vendor \
			android.hardware.gnss@2.1.vendor

PRODUCT_PACKAGES += \
		        libcurl.vendor \
			libexpat.vendor
# Display
PRODUCT_PACKAGES += \
		        android.hardware.graphics.allocator@4.0.vendor \
			android.hardware.graphics.composer@2.3-service \
			android.hardware.memtrack-service.mediatek-mali
PRODUCT_PACKAGES += \
		        libdrm.vendor \
			libutils-v32
# DRM
PRODUCT_PACKAGES += \
	     android.hardware.drm-service.clearkey

PRODUCT_PACKAGES += \
		        android.hardware.drm@1.4.vendor

PRODUCT_PACKAGES += \
		        libdrmclearkeyplugin \
			libmockdrmcryptoplugin
# Neural Networks
PRODUCT_PACKAGES += \
		        android.hardware.neuralnetworks@1.3.vendor \
			 libtextclassifier_hash.vendor
# HIDL
PRODUCT_PACKAGES += \
		  libhidltransport \
		  libhidltransport.vendor \
		  libhwbinder \
		  libhwbinder.vendor \
		  android.hidl.allocator@1.0.vendor

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.consumerir.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.ese.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.uicc.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.sensor.dynamic.head_tracker.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.dynamic.head_tracker.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-1.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml \
    frameworks/native/data/etc/android.hardware.wifi.aware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.aware.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.rtt.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.rtt.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.device_id_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_id_attestation.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.opengles.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml

# Power
PRODUCT_PACKAGES += \
		        android.hardware.power-service-mediatek \
			android.hardware.power@1.3.vendor

PRODUCT_PACKAGES += \
		    vendor.mediatek.hardware.mtkpower@1.0.vendor \
		    vendor.mediatek.hardware.mtkpower@1.1.vendor \
		    vendor.mediatek.hardware.mtkpower@1.2.vendor

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

# Secure Element
PRODUCT_PACKAGES += \
	     android.hardware.secure_element@1.2.vendor


# Thermal
 PRODUCT_PACKAGES += \
		     android.hardware.thermal@1.0-impl \
		     android.hardware.thermal@2.0.vendor


# Sensors
PRODUCT_PACKAGES += \
	     android.hardware.sensors@2.1.vendor:64 \
	     android.hardware.sensors@2.1-service.chopin-multihal

PRODUCT_PACKAGES += \
		  libsensorndkbridge

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 30

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/mediatek \
    hardware/xiaomi

# Kernel Build Options
VENDOR_KERNEL_MODULES := no

# Inherit the proprietary files
$(call inherit-product, vendor/xiaomi/chopin/chopin-vendor.mk)
