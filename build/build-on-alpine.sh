#!/bin/sh

set -e
set -x

cd /build
apk add --update yasm make binutils curl gzip
curl -o asmttpd.tar.gz https://codeload.github.com/nemasu/asmttpd/tar.gz/master
tar -zxvf asmttpd.tar.gz
rm asmttpd.tar.gz
cd asmttpd-*
make release
cp asmttpd ..
make clean
make
cp asmttpd ../asmttpd-debug
cd ..
mkdir -p rootfs/bin
mv asmttpd asmttpd-debug rootfs/bin
rm -rf asmttpd-*
mkdir -p rootfs/var/www
echo "it works!" > rootfs/var/www/index.html
cd rootfs
tar -cvf ../root.tar .
cd ..
rm -rf rootfs
gzip -9 root.tar
