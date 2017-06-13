# Home Assistant

My docker-compose.yml
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
