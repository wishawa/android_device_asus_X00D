#
# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
#$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
#$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_m.mk)

$(call inherit-product, device/asus/X00D/hwui-memory.mk)

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# PREBUILTS
PRODUCT_PACKAGES += \
    QtiTelephonyService

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
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-1.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.print.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.print.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/privapp-permissions-qti.xml:system/etc/permissions/privapp-permissions-qti.xml

# Screen density
PRODUCT_AAPT_PREF_CONFIG := xxhdpi
PRODUCT_AAPT_CONFIG := normal

# Device was launched with M
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.first_api_level=23

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080


# Dalvik heap
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heapgrowthlimit=288m \
    dalvik.vm.heapsize=768m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=512k \
    dalvik.vm.heapmaxfree=8m

PRODUCT_PACKAGES += libGLES_android
PRODUCT_PACKAGES += SSRestartDetector

# Additional native libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

#Telephony
PRODUCT_PACKAGES += \
    telephony-ext

# Audio
PRODUCT_PACKAGES += \
    audiod \
    audio.a2dp.default \
    audio.primary.msm8937 \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libqcomvoiceprocessingdescriptors \
    libqcompostprocbundle \
    libvolumelistener \
    tinymix

PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-impl \
    android.hardware.audio@2.0-service \
    android.hardware.audio@4.0 \
    android.hardware.audio@4.0-impl \
    android.hardware.audio.common@4.0 \
    android.hardware.audio.common@4.0-util \
    android.hardware.audio.effect@2.0-impl \
    android.hardware.audio.effect@4.0 \
    android.hardware.audio.effect@4.0-impl \
    android.hardware.broadcastradio@1.0-impl \
    android.hardware.soundtrigger@2.1-impl

PRODUCT_COPY_FILES +=  \
    $(LOCAL_PATH)/configs/audio/audio_tuning_mixer.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer.txt \
    $(LOCAL_PATH)/configs/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/configs/audio/audio_output_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_output_policy.conf \
    $(LOCAL_PATH)/configs/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/configs/audio/audio_platform_info_extcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_extcodec.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_mtp.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_qrd_sku1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_qrd_sku1.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_qrd_sku2_br.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_qrd_sku2_br.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_qrd_sku2_eu.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_qrd_sku2_eu.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_qrd_sku2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_qrd_sku2.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_qrd_skuhf.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_qrd_skuhf.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_qrd_skuh.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_qrd_skuh.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_qrd_skui.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_qrd_skui.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_qrd_skum.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_qrd_skum.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_qrd_skun.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_qrd_skun.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_skuk.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_skuk.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_wcd9306.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_wcd9306.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_wcd9326.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_wcd9326.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_wcd9330.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_wcd9330.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_wcd9335.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_wcd9335.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml



PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.media_vol_steps=25 \
    ro.config.vc_call_vol_steps=7

# Voice recognition
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths.xml \
    $(LOCAL_PATH)/configs/audio/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_platform_info.xml

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

# FM
PRODUCT_PACKAGES += \
    FMRadio \
    libfmjni

# Camera
PRODUCT_PACKAGES += \
    bspcapability \
    Snap \
    libbson

PRODUCT_PACKAGES += \
    camera.device@1.0-impl \
    camera.device@3.2-impl \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service \
    vendor.qti.hardware.camera.device@1.0 \
    vendor.qti.hardware.camera.device@1.0_vendor

PRODUCT_COPY_FILES += \
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
    $(LOCAL_PATH)/configs/camera/ov8856_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov8856_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/imx298_gt24c64_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx298_gt24c64_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/imx318_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx318_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/imx362_chromatix_bear.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx362_chromatix_bear.xml \
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
    $(LOCAL_PATH)/configs/camera/s5k3m2xm_chromatix_bear.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k3m2xm_chromatix_bear.xml \
    $(LOCAL_PATH)/configs/camera/s5k3m2xm_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k3m2xm_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/s5k3m2xx_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k3m2xx_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/s5k3p3_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k3p3_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/s5k3p3sm_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k3p3sm_chromatix.xml


PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/bspcapability.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bspcapability.xml \

# Configstore
PRODUCT_PACKAGES += \
    android.hardware.configstore@1.0-service \
    android.hardware.configstore-utils \
    android.hardware.configstore@1.0

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-service \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.1-service.clearkey

# Display
PRODUCT_PACKAGES += \
    gralloc.msm8937 \
    copybit.msm8937 \
    hwcomposer.msm8937 \
    memtrack.msm8937 \
    liboverlay \
    libtinyxml \
    libgenlock \
    libdisplayconfig \
    libqdMetaData.system

PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    vendor.display.config@1.0 \
    vendor.display.config@1.0_vendor

# Connectivity Engine support
PRODUCT_PACKAGES += \
    libcnefeatureconfig

# LiveDisplay
PRODUCT_PACKAGES += \
    vendor.lineage.livedisplay@2.0-service-sdm

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1 \
    android.hardware.biometrics.fingerprint@2.1-service

# Gatekeeper HAL
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.gatekeeper@1.0-service

# GPS
PRODUCT_PACKAGES += \
    libcurl \
    libgnss \
    libgnsspps \
    libsensorndkbridge \

