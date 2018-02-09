#
# Copyright (C) 2016 The CyanogenMod Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.manual_postprocessing.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.manual_postprocessing.xml \
    frameworks/native/data/etc/android.hardware.camera.manual_sensor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.manual_sensor.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.print.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.print.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml

# Screen density
PRODUCT_AAPT_PREF_CONFIG := xxhdpi
PRODUCT_AAPT_CONFIG := normal

# Device was launched with M
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.first_api_level=23

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

$(call inherit-product, frameworks/native/build/phone-xxhdpi-3072-dalvik-heap.mk)
$(call inherit-product, frameworks/native/build/phone-xxhdpi-3072-hwui-memory.mk)

PRODUCT_PACKAGES += libGLES_android
PRODUCT_PACKAGES += SSRestartDetector

#Telephony
PRODUCT_PACKAGES += \
    telephony-ext
    
PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-service \
    android.hardware.bluetooth@1.0-service-qti \
    android.hardware.drm@1.0-service \
    android.hardware.drm@1.0-service.widevine \
    android.hardware.light@2.0-service \
    android.hardware.power@1.0-service \
    android.hardware.sensors@1.0-service 

# Audio
PRODUCT_PACKAGES += \
    audiod \
    audio.a2dp.default \
    audio.primary.msm8953 \
    audio.primary.default \
    audio.r_submix.default \
    audio.usb.default \
    libbthost_if \
    libaudio-resampler \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libqcomvoiceprocessingdescriptors \
    libqcompostprocbundle \
    libvolumelistener \
    tinymix 
    
PRODUCT_PACKAGES += \
    android.hardware.audio@2.0 \
    android.hardware.audio@2.0-impl \
    android.hardware.audio.effect@2.0-impl \
    android.hardware.broadcastradio@1.0-impl \
    android.hardware.soundtrigger@2.0-impl \
    android.hardware.audio.common@2.0-util \
    android.hardware.audio.common@2.0 \
    android.hardware.audio.effect@2.0

