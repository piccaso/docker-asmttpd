#!/bin/bash
set -e
set -x

cd "$( dirname "${BASH_SOURCE[0]}" )"
docker run -it --rm -v `pwd`:/build alpine sh /build/build-on-alpine.sh
mv -f root.tar.gz ../tiny