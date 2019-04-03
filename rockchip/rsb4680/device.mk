#
# Copyright 2014 The Android Open-Source Project
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

PRODUCT_PACKAGES += \
    Launcher3

#$_rbox_$_modify_$_zhengyang: add displayd
PRODUCT_PACKAGES += \
    displayd

#added AdvBroadcastReceiver
PRODUCT_PACKAGES += \
    AdvBroadcastReceiver

#enable this for support f2fs with data partion
#BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
# This ensures the needed build tools are available.
# TODO: make non-linux builds happy with external/f2fs-tool; system/extras/f2fs_utils
#ifeq ($(HOST_OS),linux)
#TARGET_USERIMAGES_USE_F2FS := true
#endif


PRODUCT_COPY_FILES += \
    device/rockchip/rsb4680/fstab.rk30board.bootmode.unknown:root/fstab.rk30board.bootmode.unknown \
    device/rockchip/rsb4680/fstab.rk30board.bootmode.emmc:root/fstab.rk30board.bootmode.emmc \
    device/rockchip/rsb4680/advantech.sh:system/bin/advantech.sh \
    device/rockchip/rsb4680/init.rc:root/init.rc \
    device/rockchip/rsb4680/config.txt:system/etc/firmware/config.txt

#4G modules
PRODUCT_COPY_FILES += \
    device/rockchip/rsb4680/check_mobile.sh:system/bin/check_mobile.sh \
    vendor/neoway/libreference-ril.so:system/lib/libneoway-ril.so \
    vendor/quectel/libreference-ril.so:system/lib/libquectel-ril.so \
    vendor/quectel/chat:system/bin/chat \
    vendor/quectel/ip-up:system/etc/ppp/ip-up \
    vendor/quectel/ip-down:system/etc/ppp/ip-down

#usb touch
PRODUCT_COPY_FILES += \
    vendor/usbtouch/libcalib-second.so:system/lib/libcalib-second.so \
    vendor/usbtouch/idc/Vendor_1bfd_Product_1568.idc:system/usr/idc/Vendor_1bfd_Product_1568.idc \
    vendor/usbtouch/idc/Vendor_1bfd_Product_1688.idc:system/usr/idc/Vendor_1bfd_Product_1688.idc \
    vendor/usbtouch/idc/Vendor_1bfd_Product_3050.idc:system/usr/idc/Vendor_1bfd_Product_3050.idc \
    vendor/usbtouch/idc/Vendor_1ddb_Product_0001.idc:system/usr/idc/Vendor_1ddb_Product_0001.idc \
    vendor/usbtouch/idc/Vendor_22b9_Product_0006.idc:system/usr/idc/Vendor_22b9_Product_0006.idc

# setup dalvik vm configs.
$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)


$(call inherit-product-if-exists, vendor/rockchip/rsb4680/device-vendor.mk)

$(call inherit-product, vendor/widevine/widevine.mk)
