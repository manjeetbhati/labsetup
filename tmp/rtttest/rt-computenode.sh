#!/bin/bash

git clone git://git.qemu.org/qemu.git
cd qemu
git checkout -b 2.5.1 v2.5.1
git submodule update --init pixman
git submodule update --init dtc

mkdir build
cd build

sudo apt-get install pkg-config
sudo apt-get install -y libnuma-dev
sudo apt-get install -y libglib2.0-dev
sudo apt-get install -y dh-autoreconf
sudo apt-get install -y libpci-dev
../configure --prefix=/usr   
make -j20
sudo make install

sudo apt-get install -y xsltproc libxml-xpath-perl libyajl-dev libdevmapper-dev libpciaccess-dev

# libvirt
cd ~/src
git clone git://libvirt.org/libvirt.git
cd libvirt
git checkout -b 1.3.2 v1.3.2
sudo apt-get install libxml2-utils
sudo apt-get install -y libxml2
sudo apt-get install -y libnl-dev uuid-dev
./autogen.sh

