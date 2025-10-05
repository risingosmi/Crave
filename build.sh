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
echo "Remove Official OTA and Add A Custom OTA"
rm -rf packages/apps/Updater
echo "Now remove old Keys"
rm -rf vendor/lineage-priv/keys


#Rom Setup
echo ">>> Now Rom Initialize local repository\n\n"
# ROM source repo
repo init -u https://github.com/RisingOS-Revived/android -b sixteen --git-lfs


echo ">>> Now Cloning KEY repository\n\n"
# Sigm keys
git clone https://github.com/risingosmi/vendor-risingos_priv-keys.git -b 16 vendor/lineage-priv/keys


echo "Now Settings Custom OTA updates "
# OTA Resource
git clone https://github.com/risingosmi/android_packages_apps_Updater.git -b 16 packages/apps/Updater


echo ">>> Now Cloning Device Tree repository\n\n"
# Device Tree
git clone https://github.com/risingosmi/device_xiaomi_miatoll.git -b 16 device/xiaomi/miatoll

echo ">>> Now Cloning Vendor Tree repository\n\n"
# Device Vendor
git clone https://github.com/risingosmi/vendor_xiaomi_miatoll.git -b 16 vendor/xiaomi/miatoll

echo ">>> Now Cloning Kernel Tree repository\n\n"
# Device Kernel
git clone https://github.com/risingosmi/kernel_xiaomi_sm6250.git -b 16 kernel/xiaomi/sm6250

echo ">>> Now Cloning Hardware Tree repository\n\n"
# Device Hardware 
git clone https://github.com/risingosmi/hardware_xiaomi.git -b 16 hardware/xiaomi

echo ">>> Now Cloning Timekeep Tree repository\n\n"
# LineageOS TimeKeep
git clone https://github.com/LineageOS/android_hardware_sony_timekeep.git -b lineage-22.2 hardware/sony/timekeep

echo ">>> Now Rom In Building Setup\n\n"



#Rom Building

# Sync
/opt/crave/resync.sh

# Set up build environment
source build/envsetup.sh

# Lunch
riseup miatoll user

# Singing The Rom 
gk -f

# ----------- Build 1 (normal testkey build) -----------
echo ">>> Starting normal Build Realase Key \n\n"
rise b
rise sb
rise fb

echo ">>> Normal build finished\n\n"
