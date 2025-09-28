#!/bin/sh
set -e

echo "\nRUNNING: $0  -->\nInstalling up Docker plus Emby, Homepage, Transmission and Prowlarr."

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

echo 
cp -R configs/docker ~/docker

sudo usermod -aG docker $USER

# sudo apt-get update -y
# sudo apt-get install docker-compose -y

cd configs/docker

# For docker to pick up environment variables from .env file
# .env file can't 
export HOSTNAME=$(hostname)

sudo systemctl enable docker
sudo systemctl start docker
sudo docker compose up -d
systemctl status docker --no-pager


