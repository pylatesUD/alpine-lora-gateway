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
cd basic_pkt_fwd/
mac=$(cat /sys/class/net/eth0/address | sed -e 's/://g')
eui="${mac:0:7}FFFE${mac: -6}"
sed -ie "s/AA555A003A0581D1/$eui/g" local_conf.json
cd ../..
cp -ar packet_forwarder/ /opt/
cd ..

cp lora-packet-forwarder-openrc.sh /etc/init.d/lora-packet-forwarder
