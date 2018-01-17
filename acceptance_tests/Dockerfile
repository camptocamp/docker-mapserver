FROM camptocamp/c2cwsgiutils:1

ARG DOCKER_VERSION=1.12.0
ARG DOCKER_COMPOSE_VERSION=1.10.0

RUN DOCKER_VERSION="${DOCKER_VERSION}" \
    DOCKER_COMPOSE_VERSION="${DOCKER_COMPOSE_VERSION}" \
    /opt/c2cwsgiutils/install_docker.sh

COPY . /acceptance_tests/

ENV DOCKER_RUN 1
WORKDIR /acceptance_tests
CMD py.test -vv --color=yes --junitxml /tmp/junitxml/results.xml
