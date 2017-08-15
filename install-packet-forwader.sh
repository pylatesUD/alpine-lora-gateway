#!/bin/sh

cd src
git clone https://github.com/pylatesUD/lora_gateway
cd lora_gateway
git checkout ftdi
make
cd ..

git clone https://github.com/pylatesUD/packet_forwarder
cd packet_forwarder
git checkout ftdi
make
cd ..
cd ..