PRODUCT_PACKAGES += \
    android.hardware.gnss@1.0-impl-qti \
    android.hardware.gnss@1.0-service-qti

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gps/etc/gps.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps.conf \
    $(LOCAL_PATH)/gps/etc/flp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/flp.conf \
    $(LOCAL_PATH)/gps/etc/izat.conf:$(TARGET_COPY_OUT_VENDOR)/etc/izat.conf \
    $(LOCAL_PATH)/gps/etc/lowi.conf:$(TARGET_COPY_OUT_VENDOR)/etc/lowi.conf \
    $(LOCAL_PATH)/gps/etc/sap.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sap.conf \
    $(LOCAL_PATH)/gps/etc/xtwifi.conf:$(TARGET_COPY_OUT_VENDOR)/etc/xtwifi.conf

# Health HAL
PRODUCT_PACKAGES += \
    android.hardware.health@2.0-impl \
    android.hardware.health@2.0-service

# Keymaster HAL
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service

# ContextHub HAL
PRODUCT_PACKAGES += \
    android.hardware.contexthub@1.0

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
    $(LOCAL_PATH)/configs/keylayout/ASUS_TransKeyboard.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/ASUS_TransKeyboard.kl \
    $(LOCAL_PATH)/configs/keylayout/fts_ts.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/fts_ts.kl \
    $(LOCAL_PATH)/configs/keylayout/goodix-ts.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/goodix-ts.kl

# Lights
PRODUCT_PACKAGES += \
    lights.msm8937

PRODUCT_PACKAGES += \
    android.hardware.light@2.0-impl \
    android.hardware.light@2.0-service

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/configs/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml

# OMX
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxSwVdec \
    libOmxSwVencMpeg4 \
    libOmxSwVencHevc \
    libOmxVdec \
    libOmxVenc \
    libOmxVidcCommon \
    libqomx_core \
    libstagefrighthw \
    libmm-omxcore

PRODUCT_PACKAGES += \
    android.hardware.media@1.0 \
    android.hardware.media.omx \
    android.hardware.media.omx@1.0 \
    android.hardware.media.omx@1.0-service

# Powerhint
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/powerhint.xml:system/etc/powerhint.xml \

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.1-service-qti

# Properties
-include $(LOCAL_PATH)/prop.mk

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
    ueventd.rc \
    init.qcom.rc \
    init.target.rc \
    init.asus.rc \
    init.asus.usb.rc \
    init.chargerled.sh \
    init.qcom.early_boot.sh \
    init.qcom.post_boot.sh \
    init.qcom.sh

# RIL
PRODUCT_PACKAGES += \
    librmnetctl \
    libxml2 \
    libtar \
    libprotobuf-cpp-lite \
    android.hardware.radio@1.0 \
    android.hardware.radio.config@1.0 \
    android.hardware.secure_element@1.0

# Seccomp policy
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/seccomp_policy/mediacodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    $(LOCAL_PATH)/seccomp_policy/mediaextractor.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-service.asus_8937 \
    android.hardware.sensors@1.0-impl

# Touch HAL
PRODUCT_PACKAGES += \
    vendor.lineage.touch@1.0-service.asus_8937

# Whitelisted app
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/qti_whitelist.xml:system/etc/sysconfig/qti_whitelist.xml \
    $(LOCAL_PATH)/permissions/privapp-permissions-qti.xml:system/etc/permissions/privapp-permissions-qti.xml

# Wifi
PRODUCT_PACKAGES += \
    libwcnss_qmi \
    wcnss_service \
    ipacm \
    IPACM_cfg.xml \
    libwpa_client \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/configs/wifi/WCNSS_cfg.dat:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/prima/WCNSS_cfg.dat \
    $(LOCAL_PATH)/configs/wifi/WCNSS_qcom_wlan_nv.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin \
    $(LOCAL_PATH)/configs/wifi/WCNSS_wlan_dictionary.dat:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/prima/WCNSS_wlan_dictionary.dat

PRODUCT_PACKAGES += \
    libcurl \
    tcpdump

# Wi-Fi Display
PRODUCT_BOOT_JARS += \
    WfdCommon

# Recovery
PRODUCT_PACKAGES += \
    librecovery_updater_X00D

# IMS
PRODUCT_PACKAGES += \
    ims-ext-common

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal/thermal-engine.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine.conf

# TextClassifier smart selection model files
PRODUCT_PACKAGES += \
    textclassifier.smartselection.bundle1

# Trust HAL
PRODUCT_PACKAGES += \
    vendor.lineage.trust@1.0-service

# USB HAL
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.basic

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
PRODUCT_PACKAGES += \
    antradio_app \
    AntHalService \
    com.dsi.ant.antradio_library \
    libantradio

PRODUCT_COPY_FILES += \
    external/ant-wireless/antradio-library/com.dsi.ant.antradio_library.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.dsi.ant.antradio_library.xml

# VNDK
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

# FlipFlap
PRODUCT_PACKAGES += \
   FlipFlap

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.allocator@1.0 \
    android.hidl.manager@1.0 \
    android.hidl.manager@1.0-java

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@1.0-service \
    android.hardware.thermal@1.0-impl


# Encryption
PRODUCT_PACKAGES += \
    vendor.qti.hardware.cryptfshw@1.0-service-qti.qsee


PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
