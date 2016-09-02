$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
#$(call inherit-product, device/common/gps/gps_us_supl.mk) useless for building recovery only

#$(call inherit-product-if-exists, vendor/alcatel/8050/8050-vendor.mk) useless for building recovery only

#DEVICE_PACKAGE_OVERLAYS += device/alcatel/8050/overlay useless for building recovery only

LOCAL_PATH := device/alcatel/8050

-include $(LOCAL_PATH)/cm.mk

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

#$(call inherit-product, build/target/product/full.mk) useless and cause a build error

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_8050
PRODUCT_DEVICE := 8050
