Setting up Raspberry Pi Server
==============================

  - Install Ubuntu Server 24.04 LTS for Raspberry Pi, enabling SSH

  - Install docker using the docker APT repositories https://docs.docker.com/engine/install/ubuntu/

  - Check it works with sudo docker run hello-world

  - Configure docker to run as a non-root user (https://docs.docker.com/engine/install/linux-postinstall/)

  - Configure docker to start on boot (systemctl enable docker.service; systemctl enable containerd.service)

  - Create Directories for container data
    - mkdir /home/docker
    - mkdir /home/docker/mosquitto
    - mkdir /home/docker/zigbee2mqtt
    - mkdir /home/docker/homeassistant

  - Copy configuration files
    - cp docker/zigbee2mqtt/configuration.yaml /home/docker/zigbee2mqtt

  - Set data folder ownership and permissions
    - chgrp -R docker /home/docker
    - chmod -R g+w /home/docker


  - Create our containers using docker compose (the first time this is run, it takes a long time (over 10 mins))
    - docker compose up -d


