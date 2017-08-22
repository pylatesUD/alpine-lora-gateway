#!/sbin/openrc-run
# Copyright 2017 Sebastian Tabares
# Distributed under the terms of the GNU General Public License v3
# $Header: $

cd /opt/packet_forwarder/basic_pkt_fwd/

depend() {
  need net
}

start() {
  ebegin "Starting Packet Forwarder"
  start-stop-daemon --background --start \
  --exec ./basic_pkt_fwd \
  --make-pidfile --pidfile /var/run/packet-forwarder.pid \
  -1 /var/log/lora/packet-forwarder.log \
  -2 /var/log/lora/packet-forwarder.errors
  eend $?
}

stop() {
  ebegin "Stopping Packet Forwarder"
  start-stop-daemon --stop \
  -x ./basic_pkt_fwd \
  --pidfile /var/run/packet-forwarder.pid
  eend $?
}

