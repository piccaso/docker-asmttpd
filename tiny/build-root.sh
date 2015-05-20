#!/bin/bash

#requirements: make yasm curl ld (binutils) gzip

set -x
curl -o asmttpd.tar.gz https://codeload.github.com/nemasu/asmttpd/tar.gz/master
tar -zxvf asmttpd.tar.gz
cd asmttpd*
make release
mkdir -p ../rootfs/var/www
mkdir -p ../rootfs/bin/
cp -v asmttpd ../rootfs/bin/
cp -v web_root/* ../rootfs/var/www/
cd ..
rm -rf root.tar.gz asmttpd*
cd rootfs
tar -cvf ../root.tar .
cd ..
rm -rf rootfs
gzip -9 root.tar