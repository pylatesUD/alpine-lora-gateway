#!/bin/sh

#TODO: usar APKBUILD

## Enable apk community repository!
sed -ie 's|#http://dl-3.alpinelinux.org/alpine/v3.6/community|http://dl-3.alpinelinux.org/alpine/v3.6/community|g' /etc/apk/repositories

## install dependencies
apk add libftdi1-dev autoconf gcc make

pkgname=libmpsse
pkgver=1.3
srcdir=$(pwd)/src
destdir=/usr/local

if ! [ -d $srcdir ]; then
mkdir $srcdir
fi

if ! [ -f ${pkgname}-${pkgver}.tar.gz ]; then
curl -LO https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/${pkgname}/${pkgname}-${pkgver}.tar.gz
fi
tar xvzf ${pkgname}-${pkgver}.tar.gz -C $srcdir

cd $srcdir
curl -Lo patch-src_configure_ac.patch https://aur.archlinux.org/cgit/aur.git/plain/patch-src_configure_ac.patch?h=libmpsse
curl -Lo patch-src_Makefile.in.patch  https://aur.archlinux.org/cgit/aur.git/plain/patch-src_Makefile.in.patch?h=libmpsse

cd "${srcdir}/${pkgname}-${pkgver}"

patch -p0 -i "${srcdir}/patch-src_configure_ac.patch"
patch -p0 -i "${srcdir}/patch-src_Makefile.in.patch"

## build
cd $srcdir/$pkgname-$pkgver/src
autoconf
sh configure --prefix=/usr/local --disable-python
make all

## install
make DESTDIR="$dstdir/" install
