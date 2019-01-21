.PHONY: build push
.DEFAULT_GOAL := build

REPOSITORY=advancedtelematic/npm
VERSION=0.1.1-webpack

build:
	docker build -t $(REPOSITORY):$(VERSION) .

push: build
	docker push $(REPOSITORY):$(VERSION)
