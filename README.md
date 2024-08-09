# CaravanCtrl
Monitoring and remote control of lighting, heating etc. in our Static Caravan

The approach to be taken is to have the following hardware in the caravan
  - A raspberry Pi 4 will be used as a server, running the following in docker containers, setup using docker-compose:
    - mosquitto mqtt broker
    - zigbee2mqtt bridge (using a Sonoff zigbee dongle)
    - homeassistant
  - There will be the following zigbee devices
    - Temp/Humidity sensor
    - Relay (to control the central heating)
    - Motion sensors (2 off)
    - switch (to control lights)
  - A Tp-Link tapo security camera
  - An old phone with a Lebra mobile SIM to provide network access

Using a mobile network means we have no control over routing, so it will be difficult to log into the caravan server.   We will address this in two ways:
  - Use an MQTT broker on a remote machine to transfer messages between the caravan and home.
    - This will involve configuring the mqtt bridge functionality so that we can:
      - Monitor the caravan sensors from home, via mqtt messages.
      - Send simple commands to the caravan via mqtt (e.g. increase central heating set point because we are coming over).
  - Use the same remote machine to create a VPN containing the caravan server and the remote machine - I should then be able to log into the caravan server through the remote machine.



  ## Current Status
    - The basic raspberry pi setup is working locally (mosquitto, zigbee2mqtt, homeassistant) - see piSetup.sh script.