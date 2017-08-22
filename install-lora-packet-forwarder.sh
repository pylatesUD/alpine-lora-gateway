#!/bin/sh

cd src
git clone https://github.com/pylatesUD/lora_gateway
cd lora_gateway
git checkout ftdi
make
cd ..
cp -ar lora_gateway/ /opt/

git clone https://github.com/pylatesUD/packet_forwarder
cd packet_forwarder
git checkout ftdi
make
cd ..
cp -ar packet_forwarder/ /opt/
cd ..

cp lora-packet-forwarder-openrc.sh /etc/init.d/lora-packet-forwarder
