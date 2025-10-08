#!/bin/bash
# Clean old repo/local_manifests
rm -rf .repo/local_manifests/



#Rom Setup
echo -e ">>> Now Rom Initialize local repository"
repo init -u https://github.com/risingosmi/RISINGOS -b 16 --git-lfs

echo -e ">>> Now Cloning KEY repository"
git clone https://github.com/risingosmi/vendor-risingos_priv-keys.git -b 16 vendor/lineage-priv/keys
echo -e ">>> Now Cloning Device Tree repository"
git clone https://github.com/risingosmi/device_xiaomi_miatoll.git -b 16 device/xiaomi/miatoll
echo -e ">>> Now Cloning Vendor Tree repository"
git clone https://github.com/risingosmi/vendor_xiaomi_miatoll.git -b 16 vendor/xiaomi/miatoll
echo -e ">>> Now Cloning Kernel Tree repository"
git clone https://github.com/risingosmi/kernel_xiaomi_sm6250.git -b 16 kernel/xiaomi/sm6250
echo -e ">>> Now Cloning Hardware Tree repository"
git clone https://github.com/risingosmi/hardware_xiaomi.git -b 16 hardware/xiaomi
echo -e ">>> Now Cloning Timekeep Tree repository"
git clone https://github.com/LineageOS/android_hardware_sony_timekeep.git -b lineage-22.2 hardware/sony/timekeep
echo -e "Cloning Micamera"
git clone https://github.com/risingosmi/vendor_xiaomi_miuicamera.git -b 16 vendor/xiaomi/miuicamera

# Resync
/opt/crave/resync.sh

# Set up build environment
source build/envsetup.sh

# GMS Core build
export WITH_GMS=true
export TARGET_USES_PICO_GAPPS=true

# Signing The Rom 
gk -f

# Lunch
riseup miatoll user

# Build
rise b
