#!/bin/bash
set -x
set -e
cd /tmp
# no wget or curl... just use bash
apt-get update
apt-get install scons
git clone https://github.com/mongodb/mongo.git
cd mongo
git checkout r2.7.8
# maybe check for cpus to set -j X ?
scons --release --static --ssl
cp build/linux2/release/mongo/mongod /out
strip /out/dnsmasq
