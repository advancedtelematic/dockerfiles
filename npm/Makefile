.PHONY: build push
.DEFAULT_GOAL := build

REPOSITORY=advancedtelematic/npm
VERSION=10.1

build:
	docker build -t $(REPOSITORY):$(VERSION) .

push: build
	docker push $(REPOSITORY):$(VERSION)
