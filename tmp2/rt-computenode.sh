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

sudo apt-get install xsltproc
sudo apt-get install libxml-xpath-perl
sudo apt-get install libyajl-dev
sudo apt-get install libdevmapper-dev
sudo apt-get install libpciaccess-dev


