#!/bin/sh
DATETIME=2019.02.01
FILENAME=archlinux-${DATETIME}-x86_64.iso
wget -O $FILENAME \
  "http://ftp.tsukuba.wide.ad.jp/Linux/archlinux/iso/${DATETIME}/$FILENAME"
