# Copyright (C) 2010 The Android Open Source Project
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

VENDOR_EXCEPTION_PATHS := oneplus \
    omni

# Sample: This is where we'd set a backup provider if we had one
# $(call inherit-product, device/sample/products/backup_overlay.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)

# Get the prebuilt list of APNs
$(call inherit-product, vendor/omni/config/gsm.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_BUILD_PRODUCT_IMAGE  := true
PRODUCT_BUILD_SYSTEM_EXT_IMAGE  := true
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
PRODUCT_BUILD_ODM_IMAGE := false

BOARD_SUPER_PARTITION_SIZE := 12884901888
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 6442450944
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    system \
    system_ext \
    product


ifeq ($(filter $(ROM_BUILDTYPE), GAPPS),)
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 660602880
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 660602880
BOARD_SYSTEM_EXTIMAGE_PARTITION_RESERVED_SIZE := 660602880
endif

# tell update_engine to not change dynamic partition table during updates
# needed since our qti_dynamic_partitions does not include
# vendor and odm and we also dont want to AB update them
#TARGET_ENFORCE_AB_OTA_PARTITION_LIST := true

# enable to generate super_empy.img if needed to wipe super partition table
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST += \
    vendor \
    odm

BOARD_EXT4_SHARE_DUP_BLOCKS := true
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 100663296
BOARD_DTBOIMG_PARTITION_SIZE := 25165824

PRODUCT_BUILD_RAMDISK_IMAGE := true
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
TARGET_NO_RECOVERY := false
TARGET_NO_RADIOIMAGE := false
BOARD_INCLUDE_RECOVERY_DTBO = true
BOARD_BUILD_RETROFIT_DYNAMIC_PARTITIONS_OTA_PACKAGE := false
BOARD_USES_RECOVERY_AS_BOOT := false

# must be before including omni part
TARGET_BOOTANIMATION_SIZE := 1080p
AB_OTA_UPDATER := true

TARGET_RELEASETOOLS_EXTENSIONS ?= device/oneplus/oneplus8t/releasetools/

DEVICE_PACKAGE_OVERLAYS += device/oneplus/oneplus8t/overlay/device
DEVICE_PACKAGE_OVERLAYS += device/oneplus/oneplus8pro/overlay/common
DEVICE_PACKAGE_OVERLAYS += vendor/omni/overlay/CarrierConfig

$(call inherit-product, device/oneplus/oneplus8pro/qssi_whitelist.mk)
# Inherit from our custom product configuration
$(call inherit-product, device/oneplus/oneplus8t/avb.mk)
$(call inherit-product, vendor/omni/config/common.mk)


# get the rest of aosp stuff after ours
$(call inherit-product, $(SRC_TARGET_DIR)/product/mainline_system_arm64.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/oneplus/oneplus8pro/device.mk)
$(call inherit-product, device/oneplus/oneplus8t/op8t.mk)

ALLOW_MISSING_DEPENDENCIES := true

PRODUCT_SHIPPING_API_LEVEL := 30

# Discard inherited values and use our own instead.
PRODUCT_NAME := omni_oneplus8t
PRODUCT_DEVICE := oneplus8t
PRODUCT_BRAND := OnePlus
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_MODEL := KB2003

TARGET_DEVICE := OnePlus8T
PRODUCT_SYSTEM_NAME := OnePlus8T

VENDOR_RELEASE := 11/RP1A.201005.001/2103221755:user/release-keys
BUILD_FINGERPRINT := OnePlus/OnePlus8T/OnePlus8T:$(VENDOR_RELEASE)
OMNI_BUILD_FINGERPRINT := OnePlus/OnePlus8T/OnePlus8T:$(VENDOR_RELEASE)
OMNI_PRIVATE_BUILD_DESC := "'OnePlus8T-user 11 RP1A.201005.001 2103221755'"

PLATFORM_SECURITY_PATCH_OVERRIDE := 2021-03-01

TARGET_VENDOR := oneplus

# for bringup to disable secure adb - copy adbkey.pub from ~/.android
PRODUCT_ADB_KEYS := device/oneplus/oneplus8t/adbkey.pub
PRODUCT_PACKAGES += \
    adb_keys

PRODUCT_ENFORCE_RRO_TARGETS :=
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS := framework-res
PRODUCT_ENFORCE_RRO_EXEMPTED_TARGETS := vendor

PRODUCT_ARTIFACT_PATH_REQUIREMENT_IGNORE_PATHS := /system/system_ext/
DISABLE_ARTIFACT_PATH_REQUIREMENTS := true
PRODUCT_ENFORCE_ARTIFACT_PATH_REQUIREMENTS := true
TARGET_SKIP_OTATOOLS_PACKAGE := false

PRODUCT_SOONG_NAMESPACES += device/oneplus/oneplus8pro
PRODUCT_SOONG_NAMESPACES += vendor/oneplus/oneplus8t
PRODUCT_SOONG_NAMESPACES += vendor/qcom/opensource/commonsys/packages/apps/Bluetooth
PRODUCT_SOONG_NAMESPACES += vendor/qcom/opensource/commonsys/system/bt/conf

$(call inherit-product, device/oneplus/oneplus8pro/qssi_whitelist.mk)

$(call inherit-product, vendor/oneplus/oneplus8t/oneplus8t-vendor.mk)

$(call inherit-product, \
    $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