PRODUCT_COPY_FILES +=  \
    $(LOCAL_PATH)/configs/audio/mixer_paths_qrd_skuh.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_qrd_skuh.xml \
    $(LOCAL_PATH)/configs/audio/audio_effects.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.conf \
    $(LOCAL_PATH)/configs/audio/audio_output_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_output_policy.conf \
    $(LOCAL_PATH)/configs/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/configs/audio/audio_platform_info_extcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_extcodec.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/audio_tuning_mixer.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer.txt \
    $(LOCAL_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_mtp.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_mtp_EU.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_mtp_EU.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_qrd_sku3.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_qrd_sku3.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_qrd_skuhf.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_qrd_skuhf.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_qrd_skui.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_qrd_skui.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_qrd_skum.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_qrd_skum.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_qrd_skun.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_qrd_skun.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_skuk.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_skuk.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_wcd9306.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_wcd9306.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_wcd9326.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_wcd9326.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_wcd9330.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_wcd9330.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_wcd9335.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_wcd9335.xml 

# Voice recognition
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths.xml \
    $(LOCAL_PATH)/configs/audio/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_platform_info.xml \
    $(LOCAL_PATH)/configs/audio/sound_trigger_mixer_paths_wcd9306.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_wcd9306.xml \
    $(LOCAL_PATH)/configs/audio/sound_trigger_mixer_paths_wcd9330.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_wcd9330.xml \
    $(LOCAL_PATH)/configs/audio/sound_trigger_mixer_paths_wcd9335.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_wcd9335.xml

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

# FM
PRODUCT_PACKAGES += \
    FM2 \
    libfmjni \
    libqcomfm_jni \
    libfm-hci \
    fm_helium \
    qcom.fmradio \
    fmhal_service
    
# Bluetooth
PRODUCT_PACKAGES += \
    libbt-vendor \
    android.hardware.bluetooth@1.0 \
    android.hardware.bluetooth@1.0-impl-qti

# Camera
PRODUCT_PACKAGES += \
    camera.msm8953 \
    bspcapability \
    Snap \
    libbson \
    libshim_camera
    
PRODUCT_PACKAGES += \
    camera.device@1.0-impl \
    camera.device@3.2-impl \
    android.hardware.camera.provider@2.4-impl \
    vendor.qti.hardware.camera.device@1.0 \
    vendor.qti.hardware.camera.device@1.0_vendor

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/camera/Invensense/VStab_352x288_30_1.conf:$(TARGET_COPY_OUT_VENDOR)/etc/camera/Invensense/VStab_352x288_30_1.conf \
    $(LOCAL_PATH)/configs/camera/Invensense/VStab_640x480_30_0.conf:$(TARGET_COPY_OUT_VENDOR)/etc/camera/Invensense/VStab_640x480_30_0.conf \
    $(LOCAL_PATH)/configs/camera/Invensense/VStab_720x480_30_1.conf:$(TARGET_COPY_OUT_VENDOR)/etc/camera/Invensense/VStab_720x480_30_1.conf \
    $(LOCAL_PATH)/configs/camera/Invensense/VStab_1920x1080_30_0.conf:$(TARGET_COPY_OUT_VENDOR)/etc/camera/Invensense/VStab_1920x1080_30_0.conf \
    $(LOCAL_PATH)/configs/camera/Invensense/VStab_1280x720_30_0.conf:$(TARGET_COPY_OUT_VENDOR)/etc/camera/Invensense/VStab_1280x720_30_0.conf \
    $(LOCAL_PATH)/configs/camera/Invensense/VStab_176x144_30_1.conf:$(TARGET_COPY_OUT_VENDOR)/etc/camera/Invensense/VStab_176x144_30_1.conf \
    $(LOCAL_PATH)/configs/camera/Invensense/VStab_352x288_30_0.conf:$(TARGET_COPY_OUT_VENDOR)/etc/camera/Invensense/VStab_352x288_30_0.conf \
    $(LOCAL_PATH)/configs/camera/Invensense/VStab_640x480_30_1.conf:$(TARGET_COPY_OUT_VENDOR)/etc/camera/Invensense/VStab_640x480_30_1.conf \
    $(LOCAL_PATH)/configs/camera/Invensense/VStab_1920x1080_30_1.conf:$(TARGET_COPY_OUT_VENDOR)/etc/camera/Invensense/VStab_1920x1080_30_1.conf \
    $(LOCAL_PATH)/configs/camera/Invensense/VStab_1280x720_30_1.conf:$(TARGET_COPY_OUT_VENDOR)/etc/camera/Invensense/VStab_1280x720_30_1.conf \
    $(LOCAL_PATH)/configs/camera/Invensense/VStab_320x240_30_1.conf:$(TARGET_COPY_OUT_VENDOR)/etc/camera/Invensense/VStab_320x240_30_1.conf \
    $(LOCAL_PATH)/configs/camera/Invensense/VStab_320x240_30_0.conf:$(TARGET_COPY_OUT_VENDOR)/etc/camera/Invensense/VStab_320x240_30_0.conf \
    $(LOCAL_PATH)/configs/camera/Invensense/VStab_176x144_30_0.conf:$(TARGET_COPY_OUT_VENDOR)/etc/camera/Invensense/VStab_176x144_30_0.conf \
    $(LOCAL_PATH)/configs/camera/Invensense/VStab_720x480_30_0.conf:$(TARGET_COPY_OUT_VENDOR)/etc/camera/Invensense/VStab_720x480_30_0.conf \
    $(LOCAL_PATH)/configs/camera/imx362_chromatix_bear.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx362_chromatix_bear.xml \
    $(LOCAL_PATH)/configs/camera/camera_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/camera_config.xml \
    $(LOCAL_PATH)/configs/camera/csidtg_camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/csidtg_camera.xml \
    $(LOCAL_PATH)/configs/camera/csidtg_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/csidtg_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/imx214_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx214_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/imx230_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx230_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/imx230_qc2002_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx230_qc2002_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/imx230_qc2002_with_gyro_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx230_qc2002_with_gyro_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/imx258_bear_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx258_bear_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/imx258_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx258_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/imx258_mono_bear_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx258_mono_bear_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/imx258_mono_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx258_mono_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/imx298_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx298_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/imx298_gt24c64_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx298_gt24c64_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/imx318_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx318_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/imx362_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx362_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/imx378_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx378_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/ov13850_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov13850_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/ov13850_q13v06k_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov13850_q13v06k_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/ov2281_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov2281_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/ov2680_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov2680_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/ov4688_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov4688_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/ov5670_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov5670_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/ov5670_f5670bq_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov5670_f5670bq_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/ov5695_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov5695_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/ov7251_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov7251_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/ov8856_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov8856_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/ov8858_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov8858_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/ov8865_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov8865_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/s5k2l7_8953_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k2l7_8953_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/s5k2l7_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k2l7_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/s5k3l8_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k3l8_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/s5k3l8_f3l8yam_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k3l8_f3l8yam_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/s5k3l8_mono_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k3l8_mono_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/s5k3m2xm_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k3m2xm_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/s5k3m2xm_chromatix_bear.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k3m2xm_chromatix_bear.xml \
    $(LOCAL_PATH)/configs/camera/s5k3m2xx_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k3m2xx_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/s5k3p3sm_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k3p3sm_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/s5k3p8sp_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k3p8sp_chromatix.xml 

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/bspcapability.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bspcapability.xml \

# Configstore
PRODUCT_PACKAGES += \
    android.hardware.configstore@1.0-service \
    android.hardware.configstore-utils \
    android.hardware.configstore@1.0

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl

    
# Display
PRODUCT_PACKAGES += \
    gralloc.msm8953 \
    gralloc.default \
    copybit.msm8953 \
    hwcomposer.msm8953 \
    memtrack.msm8953 \
    liboverlay \
    libjni_livedisplay \
    libtinyxml \
    libgenlock \
    libdisplayconfig
    
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    vendor.display.color@1.0-service \
    vendor.display.color@1.0-impl

# Connectivity Engine support
PRODUCT_PACKAGES += \
    libcnefeatureconfig

# Display Calibration
PRODUCT_PACKAGES += \
    libjni_livedisplay

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1 \
    android.hardware.biometrics.fingerprint@2.1-service

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fpservice.sh:$(TARGET_COPY_OUT_VENDOR)/etc/fpservice.sh

# Gatekeeper HAL
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.gatekeeper@1.0-service
    
# GPS
PRODUCT_PACKAGES += \
    libgnss \
    libgps.utils \
    gps.default \
    liblocation_api \
    android.hardware.gnss@1.0 \
    android.hardware.gnss@1.0-impl-qti \
    libloc_api-rpc-qc
    
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gps/etc/gps.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps.conf \
    $(LOCAL_PATH)/gps/etc/flp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/flp.conf \
    $(LOCAL_PATH)/gps/etc/izat.conf:$(TARGET_COPY_OUT_VENDOR)/etc/izat.conf \
    $(LOCAL_PATH)/gps/etc/lowi.conf:$(TARGET_COPY_OUT_VENDOR)/etc/lowi.conf \
    $(LOCAL_PATH)/gps/etc/sap.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sap.conf \
    $(LOCAL_PATH)/gps/etc/xtwifi.conf:$(TARGET_COPY_OUT_VENDOR)/etc/xtwifi.conf
    
# Health HAL
PRODUCT_PACKAGES += \
    android.hardware.health@1.0 \
    android.hardware.health@1.0-impl \
    android.hardware.health@1.0-service \
    android.hardware.health@1.0-convert
    
# Keymaster HAL
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service

# Ebtables
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes

# IRQ
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

# IRSC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config

# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/ASUS_TransKeyboard.kl:system/usr/keylayout/ASUS_TransKeyboard.kl \
    $(LOCAL_PATH)/configs/keylayout/focal-touchscreen.kl:system/usr/keylayout/focal-touchscreen.kl \
    $(LOCAL_PATH)/configs/keylayout/goodixfp.kl:system/usr/keylayout/goodixfp.kl \
#    $(LOCAL_PATH)/configs/keylayout/ft5x06_ts.kl:system/usr/keylayout/ft5x06_ts.kl \
#    $(LOCAL_PATH)/configs/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
#    $(LOCAL_PATH)/configs/keylayout/synaptics_dsx.kl:system/usr/keylayout/synaptics_dsx.kl \
#    $(LOCAL_PATH)/configs/keylayout/synaptics_dsxv26.kl:system/usr/keylayout/synaptics_dsxv26.kl \
#    $(LOCAL_PATH)/configs/keylayout/synaptics_rmi4_i2c.kl:system/usr/keylayout/synaptics_rmi4_i2c.kl

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/idc/focal-touchscreen.idc:system/usr/idc/focal-touchscreen.idc

# Lights
PRODUCT_PACKAGES += \
    lights.msm8953 
    
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-impl

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_8953.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_8953.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_8953_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_8953_v1.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_performance_8953.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_8953.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_performance_8953_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_8953_v1.xml \
    $(LOCAL_PATH)/configs/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/media/media_profiles_8953_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_8953_v1.xml \
    $(LOCAL_PATH)/configs/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
    $(LOCAL_PATH)/configs/media/media_profiles_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_vendor.xml \

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml

# OMX
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libextmedia_jni \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libOmxVidcCommon \
    libstagefrighthw \
    libmm-omxcore
    
PRODUCT_PACKAGES += \
    android.hardware.media@1.0 \
    android.hardware.media.omx@1.0 \
    android.hardware.media.omx@1.0-service
    
# Power
PRODUCT_PACKAGES += \
    power.msm8953 \
    power.default
    
PRODUCT_PACKAGES += \
    android.hardware.power@1.0-impl

# QMI
PRODUCT_PACKAGES += \
    libjson
    
# RenderScript HAL
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl \
    android.hardware.renderscript@1.0

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    ueventd.qcom.rc \
    init.asus.debugtool.rc \
    init.asus.rc \
    init.asus.thermald.rc \
    init.qcom.factory.rc \
    init.qcom.rc \
    init.target.rc \
    init.asus.usb.rc \
    sp


# RIL
PRODUCT_PACKAGES += \
    librmnetctl \
    libxml2 \
    libtar \
    libprotobuf-cpp-lite \
    android.hardware.radio@1.0 \
    android.hardware.radio.deprecated@1.0

# Seccomp policy
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/seccomp_policy/mediacodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    $(LOCAL_PATH)/seccomp_policy/mediaextractor.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0 \
    android.hardware.sensors@1.0-impl
    
# Whitelisted app
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/qti_whitelist.xml:etc/sysconfig/qti_whitelist.xml

# Wifi
PRODUCT_PACKAGES += \
    ipacm \
    ipacm-diag \
    IPACM_cfg.xml \
    libqsap_sdk \
    libQWiFiSoftApCfg \
    libwcnss_qmi \
    libwpa_client \
    libwifi-hal-qcom \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf \
    hs20-osu-client \
    libcld80211 \
    wificond \
    wifilogd
    
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    $(LOCAL_PATH)/configs/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/configs/wifi/WCNSS_qcom_wlan_nv.bin:$(TARGET_COPY_OUT_VENDOR)/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin \
    $(LOCAL_PATH)/configs/wifi/WCNSS_wlan_dictionary.dat:$(TARGET_COPY_OUT_VENDOR)/etc/firmware/wlan/prima/WCNSS_wlan_dictionary.dat

PRODUCT_PACKAGES += \
    libcurl \
    tcpdump \
    wcnss_service

# IMS
PRODUCT_PACKAGES += \
    libshim_ims

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal/thermal-engine.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine.conf
    
# USB HAL
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0 \
    android.hardware.usb@1.0-service

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl \
    android.hardware.vibrator@1.0-service \
    vibrator.default

# e2fsck
PRODUCT_PACKAGES += \
    e2fsck \
    resize2fs \
    tune2fs \
    blkid \
    mke2fs

# ANT+
#PRODUCT_PACKAGES += \
#    antradio_app \
#    AntHalService \
#    com.dsi.ant.antradio_library \
#    libantradio

#PRODUCT_COPY_FILES += \
#    external/ant-wireless/antradio-library/com.dsi.ant.antradio_library.xml:vendor/etc/permissions/com.dsi.ant.antradio_library.xml

# VNDK-SP:
PRODUCT_PACKAGES += \
    vndk-sp
    
# dataservice
PRODUCT_PACKAGES += \
    rmnetcli

# Netutils
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0 \
    android.system.net.netd@1.0 \
    libandroid_net
        
# Doze
PRODUCT_PACKAGES += \
   ZenfoneDoze
   
# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0-java \
    android.hidl.allocator@1.0-service \
    android.hidl.allocator@1.0.so
    
#Additional
PRODUCT_PACKAGES += \
android.hardware.tests.libhwbinder@1.0-impl \
android.hardware.thermal@1.0-service \
android.hardware.thermal@1.0-impl \


PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

$(call inherit-product, vendor/lineage/config/common_full_phone.mk)
