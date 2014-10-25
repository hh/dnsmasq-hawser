#!/bin/bash
cd /go/src
git clone https://github.com/hashicorp/serf.git
cd serf
git checkout v0.6.3
make
cp bin/serf /out
