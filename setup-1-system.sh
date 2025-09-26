#!/bin/sh
set -e

echo "\nRUNNING: $0  -->\nUpdating and upgrading packages (non-interactive)..."

# Raspi check
if [ ! -f /proc/device-tree/model ]; then
    echo "⚠️  Could not detect Raspberry Pi (missing /proc/device-tree/model)."
    exit 1
fi

MODEL=$(tr -d '\0' < /proc/device-tree/model)
if ! echo "$MODEL" | grep -q "Raspberry"; then
    echo "⚠️  Warning: This script is intended for Raspberry Pi only."
    echo "Detected model: $MODEL"
    exit 1
fi



# Update
sudo apt-get update -y

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Upgrade
sudo DEBIAN_FRONTEND=noninteractive \
apt-get -o Dpkg::Options::="--force-confdef" \
        -o Dpkg::Options::="--force-confnew" \
        upgrade -y

# Dist-upgrade
sudo DEBIAN_FRONTEND=noninteractive \
apt-get -o Dpkg::Options::="--force-confdef" \
        -o Dpkg::Options::="--force-confnew" \
        dist-upgrade -y

echo "$0 __ Upgrade finished."
