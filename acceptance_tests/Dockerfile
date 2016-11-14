FROM python:3.5

RUN pip install pytest==3.0.2 requests==2.11.1 netifaces==0.10.5

ARG DOCKER_VERSION=1.12.0
ARG DOCKER_COMPOSE_VERSION=1.8.0

RUN echo "deb http://apt.dockerproject.org/repo debian-jessie main" >> /etc/apt/sources.list && \
    apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D && \
    apt-get update && \
    apt-get install -y docker-engine=${DOCKER_VERSION}* && \
    apt-get clean && \
    rm -r /var/lib/apt/lists/*
RUN curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > /usr/bin/docker-compose && \
    chmod a+x /usr/bin/docker-compose

COPY . /acceptance_tests/

ENV DOCKER_RUN 1
WORKDIR /acceptance_tests
CMD py.test --junitxml /tmp/junitxml/results.xml
