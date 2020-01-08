# Hacks
WITHOUT_CHECK_API := true

USE_SQUASHFS := 0

# Main
DEVICE_PATH := device/asus/X00D

BOARD_VENDOR := asus-qcom

WITH_LINEAGE_CHARGER := false

TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

BOARD_HAS_NO_SELECT_BUTTON := true

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := msm8937

# Platform
TARGET_BOARD_PLATFORM := msm8937
TARGET_BOARD_PLATFORM_GPU := qcom-adreno505
TARGET_BOARD_SUFFIX := _64

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_CORTEX_A53 := true
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

TARGET_USES_64_BIT_BINDER := true

# Kernel

TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64

BOARD_KERNEL_CMDLINE := \
    androidboot.bootdevice=7824900.sdhci \
    androidboot.console=ttyHSL0 \
    androidboot.hardware=qcom \
    console=ttyHSL0,115200,n8 \
    earlycon=msm_hsl_uart,0x78B0000 \
    ehci-hcd.park=3 \
    lpm_levels.sleep_disabled=1 \
    msm_rtb.filter=0x237 \
    user_debug=30 \
    vmalloc=400M \
    androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x80008000
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_PAGESIZE := 2048

KERNEL_TOOLCHAIN := $(PWD)/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin
KERNEL_TOOLCHAIN_PREFIX := aarch64-linux-android-

TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-

# CROSS_COMPILE := ~/lineageos15/prebuilts/gcc/linux-x86/arm/arm-eabi-4.8/bin/arm-eabi-

TARGET_KERNEL_SOURCE := kernel/asus/msm8937
TARGET_KERNEL_CONFIG := msm8937-perf_defconfig

BOARD_KERNEL_SEPARATED_DT := true
TARGET_CUSTOM_DTBTOOL := dtbToolCM
BOARD_DTBTOOL_ARGS := --force-v3

BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000 --tags_offset 0x00000100
BOARD_KERNEL_LZ4C_DT := true

BOARD_KERNEL_IMAGE_NAME := Image.gz


#TARGET_PREBUILT_KERNEL := device/asus/X00D/kernel

TARGET_LDPRELOAD := libNimsWrap.so

#Qualcomm
#BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QC_TIME_SERVICES := true
TARGET_USE_SDCLANG := true

# Crypto
TW_INCLUDE_CRYPTO := true
TARGET_HW_DISK_ENCRYPTION := true
TARGET_CRYPTFS_HW_PATH := vendor/qcom/opensource/cryptfs_hw

# Recovery
#RECOVERY_VARIANT := twrp
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Partitions
BOARD_SUPPRESS_SECURE_ERASE := true

BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432        #    32768 * 1024 mmcblk0p58
BOARD_CACHEIMAGE_PARTITION_SIZE := 134217728      #   131072 * 1024 mmcblk0p65
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432    #    32768 * 1024 mmcblk0p59
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 4026531840    #  3932160 * 1024 mmcblk0p66
BOARD_USERDATAIMAGE_PARTITION_SIZE := 57583582208 # 56233967 * 1024 mmcblk0p67

# Keystore
TARGET_PROVIDES_KEYMASTER := true
TARGET_KEYMASTER_WAIT_FOR_QSEE := true

# TWRP-Specific
TW_THEME := portrait_hdpi
TW_NO_EXFAT_FUSE := true
# don't have enough space
#TW_EXTRA_LANGUAGES := true
RECOVERY_SDCARD_ON_DATA := true
#TW_TARGET_USES_QCOM_BSP := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_EXCLUDE_SUPERSU := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_NO_SCREEN_BLANK := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true

# original path was /sys/devices/soc/1a00000.qcom,mdss_mdp/1a00000.qcom,mdss_mdp:qcom,mdss_fb_primary/leds/lcd-backlight/brightness
TW_BRIGHTNESS_PATH := "/sys/devices/soc/1a00000.qcom\x2mdss_mdp/1a00000.qcom\x2mdss_mdp:qcom\x2mdss_fb_primary/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255

TARGET_RECOVERY_DEVICE_MODULES := \
    libbinder \
    libgui \
    libui \
    qseecomd

TW_RECOVERY_ADDITIONAL_RELINK_FILES := \
    $(OUT_DIR)/system/lib64/libbinder.so \
    $(OUT_DIR)/system/lib64/libgui.so \
    $(OUT_DIR)/system/lib64/libui.so \
    $(OUT_DIR)/system/bin/qseecomd

TARGET_UNIFIED_DEVICE := true
TARGET_SYSTEM_PROP := device/asus/X00D/system.prop



TARGET_POWERHAL_VARIANT := qcom

BOARD_HAS_QCOM_WLAN := true
BOARD_HAS_QCOM_WLAN_SDK := true
