#!/bin/bash



# Clean old repo/local_manifests and device/vendor/kernel/hardware trees
echo ">>> Cleaning old manifests and device/vendor/kernel/hardware directories\n\n\n"
rm -rf .repo/local_manifests/
echo ">>> Clear device\n\n"
rm -rf device/xiaomi/miatoll
echo ">>> Clear vendor\n\n"
rm -rf vendor/xiaomi/miatoll
echo ">>> Clear kernel/hardware\n\n"
rm -rf kernel/xiaomi/sm6250
echo ">>> Clear hardware \n\n"
rm -rf hardware/xiaomi
echo ">>> Clear TimeKeep\n\n"
rm -rf hardware/sony/timekeep
echo "Now remove old Keys"
rm -rf vendor/lineage-priv/keys
echo "Now Delete Micamera if Exists"
rm -rf vendor/xiaomi/miuicamera
echo "Now Delete Dolby if Exists"
rm -rf  vendor/sony/dolby


#Rom Setup
echo ">>> Now Rom Initialize local repository"
repo init -u https://github.com/risingosmi/RISINGOS -b 16 --git-lfs

echo ">>> Now Cloning KEY repository"
git clone https://github.com/risingosmi/vendor-risingos_priv-keys.git -b 16 vendor/lineage-priv/keys
echo ">>> Now Cloning Device Tree repository"
git clone https://github.com/risingosmi/device_xiaomi_miatoll.git -b 16 device/xiaomi/miatoll
echo ">>> Now Cloning Vendor Tree repository"
git clone https://github.com/risingosmi/vendor_xiaomi_miatoll.git -b 16 vendor/xiaomi/miatoll
echo ">>> Now Cloning Kernel Tree repository"
git clone https://github.com/risingosmi/kernel_xiaomi_sm6250.git -b 16 kernel/xiaomi/sm6250
echo ">>> Now Cloning Hardware Tree repository"
git clone https://github.com/risingosmi/hardware_xiaomi.git -b 16 hardware/xiaomi
echo ">>> Now Cloning Timekeep Tree repository"
git clone https://github.com/LineageOS/android_hardware_sony_timekeep.git -b lineage-22.2 hardware/sony/timekeep
echo "Cloning Micamera"
git clone https://github.com/risingosmi/vendor_xiaomi_miuicamera.git -b 16 vendor/xiaomi/miuicamera
echo "Cloning Sony Dolby"
git clone https://github.com/risingosmi/vendor_dolby_miatoll.git -b 16 vendor/sony/dolby



echo ">>> Now Rom In Building Setup"
/opt/crave/resync.sh

# Set up build environment
source build/envsetup.sh

# Singing The Rom 
gk -f

# Lunch
riseup miatoll user


# ----------- Build 1 (normal testkey build) -----------
echo ">>> Starting normal Build Realase Key \n\n"
rise b
echo ">>> Normal build finished\n\n"
