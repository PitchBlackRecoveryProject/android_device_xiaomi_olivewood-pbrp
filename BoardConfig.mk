#
# Copyright (C) 2020 The Android Open Source Project
# Copyright (C) 2020 The TWRP Open Source Project
# Copyright (C) 2020 SebaUbuntu's TWRP device tree generator 
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#IMPORTANT VALUES I.G
#recovery >> /dev/block/mmcblk0p53 >> 131072
#system >> /dev/block/mmcblk0p59 >> 8388608
#vendor  >> /dev/block/mmcblk0p60 >> 2097152
#boot >> /dev/block/mmcblk0p52 >> 131072
#cache  >> /dev/block/mmcblk0p57 >> 786432
#dtbo >> /dev/block/mmcblk0p39 >> 16384
#persist >> /dev/block/mmcblk0p48 >> 65536
#userdata >> /dev/block/mmcblk0p62 >> 45866975
#ALL ABOVE VALUES ARE 32-BIT
#BELOW VALUES ARE 64-BIT
#recovery >> /dev/block/mmcblk0p53 >> 67108864
#system >> /dev/block/mmcblk0p59 >> 4294967296
#vendor  >> /dev/block/mmcblk0p60 >> 1073741824
#boot >> /dev/block/mmcblk0p52 >> 67108864
#cache  >> /dev/block/mmcblk0p57 >> 402653184
#dtbo >> /dev/block/mmcblk0p39 >> 8388608
#persist >> /dev/block/mmcblk0p48 >> 33554432
#userdata >> /dev/block/mmcblk0p62 >> 23483891200


DEVICE_PATH := device/xiaomi/olivewood

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := sdm439
TARGET_BOARD_PLATFORM := sdm439 

# Architecture
#TARGET_ARCH := arm
#TARGET_ARCH_VARIANT := armv7-a-neon
#TARGET_CPU_ABI := armeabi-v7a
#TARGET_CPU_ABI2 := armeabi
#TARGET_CPU_VARIANT := generic

TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53
TARGET_USES_64_BIT_BINDER := true

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200,n8 androidboot.console=ttyMSM0 androidboot.hardware=qcom user_debug=30 msm_rtb.filter=0x237 ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci lpm_levels.sleep_disabled=1 earlycon=msm_hsl_uart,0x78B0000 vmalloc=300M androidboot.usbconfigfs=true loop.max_part=7
BOARD_KERNEL_CMDLINE += androidboot.avb_version=1.0 androidboot.vbmeta.avb_version=1.0
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_HEADER_ARCH := arm
#TARGET_KERNEL_SOURCE := kernel/xiaomi/olivewood
#TARGET_KERNEL_CONFIG := olivewood_defconfig
BOARD_BOOTIMG_HEADER_VERSION := 1
BOARD_KERNEL_IMAGE_NAME := zImage-dtb
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/kernel
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
#BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)

# Platform
# Fix this
TARGET_BOARD_PLATFORM := msm8937
TARGET_BOARD_PLATFORM_GPU := qcom-adreno505

# Assert
TARGET_OTA_ASSERT_DEVICE := olivewood

# Partitions
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864 # This is the maximum known partition size, but it can be higher, so we just omit it
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 4294967296
BOARD_VENDORIMAGE_PARTITION_SIZE := 1073741824
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_CACHEIMAGE_PARTITION_SIZE := 402653184
BOARD_DTBOIMG_PARTITION_SIZE := 8388608
BOARD_METADATAIMAGE_PARTITION_SIZE := 65536
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_USERDATAIMAGE_PARTITION_SIZE := 23483891200 
#change this to 1971322880. if userdata fuckedup
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4

