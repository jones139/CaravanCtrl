#!/bin/sh
# A script version of the instructions in piSetup.md

# First clone this repository and execute this file with
# git clone git@github.com:jones139/CaravanCtrl.git
# cd CaravanCtrl
# sudo ./piSetup.sh

# This will need to be executed as root

apt update
apt upgrade

# 
# Install Docker (from official docker apt repository)
# (based on https://docs.docker.com/engine/install/ubuntu/)
# Add Docker's official GPG key:
apt-get install ca-certificates curl
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

systemctl enable docker.service
systemctl enable containerd.service


mkdir /home/docker
mkdir /home/docker/mosquitto
mkdir /home/docker/zigbee2mqtt
mkdir /home/docker/homeassistant

cp docker/zigbee2mqtt/configuration.yaml /home/docker/zigbee2mqtt
chgrp -R docker /home/docker
chmod -R g+w /home/docker

docker compose up -d

