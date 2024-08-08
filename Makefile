DOCKER_TAG ?= latest
export DOCKER_TAG
MAPSERVER_BRANCH ?= branch-8-0
WITH_ORACLE ?= OFF
DOCKER_IMAGE ?= camptocamp/mapserver
ROOT = $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
GID = $(shell id -g)
UID = $(shell id -u)
export DOCKER_BUILDKIT = 1

.PHONY: help
help: ## Display this help message
	@echo "Usage: make <target>"
	@echo
	@echo "Available targets:"
	@grep --extended-regexp --no-filename '^[a-zA-Z_-]+:.*## ' $(MAKEFILE_LIST) | sort | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "	%-20s%s\n", $$1, $$2}'

all: acceptance

.PHONY: build
build: ## Build the Docker image
	docker $(DOCKER_BUILDX) build $(DOCKER_BUILD_ARGS) --tag=$(DOCKER_IMAGE):$(DOCKER_TAG) --target=runner --build-arg=MAPSERVER_BRANCH=$(MAPSERVER_BRANCH) --build-arg=WITH_ORACLE=$(WITH_ORACLE) .

.PHONY: build-no-cache
build-no-cache: ## Build the Docker image (no cache)
	docker $(DOCKER_BUILDX) build --no-cache $(DOCKER_BUILD_ARGS) --tag=$(DOCKER_IMAGE):$(DOCKER_TAG) --target=runner --build-arg=MAPSERVER_BRANCH=$(MAPSERVER_BRANCH) --build-arg=WITH_ORACLE=$(WITH_ORACLE) .

.PHONY: acceptance
acceptance: build ## Run the acceptance tests
	(cd acceptance_tests/ && docker compose down)
	(cd acceptance_tests/ && docker compose build)
	(cd acceptance_tests/ && docker compose up -d)
	(cd acceptance_tests/ && docker compose exec -T acceptance py.test -vv --color=yes --junitxml /tmp/junitxml/results.xml)
	(cd acceptance_tests/ && docker compose down)

.PHONY: run
run: build
	(cd acceptance_tests; docker compose up -d)
