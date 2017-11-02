BRANCH ?= master
DOCKER_TAG ?= latest

.PHONY: help build
.DEFAULT_GOAL := help

help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%10s\033[0m : %s\n", $$1, $$2}' $(MAKEFILE_LIST)

build: ## Build ostree inside docker
	@docker build --build-arg branch=$(BRANCH) --tag advancedtelematic/ostree:$(DOCKER_TAG) .

start: build ## Start an ostree docker image
	@docker run --interactive --tty --rm advancedtelematic/ostree:$(DOCKER_TAG)