# Workaround for error copying vendor files to recovery ramdisk
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0
PLATFORM_SDK_VERSION := 29

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := false
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_Y_OFFSET := 57
TW_H_OFFSET := -57
TW_USE_TOOLBOX := true
TW_EXCLUDE_TWRPAPP := true
TW_NO_EXFAT := false
TW_NO_EXFAT_FUSE := false
TW_HAS_EDL_MODE := true
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 845
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
BOARD_USES_QCOM_HARDWARE := true
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TARGET_USES_MKE2FS := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_NO_SCREEN_BLANK := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_NTFS_3G := true
TW_NO_BATT_PERCENT := true
TWRP_EVENT_LOGGING := true
TW_NO_SCREEN_TIMEOUT  := true
TW_HAS_USB_STORAGE := true
TW_NO_USB_STORAGE := false

# AVB
BOARD_AVB_ENABLE := true
BOARD_BUILD_DISABLED_VBMETAIMAGE := false

#Branding
TW_DEVICE_VERSION := Aghora7

# Crypto
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_FBE := true

# Debug
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

#SHRP
#BUILD_SHRP_REC := true
ifeq ($(strip $(BUILD_SHRP_REC)),)
SHRP_PATH := $(DEVICE_PATH)
SHRP_MAINTAINER := Aghora7
SHRP_DEVICE_CODE := olivewood
SHRP_FLASH_MAX_BRIGHTNESS := 845
SHRP_EDL_MODE := 1
SHRP_EXTERNAL := /external_sd
SHRP_INTERNAL := /sdcard
SHRP_OTG := /usb_otg
SHRP_REC := /dev/block/bootdevice/by-name/recovery
SHRP_FLASH := 0
SHRP_REC_TYPE := Treble
SHRP_DEVICE_TYPE := A_Only
endif

#PBRP
#BUILD_PBRP_REC := true
ifeq ($(strip $(BUILD_PBRP_REC)),)
# Highly doubt if these flags exist
TW_USE_QCOM_HAPTICS_VIBRATOR := true
TW_USE_LEDS_HAPTICS := true
endif

#OFRP
#BUILD_OFRP_REC := true
ifeq ($(strip $(BUILD_ORP_REC)),)
TARGET_DEVICE_ALT := "olivewood"
FOX_REPLACE_BUSYBOX_PS := 1
FOX_REPLACE_TOOLBOX_GETPROP := 1
FOX_USE_TAR_BINARY := 1
FOX_USE_ZIP_BINARY := 1
FOX_USE_NANO_EDITOR := 1
OF_USE_MAGISKBOOT := 1
OF_PATCH_AVB20 := 1
OF_DISABLE_MIUI_SPECIFIC_FEATURES := 1
OF_NO_TREBLE_COMPATIBILITY_CHECK := 1
OF_SCREEN_H := 2340
OF_STATUS_H := 100
OF_STATUS_INDENT_LEFT := 48
OF_STATUS_INDENT_RIGHT := 48
OF_CLOCK_POS := 1
OF_ALLOW_DISABLE_NAVBAR := 0
FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER := 1
OF_SUPPORT_OZIP_DECRYPTION := 1
endif

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab

# NOTE - Dont use '-' or blank spaces in flag values , otherwise it will create build errors or other bugs in recovery (Excluding SHRP_PATH,SHRP_REC). 
# Path of your SHRP Tree
SHRP_PATH := device/xiaomi/olivewood
# Maintainer name *
SHRP_MAINTAINER := TechyMinati
# Device codename *
SHRP_DEVICE_CODE := OliveWood
# Recovery Type (It can be treble,normal,SAR) [Only for About Section] *
SHRP_REC_TYPE := Treble
# Recovery Type (It can be A/B or A_only) [Only for About Section] *
SHRP_DEVICE_TYPE := A_Only
# Notch
SHRP_NOTCH := true
# EDL
SHRP_EDL_MODE := 1
SHRP_EXTERNAL := /storage
SHRP_INTERNAL := /sdcard1
SHRP_OTG := /usb-otg
SHRP_FLASH := 1
# Path
SHRP_REC := /dev/block/bootdevice/by-name/recovery
