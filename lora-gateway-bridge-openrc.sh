#!/sbin/openrc-run
# Copyright 2017 Sebastian Tabares
# Distributed under the terms of the GNU General Public License v3
# $Header: $

depend() {
  need net
}

start() {
  ebegin "Starting LoRa Gateway Bridge"
  start-stop-daemon --background --start --exec \
  /usr/local/bin/lora-gateway-bridge \
  --make-pidfile --pidfile /var/run/lora-gateway-bridge.pid \
  -1 /var/log/lora/lora-gateway-bridge.log \
  -2 /var/log/lora/lora-gateway-bridge.errors
  eend $?
}

stop() {
  ebegin "Stopping LoRa Gateway Bridge"
  start-stop-daemon --stop --exec \
  /usr/local/bin/lora-gateway-bridge \
  --pidfile /var/run/lora-gateway-bridge.pid
  eend $?
}

