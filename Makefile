DOCKER_CMD ?= docker
IMAGE_NAME ?= localhost/docker-test
DOCKER_NET = host

default: lint run
.PHONY: default

lint:
	@hadolint Dockerfile
	@shellcheck ./*.sh
.PHONY: lint

pull:
	@"${DOCKER_CMD}" pull "docker.io/library/ubuntu:22.04"
.PHONY: pull

build:
	@"${DOCKER_CMD}" build . --tag "${IMAGE_NAME}"
.PHONY: build

update: pull build
.PHONY: update

run: build
	@"${DOCKER_CMD}" run --interactive --tty \
		--rm \
		--network "${DOCKER_NET}" \
		--cap-add NET_ADMIN \
		"${IMAGE_NAME}"
.PHONY: run
