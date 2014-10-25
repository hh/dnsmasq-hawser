all: dnsmasq serf
# bulding a static binary
dnsmasq: build-dnsmasq.sh
	docker run -rm -v $(PWD):/out -e CC=gcc gcc:4.9 /bin/bash /out/build-dnsmasq.sh

# Build serf from source... trying to make it static, but I'm failing
serf: build-serf.sh
	docker run -t -v $(PWD):/out golang:1.3.3 /bin/bash /out/build-serf.sh

# The prebuilt needs a C library
serfer: dnsmasq
	wget -qO- http://dl.bintray.com/mitchellh/serf/0.6.3_linux_amd64.zip | funzip > serf
clean:
	rm -rf dnsmasq serf
