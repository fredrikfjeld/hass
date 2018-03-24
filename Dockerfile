FROM taskinen/home-assistant:latest
MAINTAINER Fredrik Fjeld <fredrik@fjeld.io>

# Install dependencies for the new Z-Wave update required since 0.45
RUN apt-get install -y libudev-dev

# Install dependencies for IKEA Trådfri
RUN apt-get update
RUN apt-get install -y libtool autoconf git-core
RUN git clone --depth 1 --recursive -b dtls https://github.com/home-assistant/libcoap.git
RUN cd libcoap && ./autogen.sh && ./configure --disable-documentation --disable-shared --without-debug CFLAGS="-D COAP_DEBUG_FD=stderr" && make && make install

# Install dependencies for Apple TV
RUN apt-get install -y build-essential libssl-dev libffi-dev python-dev python3-setuptools python3-dev

# Install dependencies for Bluetooth LE
RUN apt-get install -y python3-pip libglib2.0-dev
RUN pip3 install bluepy
