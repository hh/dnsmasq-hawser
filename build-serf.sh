#!/bin/bash
set -x
set -e
cd /go/src
git clone https://github.com/hashicorp/serf.git
cd serf
git checkout v0.6.3
make
CGO_ENABLED=0 GOOS=linux go build -a -tags netgo -ldflags "-w" -v -o /out/serf
strip /out/serf
