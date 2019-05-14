DHALL_RELEASE := 1.22.0

build:
	docker build -t advancedtelematic/dhall:$(DHALL_RELEASE) .

run:
	docker run -it advancedtelematic/dhall:$(DHALL_RELEASE) sh

push: build
	docker push advancedtelematic/dhall:$(DHALL_RELEASE)
