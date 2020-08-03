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
    memtrack.$(TARGET_PRODUCT) \
    WallpaperPicker \
    Launcher3

#$_rbox_$_modify_$_zhengyang: add displayd
PRODUCT_PACKAGES += \
    displayd \
    libion

# added rild
PRODUCT_PACKAGES += \
    rild

#added AdvBroadcastReceiver
PRODUCT_PACKAGES += \
    AdvBroadcastReceiver

# Enable this for support f2fs with data partion
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs

# This ensures the needed build tools are available.
# TODO: make non-linux builds happy with external/f2fs-tool; system/extras/f2fs_utils
ifeq ($(HOST_OS), linux)
  TARGET_USERIMAGES_USE_F2FS := true
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.rsb4680.rc:root/init.rsb4680.rc \
    $(LOCAL_PATH)/init.rk30board.usb.rc:root/init.rk30board.usb.rc \
    $(LOCAL_PATH)/wake_lock_filter.xml:system/etc/wake_lock_filter.xml \
    device/rockchip/$(TARGET_PRODUCT)/package_performance.xml:$(TARGET_COPY_OUT_OEM)/etc/package_performance.xml \
    device/rockchip/$(TARGET_PRODUCT)/media_profiles_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml

# For 4G module
PRODUCT_COPY_FILES += \
       vendor/quectel/chat:system/bin/chat \
       vendor/quectel/ip-down:system/etc/ppp/ip-down \
       vendor/quectel/ip-up:system/etc/ppp/ip-up \
       vendor/quectel/libreference-ril.so:vendor/lib/libquectel-ril.so

# For auto run Shell
PRODUCT_COPY_FILES += \
       $(LOCAL_PATH)/adv_autorun.sh:system/bin/adv_autorun.sh \
       $(LOCAL_PATH)/hdmi-on.sh:system/bin/hdmi-on.sh \
       $(LOCAL_PATH)/hdmi-off.sh:system/bin/hdmi-off.sh

# update realtek bluetooth configs
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/bluetooth/rtkbt.conf:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth/rtkbt.conf

# setup dalvik vm configs.
$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

$(call inherit-product-if-exists, vendor/rockchip/$(TARGET_PRODUCT)/device-vendor.mk)

# For enable optee support
ifeq ($(strip $(PRODUCT_HAVE_OPTEE)), true)
PRODUCT_COPY_FILES += \
       device/rockchip/common/init.optee_verify.rc:root/init.optee.rc

# Choose TEE storage type
PRODUCT_PROPERTY_OVERRIDES += ro.tee.storage=rkss
endif

# Add build.product default property to parsing related rc
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.build.product=$(strip $(TARGET_PRODUCT))

PRODUCT_COPY_FILES += \
    device/rockchip/rsb4680/public.libraries.txt:vendor/etc/public.libraries.txt

#
# add Rockchip properties here
#
PRODUCT_PROPERTY_OVERRIDES += \
                ro.ril.ecclist=112,911 \
                ro.opengles.version=196610 \
                wifi.interface=wlan0 \
                persist.tegra.nvmmlite = 1 \
                ro.audio.monitorOrientation=true \
                debug.nfc.fw_download=false \
                debug.nfc.se=false \
                ro.rk.screenoff_time=60000 \
                ro.rk.screenshot_enable=true \
                ro.rk.def_brightness=200 \
                ro.rk.homepage_base=http://www.google.com/webhp?client={CID}&amp;source=android-home \
                ro.rk.install_non_market_apps=false \
                sys.hwc.compose_policy=6 \
                sys.wallpaper.rgb565=0 \
                sf.power.control=2073600 \
                sys.rkadb.root=0 \
                ro.sf.fakerotation=false \
		ro.same.orientation=true \
		ro.rotation.external=true \
                ro.rk.MassStorage=false \
                ro.rk.systembar.voiceicon=true \
                ro.rk.systembar.tabletUI=false \
                ro.rk.LowBatteryBrightness=false \
                ro.tether.denied=false \
                sys.resolution.changed=false \
                ro.default.size=100 \
                ro.product.usbfactory=rockchip_usb \
                wifi.supplicant_scan_interval=15 \
                ro.factory.tool=0 \
                ro.kernel.android.checkjni=0 \
                ro.sf.lcd_density=160 \
                ro.build.shutdown_timeout=0 \
                persist.enable_task_snapshots=false \
                ro.adb.secure=0 \
                ro.rk.displayd.enable=false \

#
# add Advantech properties here
#
PRODUCT_PROPERTY_OVERRIDES += \
		factory.long_press_power_off=1 \
		persist.dual.audio=true \
		ro.boot.noril=false \
		ro.radio.noril=false \
		persist.navbar=true \
		persist.statusbar=true \
		persist.sys.usb.config=mtp,adb \
		ro.rk.hdmisetting=true

