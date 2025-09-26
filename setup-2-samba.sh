#!/bin/bash
set -e 

echo "\nRUNNING: $0  -->\nSetting up Samba file sharing..."

SHARED_DIR="/home/shared/pishare"
USERNAME=$(whoami) # MUST be an existing user, $(whoami) to get current user 
HOSTNAME=$(hostname).local


CONFIG_FILE="/etc/samba/smb.conf"
LOCAL_CONFIG_FILE=configs/samba/$(basename "$CONFIG_FILE")

sudo mkdir -p $SHARED_DIR
sudo chown -R $USERNAME:$USERNAME $SHARED_DIR

if [ -f "$CONFIG_FILE" ]; then
    sudo cp "$CONFIG_FILE" "$CONFIG_FILE.bak"
fi
sudo cp $LOCAL_CONFIG_FILE $CONFIG_FILE

sudo smbpasswd -a $USERNAME
sudo smbpasswd -e $USERNAME

sudo systemctl restart smbd
sudo systemctl enable smbd
systemctl status smbd