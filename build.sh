#!/bin/bash

# ================================
# Clean old manifests
# ================================
rm -rf .repo/local_manifests/

# ================================
# Initialize RisingOS repo
# ================================
echo ">>> Initializing RisingOS repository"
repo init -u https://github.com/risingosmi/RISINGOS -b 16 --git-lfs

# ================================
# Clone device/vendor/kernel trees
# ================================
echo ">>> Cloning Device Trees"
git clone https://github.com/risingosmi/device_xiaomi_miatoll.git -b 16 device/xiaomi/miatoll
git clone https://github.com/risingosmi/vendor_xiaomi_miatoll.git -b 16 vendor/xiaomi/miatoll
git clone https://github.com/risingosmi/kernel_xiaomi_sm6250.git -b 16 kernel/xiaomi/sm6250
git clone https://github.com/risingosmi/hardware_xiaomi.git -b 16 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_sony_timekeep.git -b lineage-22.2 hardware/sony/timekeep
git clone https://github.com/risingosmi/vendor_xiaomi_miuicamera.git -b 16 vendor/xiaomi/miuicamera
git clone https://github.com/risingosmi/vendor-risingos_priv-keys.git -b 16 vendor/lineage-priv/keys

# ================================
# Sync remaining sources
# ================================
echo ">>> Syncing repo"
/opt/crave/resync.sh

# ================================
# Setup build environment
# ================================
source build/envsetup.sh

# ================================
# Generate signing keys
# ================================
echo ">>> Generating signing keys"
gk -f

# ================================
# Start build
# ================================
echo ">>> Starting RisingOS Build"
riseup miatoll eng
rise b
