DOCKER_TAG ?= latest
export DOCKER_TAG
MAPSERVER_BRANCH ?= main
WITH_ORACLE ?= OFF
DOCKER_IMAGE = camptocamp/mapserver
ROOT = $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
GID = $(shell id -g)
UID = $(shell id -u)

all: acceptance

.PHONY: pull
pull:
	for image in `find -name Dockerfile | xargs grep --no-filename ^FROM | awk '{print $$2}'`; do docker pull $$image; done

.PHONY: build
build:
	docker build --tag=$(DOCKER_IMAGE):$(DOCKER_TAG) --target=runner --build-arg=MAPSERVER_BRANCH=$(MAPSERVER_BRANCH) --build-arg=WITH_ORACLE=$(WITH_ORACLE) .

.PHONY: acceptance
acceptance: build
	(cd acceptance_tests/ && docker-compose down)
	(cd acceptance_tests/ && docker-compose build)
	(cd acceptance_tests/ && docker-compose up -d)
	(cd acceptance_tests/ && docker-compose exec -T acceptance py.test -vv --color=yes --junitxml /tmp/junitxml/results.xml)
	(cd acceptance_tests/ && docker-compose down)

.PHONY: run
run: build
	(cd acceptance_tests; docker-compose up)
