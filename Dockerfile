FROM taskinen/home-assistant:latest
MAINTAINER Fredrik Fjeld <fredrik@fjeld.io>

# Install dependencies for the new Z-Wave update required since 0.45
RUN apt-get install -y libudev-dev
