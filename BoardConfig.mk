LOCAL_PATH := device/alcatel/8050

USE_CAMERA_STUB := true

# inherit from the proprietary version
# -include vendor/alcatel/8050/BoardConfigVendor.mk useless for building recovery only

TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := 8050
TARGET_OTA_ASSERT_DEVICE := 8050_Base

# Platform
TARGET_BOARD_PLATFORM := mt6580

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT_CPU := cortex-a7
TARGET_CPU_VARIANT:= cortex-a7
TARGET_CPU_SMP := true

# ARGUMENTS
BUILD_NUMBER := $(shell date +%s)
BOARD_KERNEL_OFFSET := 0x00009600
BOARD_RAMDISK_OFFSET := 0x04000000
BOARD_TAGS_OFFSET := 0x0e000000
BOARD_KERNEL_CMDLINE := bootopt=64S3,32S1,32S1
BOARD_KERNEL_BASE := 0x96000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset $(BOARD_KERNEL_OFFSET) --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_TAGS_OFFSET)

# PARTITIONS
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := false
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false
BOARD_HAS_LARGE_FILESYSTEM := true

# USB OTG and External Sdcard
TARGET_USES_EXFAT := true
TARGET_USES_NTFS := true disabled to avoid ntfs error

# GRAPHICS
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := $(LOCAL_PATH)/egl.cfg

# RECOVERY
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"
#DEVICE_SCREEN_WIDTH := 540      these flags are present
#DEVICE_SCREEN_HEIGHT := 960     in cm.mk, too
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/mt_usb/musb-hdrc.0.auto/gadget/lun%d/file
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := /sys/class/leds/lcd-backlight/brightness
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery/recovery.fstab

#RECOVERY_VARIANT := carliv

# CARLIV
ifeq ($(TARGET_RECOVERY_VARIANT),carliv) #with this, all flags under ifeq are not included if you are building another recovery
VIBRATOR_TIMEOUT_FILE := /sys/devices/virtual/timed_output/vibrator/enable
DEVICE_RESOLUTION := 540x960
BOARD_INCLUDE_CRYPTO := true
BOARD_HAS_MTK_CPU := true
endif # ifeq ($(TARGET_RECOVERY_VARIANT),carliv)
