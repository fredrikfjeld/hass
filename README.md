# Home Assistant

This is a fork of https://github.com/taskinen/home-assistant which in turn is a fork of https://github.com/home-assistant/home-assistant.

Official documentation can be found there.

## New features

This image builds upon the Telldus Tellstick support added by [taskinen](https://github.com/taskinen) with added support for Z-Wave.
It also adds support for IKEA Trådfri.

## docker-compose

This is my docker-compose.yml. You should curstomize it to fit your needs. Specifically the paths to devices and config files should probably be changed.

``` yaml
version: '2'
services:
  hass:
    container_name: "hass"
    image: "ffredrik/hass"
    volumes:
      - "./config:/config"
      - "./config/tellstick.conf:/etc/tellstick.conf"
      - "/docker/containers/ozwcp/config/options.xml:/usr/src/app/build/python-openzwave/openzwave/config/options.xml"
      - "/docker/containers/ozwcp/config/options.xml:/usr/local/lib/python3.6/site-packages/python_openzwave/ozw_config/options.xml"
      - "/etc/letsencrypt:/etc/letsencrypt"
    devices:
      - "/dev/bus/usb:/dev/bus/usb"
      - "/dev/ttyACM0:/dev/ttyACM0"
    ports:
      - "8123:8123"
    restart: unless-stopped
    network_mode: "host"
    privileged: true
```
