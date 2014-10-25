#!/bin/bash
cd /tmp
exec 5<>/dev/tcp/www.thekelleys.org.uk/80
echo -e "GET /dnsmasq/dnsmasq-2.72.tar.gz" >&5
tar xvfz - <&5
ls -la
cd dnsmasq-2.72
sed -i 's/^LDFLAGS.*/LDFLAGS = -static -static-libgcc/' Makefile
make
strip src/dnsmasq
cp src/dnsmasq /out
