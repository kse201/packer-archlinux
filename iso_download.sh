#!/bin/sh

url="http://ftp.tsukuba.wide.ad.jp/Linux/archlinux/iso/latest"
md5sums=$(curl "${url}/md5sums.txt")
md5sum=$(echo $md5sums | awk '/iso/ {print $1}')
iso=$(echo $md5sums | awk '/iso/ {print $2}')

wget -O $iso \
  "http://ftp.tsukuba.wide.ad.jp/Linux/archlinux/iso/latest/$iso"
