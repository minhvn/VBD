#!/bin/bash

#adduser vbd
#usermod -aG sudo vbd
#su vbd

git clone https://github.com/VISCHub/VBD

cd VBD

./autogen.sh

# https://github.com/bitcoin/bitcoin/blob/master/doc/build-unix.md
# ./configure
./configure --disable-wallet --without-gui --without-miniupnpc

make

make install

make clean
