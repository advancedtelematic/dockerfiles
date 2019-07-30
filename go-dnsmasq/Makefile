VERSION := 1.0.7

build:
	docker build . -t advancedtelematic/go-dnsmasq:$(VERSION)

push: build
	docker push advancedtelematic/go-dnsmasq:$(VERSION)

.PHONY: build push