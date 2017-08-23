#!/bin/bash
set -e

if ! [ -d /build/harfbuzz ]
then
    cd /build
    curl -L http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-0.9.38.tar.bz2 | tar xjf -
    mv harfbuzz* harfbuzz
fi

cd /build/harfbuzz
./configure --without-cairo --without-glib --without-icu --prefix=/usr/local
make -j4 install

cd /build

export CXX="/usr/lib/ccache/clang++"
export CC="/usr/lib/ccache/clang"
mkdir -p /home/builder/.cmake/packages/mapserver/

cmake /src \
      -GNinja \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr/local \
      -DWITH_CLIENT_WMS=1 \
      -DWITH_CLIENT_WFS=1 \
      -DWITH_KML=1 \
      -DWITH_SOS=1 \
      -DWITH_XMLMAPFILE=1 \
      -DWITH_POINT_Z_M=1

ccache -M10G
ninja install
ccache -s
