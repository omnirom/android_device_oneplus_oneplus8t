# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017 The LineageOS Project
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
# This file is the build configuration for a full Android
# build for grouper hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Prebuilt
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/oneplus/oneplus8t/prebuilt/system,system) \
    $(call find-copy-subdir-files,*,device/oneplus/oneplus8t/prebuilt/product,product) \
    $(call find-copy-subdir-files,*,device/oneplus/oneplus8t/prebuilt/root,root)

PRODUCT_PACKAGES += fstab.postinstall
PRODUCT_PACKAGES += bootctrl.op8t
PRODUCT_PACKAGES += android.hardware.boot@1.1-service
PRODUCT_PACKAGES += android.hardware.boot@1.1-impl
PRODUCT_PACKAGES += android.hardware.boot@1.1-impl.recovery

#PRODUCT_PACKAGES += android.hardware.vibrator@1.3-service.oneplus8pro
#ifneq ($(filter $(ROM_BUILD_RADIO), true),)
#AB_OTA_PARTITIONS += abl
#AB_OTA_PARTITIONS += aop
#AB_OTA_PARTITIONS += bluetooth
#AB_OTA_PARTITIONS += cmnlib64
#AB_OTA_PARTITIONS += cmnlib
#AB_OTA_PARTITIONS += devcfg
#AB_OTA_PARTITIONS += dsp
#AB_OTA_PARTITIONS += featenabler
#AB_OTA_PARTITIONS += hyp
#AB_OTA_PARTITIONS += imagefv
#AB_OTA_PARTITIONS += keymaster
#AB_OTA_PARTITIONS += logo
##AB_OTA_PARTITIONS += mdm_oem_stanvbk
#AB_OTA_PARTITIONS += modem
#AB_OTA_PARTITIONS += multiimgoem
#AB_OTA_PARTITIONS += qupfw
#AB_OTA_PARTITIONS += storsec
##AB_OTA_PARTITIONS += spunvm
##AB_OTA_PARTITIONS += reserve
#AB_OTA_PARTITIONS += tz
#AB_OTA_PARTITIONS += uefisecapp
#AB_OTA_PARTITIONS += xbl_config
#AB_OTA_PARTITIONS += xbl
#endif
#
#$(call inherit-product, build/make/target/product/gsi_keys.mk)
#
