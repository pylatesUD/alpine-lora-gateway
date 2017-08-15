#!/bin/sh

set +e

apk update && apk add mosquitto

LORA_GATEWAY_BRIDGE_VERSION=2.1.5
wget -N https://github.com/brocaar/lora-gateway-bridge/releases/download/${LORA_GATEWAY_BRIDGE_VERSION}/lora_gateway_bridge_${LORA_GATEWAY_BRIDGE_VERSION}_linux_arm.tar.gz

tar xvzf lora_gateway_bridge_${LORA_GATEWAY_BRIDGE_VERSION}_linux_arm.tar.gz -C /usr/local/bin

cp ./lora-gateway-bridge-openrc.sh /etc/init.d/lora-gateway-bridge

cp lora-gateway-bridge.conf /etc/conf.d/lora-gateway-bridge

if ! [ -d /var/log/lora ]; then
mkdir /var/log/lora
fi
