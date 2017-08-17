FROM ubuntu:17.04
MAINTAINER Camptocamp<info@camptocamp.com>

RUN apt-get -y update && \
    LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -y bison flex python-lxml libfribidi-dev swig cmake librsvg2-dev colordiff libpq-dev libpng-dev libjpeg-dev libgif-dev libgeos-dev libgd2-xpm-dev libfreetype6-dev libfcgi-dev libcurl4-gnutls-dev libcairo2-dev libgdal-dev libproj-dev libxml2-dev python-dev php-dev libexempi-dev lcov lftp libgdal-dev ninja-build git curl ccache clang

RUN curl -L "https://github.com/tianon/gosu/releases/download/1.10/gosu-amd64" > /usr/bin/gosu && \
    chmod a+x /usr/bin/gosu

COPY . /

ENTRYPOINT ["/entry.sh"]
CMD ["/build.sh"]
