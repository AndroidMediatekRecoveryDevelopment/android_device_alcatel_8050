# Release name
PRODUCT_RELEASE_NAME := 8050

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
#$(call inherit-product, device/alcatel/8050/device_8050.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 960
TARGET_SCREEN_WIDTH := 540


## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := 8050
PRODUCT_NAME := full_8050
PRODUCT_BRAND := alcatel
PRODUCT_MODEL := 8050
PRODUCT_MANUFACTURER := alcatel
