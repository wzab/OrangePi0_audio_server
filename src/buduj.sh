#!/bin/bash
gzip -d .config.gz
gzip -d kernel.config.gz
set -e
wget https://buildroot.org/downloads/buildroot-2017.11.tar.bz2
tar -xjf /home/wzab/OrangePi0/BR2017.11/buildroot-2017.11.tar.bz2 
(
  cd buildroot-2017.11
  make orangepi_zero_defconfig
)
cp .config buildroot-2017.11
patch -p1 < 0001-Changes-for-initramfs-and-audio-streaming-with-ffmpe.patch
cd buildroot-2017.11
make all

