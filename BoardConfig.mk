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
BOARD_PATH := device/oneplus/oneplus8t


PRODUCT_SOONG_NAMESPACES += device/oneplus/oneplus8t
PRODUCT_SOONG_NAMESPACES += device/oneplus/oneplus8pro/gpt-utils

BOARD_PREBUILT_VENDORIMAGE := vendor/image/oneplus/oneplus8t/vendor.img
BOARD_PREBUILT_ODMIMAGE := vendor/image/oneplus/oneplus8t/odm.img
TARGET_OTA_ASSERT_DEVICE := oneplus8t
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(BOARD_PATH)/bluetooth

TARGET_SYSTEM_PROP += $(BOARD_PATH)/system.prop

#BOARD_PLAT_PUBLIC_SEPOLICY_DIR += $(BOARD_PATH)/sepolicy/public
#BOARD_PLAT_PRIVATE_SEPOLICY_DIR += $(BOARD_PATH)/sepolicy/private
#PRODUCT_PRIVATE_SEPOLICY_DIRS += $(BOARD_PATH)/sepolicy/product/priv
#PRODUCT_PUBLIC_SEPOLICY_DIRS += $(BOARD_PATH)/sepolicy/product/public

OMNI_PRODUCT_PROPERTIES += \
    ro.sf.lcd_density=420

ifneq ($(filter $(ROM_BUILD_RADIO), true),)
BOARD_PACK_RADIOIMAGES := abl
BOARD_PACK_RADIOIMAGES += aop
BOARD_PACK_RADIOIMAGES += bluetooth
BOARD_PACK_RADIOIMAGES += cmnlib64
BOARD_PACK_RADIOIMAGES += cmnlib
BOARD_PACK_RADIOIMAGES += devcfg
BOARD_PACK_RADIOIMAGES += dsp
BOARD_PACK_RADIOIMAGES += featenabler
BOARD_PACK_RADIOIMAGES += hyp
BOARD_PACK_RADIOIMAGES += imagefv
BOARD_PACK_RADIOIMAGES += keymaster
BOARD_PACK_RADIOIMAGES += logo
#BOARD_PACK_RADIOIMAGES += mdm_oem_stanvbk
BOARD_PACK_RADIOIMAGES += modem
BOARD_PACK_RADIOIMAGES += multiimgoem
BOARD_PACK_RADIOIMAGES += qupfw
#BOARD_PACK_RADIOIMAGES += reserve
BOARD_PACK_RADIOIMAGES += storsec
#BOARD_PACK_RADIOIMAGES += spunvm
BOARD_PACK_RADIOIMAGES += tz
BOARD_PACK_RADIOIMAGES += uefisecapp
BOARD_PACK_RADIOIMAGES += xbl_config
BOARD_PACK_RADIOIMAGES += xbl_config_lp5
BOARD_PACK_RADIOIMAGES += xbl
BOARD_PACK_RADIOIMAGES += xbl_lp5
BOARD_PACK_RADIOIMAGES += storsec
endif

include device/oneplus/oneplus8pro/BoardConfig.mk

TARGET_RECOVERY_UI_SCREEN_WIDTH := 1080
TARGET_RECOVERY_UI_MARGIN_WIDTH := 30
TARGET_RECOVERY_UI_FONT := device/oneplus/oneplus8t/recovery/font.png
