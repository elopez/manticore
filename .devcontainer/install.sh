#!/usr/bin/bash

#install cvc4
sudo wget -O /usr/bin/cvc4 https://github.com/CVC4/CVC4/releases/download/1.7/cvc4-1.7-x86_64-linux-opt
sudo chmod +x /usr/bin/cvc4
cvc4 --version
#install yices
sudo wget -O yices.tar.gz https://yices.csl.sri.com/releases/2.6.2/yices-2.6.2-x86_64-pc-linux-gnu-static-gmp.tar.gz
sudo tar -xzf yices.tar.gz
cd yices-2.6.2
sudo ./install-yices
yices --version
#install boolector
mkdir -p /tmp/build
cd /tmp/build
git clone https://github.com/boolector/boolector.git
cd boolector
# Version 3.2.1
git checkout "f61c0dcf4a76e2f7766a6358bfb9c16ca8217224"
git log -1 --oneline > ../boolector.commit
./contrib/setup-lingeling.sh
./contrib/setup-btor2tools.sh
./configure.sh
cd build
make -j4
mkdir -p /tmp/boolector
sudo make DESTDIR=/usr install
# Install solc unconditionally because it only takes a second or two
sudo wget -O /usr/bin/solc https://github.com/ethereum/solidity/releases/download/v0.4.24/solc-static-linux
sudo chmod +x /usr/bin/solc