#!/bin/sh

set +e

apk update && apk add mosquitto curl git

LORA_GATEWAY_BRIDGE_VERSION=2.1.5
if ! [ -f lora_gateway_bridge_${LORA_GATEWAY_BRIDGE_VERSION}_linux_arm.tar.gz ]; then
curl -LO https://github.com/brocaar/lora-gateway-bridge/releases/download/${LORA_GATEWAY_BRIDGE_VERSION}/lora_gateway_bridge_${LORA_GATEWAY_BRIDGE_VERSION}_linux_arm.tar.gz
fi

tar xvzf lora_gateway_bridge_${LORA_GATEWAY_BRIDGE_VERSION}_linux_arm.tar.gz -C /usr/local/bin

cp ./lora-gateway-bridge-openrc.sh /etc/init.d/lora-gateway-bridge

cp lora-gateway-bridge.conf /etc/conf.d/lora-gateway-bridge
