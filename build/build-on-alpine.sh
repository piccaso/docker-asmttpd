#!/bin/sh

set -e
set -x

cd /build
apk add --update yasm make binutils curl gzip gcc libc-dev
curl -o ELFkickers.tar.gz https://codeload.github.com/BR903/ELFkickers/tar.gz/master
curl -o asmttpd.tar.gz https://codeload.github.com/nemasu/asmttpd/tar.gz/master
tar -zxvf ELFkickers.tar.gz
rm ELFkickers.tar.gz
cd ELFkickers-*
make install PROGRAMS=sstrip
cd ..
rm -rf ELFkickers-*
tar -zxvf asmttpd.tar.gz
rm asmttpd.tar.gz
cd asmttpd-*
make release
sstrip -z asmttpd
cp asmttpd ..
cd ..
mkdir -p rootfs/bin
mv asmttpd rootfs/bin
rm -rf asmttpd-*
mkdir -p rootfs/var/www
echo "it works!" > rootfs/var/www/index.html
cd rootfs
tar -cvf ../root.tar .
cd ..
rm -rf rootfs
gzip -9 root.tar
