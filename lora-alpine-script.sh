# Contributor: Sebastian Yesid Tabares Amaya  <sytabaresa@gmail.com>
# Maintainer: Sebastian Yesid Tabares Amaya  <sytabaresa@gmail.com>
pkgname=lora-packet-forwarder
pkgver=4.0.1
pkgrel=0
pkgdesc="A LoRa packet forwarder is a program running on the host of a LoRa gateway that forwards RF packets receive by the concentrator to a server through a IP/UDP link, and emits RF packets that are sent by the server. "
url="https://github.com/Lora-net/packet_forwarder"
arch="all"
license="custom"
depends="lora-gateway"
makedepends=""
install=""
subpackages="$pkgname-dev $pkgname-doc"
source="https://github.com/Lora-net/packet_forwarder/archive/v$pkgver.tar.gz"
builddir="$srcdir/"


mount -o remount,rw /media/mmcblk0p1
echo "dtparam=spi=on" >> /media/mmcblk0p1/usercfg.txt
mount -o remount,ro /media/mmcblk0p1