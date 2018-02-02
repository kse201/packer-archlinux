#!/bin/sh -e

url="http://ftp.tsukuba.wide.ad.jp/Linux/archlinux/iso/latest"
md5sums=$(curl "${url}/md5sums.txt")
md5sum=$(echo $md5sums | awk '/iso/ {print $1}')
iso=$(echo $md5sums | awk '/iso/ {print $2}')
base_name=$(basename ${iso} .iso)

packer build \
  -var "iso_sum=${md5sum}" \
  -var "base_name=${base_name}" \
  archlinux-x86_64.json

vagrant box add --name ${base_name} ${base_name}.box
