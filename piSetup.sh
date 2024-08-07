#!/bin/sh
# A script version of the instructions in piSetup.md
# This will need to be executed as root

# FIXME - add initial docker installation.

systemctl enable docker.service
systemctl enable containerd.service

mkdir /home/docker
mkdir /home/docker/mosquitto
mkdir /home/docker/zigbee2mqtt
mkdir /home/docker/homeassistant

cp docker/zigbee2mqtt/configuration.yaml /home/docker/zigbee2mqtt

docker compose up -d

