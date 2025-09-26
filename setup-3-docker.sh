#!/bin/sh
set -e

echo "\nRUNNING: $0  -->\nInstalling up Docker plus Emby, Homepage, Transmission and Prowlarr."

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

cp -R configs/docker ~/docker

sudo usermod -aG docker $USER

sudo apt update -y
sudo apt install docker-compose -y

sudo systemctl enable docker
sudo systemctl start docker
sudo docker compose up -d
sudo systemctl status --no-pager docker


