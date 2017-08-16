DOCKER_TAG ?= latest
MAPSERVER_BRANCH ?= branch-7-0
DOCKER_IMAGE = camptocamp/mapserver
ROOT = $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
GID = $(shell id -g)
UID = $(shell id -u)

#Get the docker version (must use the same version for acceptance tests)
DOCKER_VERSION_ACTUAL = $(shell docker version --format '{{.Server.Version}}')
ifeq ($(DOCKER_VERSION_ACTUAL),)
DOCKER_VERSION = 1.12.0
else
DOCKER_VERSION = $(DOCKER_VERSION_ACTUAL)
endif

#Get the docker-compose version (must use the same version for acceptance tests)
DOCKER_COMPOSE_VERSION_ACTUAL = $(shell docker-compose version --short)
ifeq ($(DOCKER_COMPOSE_VERSION_ACTUAL),)
DOCKER_COMPOSE_VERSION = 1.8.0
else
DOCKER_COMPOSE_VERSION = $(DOCKER_COMPOSE_VERSION_ACTUAL)
endif

all: acceptance

.PHONY: build acceptance build_acceptance_config build_acceptance

pull:
	for image in `find -name Dockerfile | xargs grep --no-filename FROM | awk '{print $$2}'`; do docker pull $$image; done

src:
	git clone https://github.com/mapserver/mapserver src

.PHONY: update-src
update-src: src
	./checkout_release.sh $(MAPSERVER_BRANCH)

.PHONY: build-builder
build-builder:
	docker build --tag $(DOCKER_IMAGE)-builder:$(DOCKER_TAG) builder

.PHONY: build-src
build-src: build-builder update-src
	mkdir -p server/build server/target
	docker run --rm -e UID=$(UID) -e GID=$(GID) --volume $(ROOT)/src:/src --volume $(ROOT)/server/build:/build --volume $(ROOT)/server/target:/usr/local --volume $(HOME)/.ccache:/home/builder/.ccache $(DOCKER_IMAGE)-builder:$(DOCKER_TAG)

.PHONY: run-builder
run-builder: build-builder update-src
	mkdir -p server/build server/target
	docker run -ti --rm -e UID=$(UID) -e GID=$(GID) --volume $(ROOT)/src:/src --volume $(ROOT)/server/build:/build --volume $(ROOT)/server/target:/usr/local --volume $(HOME)/.ccache:/home/builder/.ccache $(DOCKER_IMAGE)-builder:$(DOCKER_TAG) bash

.PHONY: build-server
build-server: build-src
	docker build --tag $(DOCKER_IMAGE):$(DOCKER_TAG) server

build: build-server

build_acceptance_config:
	docker build --tag=$(DOCKER_IMAGE)_acceptance_config:$(DOCKER_TAG) acceptance_tests/config

build_acceptance: build_acceptance_config
	@echo "Docker version: $(DOCKER_VERSION)"
	@echo "Docker-compose version: $(DOCKER_COMPOSE_VERSION)"
	docker build --build-arg DOCKER_VERSION="$(DOCKER_VERSION)" --build-arg DOCKER_COMPOSE_VERSION="$(DOCKER_COMPOSE_VERSION)" -t $(DOCKER_IMAGE)_acceptance:$(DOCKER_TAG) acceptance_tests

acceptance: build_acceptance build
	mkdir -p acceptance_tests/junitxml && touch acceptance_tests/junitxml/results.xml
	docker run --rm -e DOCKER_TAG=$(DOCKER_TAG) -v /var/run/docker.sock:/var/run/docker.sock -v $(ROOT)/acceptance_tests/junitxml:/tmp/junitxml $(DOCKER_IMAGE)_acceptance:$(DOCKER_TAG)

clean:
	rm -rf acceptance_tests/junitxml/ server/build server/target
