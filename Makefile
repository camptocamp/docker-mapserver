DOCKER_TAG ?= latest
export DOCKER_TAG
MAPSERVER_BRANCH ?= branch-7-6
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

DOCKER_COMPOSE_VERSION = 1.29.2

all: acceptance

.PHONY: pull
pull:
	for image in `find -name Dockerfile | xargs grep --no-filename ^FROM | awk '{print $$2}'`; do docker pull $$image; done

.PHONY: build
build:
	docker build --tag=$(DOCKER_IMAGE):$(DOCKER_TAG) --target=runner --build-arg=MAPSERVER_BRANCH=$(MAPSERVER_BRANCH) .

.PHONY: acceptance
acceptance: build
	(cd acceptance_tests/ && docker compose up -d)
	(cd acceptance_tests/ && docker compose exec -T acceptance bash -c 'cd /acceptance_tests ; py.test -vv --color=yes --junitxml /tmp/junitxml/results.xml')
	(cd acceptance_tests/ && docker compose down)

.PHONY: clean
clean:
	rm -rf acceptance_tests/junitxml/
