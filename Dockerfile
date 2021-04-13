FROM ubuntu:18.04 as builder
LABEL maintainer="info@camptocamp.com"

RUN apt-get update && \
    LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -y bison flex python-lxml libfribidi-dev swig \
        cmake librsvg2-dev colordiff libpq-dev libpng-dev libjpeg-dev libgif-dev libgeos-dev libgd-dev \
        libfreetype6-dev libfcgi-dev libcurl4-gnutls-dev libcairo2-dev libgdal-dev libproj-dev libxml2-dev \
        libxslt1-dev python-dev php-dev libexempi-dev lcov lftp libgdal-dev ninja-build git curl \
        clang libprotobuf-c-dev protobuf-c-compiler libharfbuzz-dev libcairo2-dev librsvg2-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ARG MAPSERVER_BRANCH
ARG MAPSERVER_REPO=https://github.com/mapserver/mapserver

RUN git clone ${MAPSERVER_REPO} --branch=${MAPSERVER_BRANCH} --depth=100 /src

COPY checkout_release /tmp
RUN cd /src; /tmp/checkout_release ${MAPSERVER_BRANCH}

WORKDIR /src/build
RUN cmake .. \
      -GNinja \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr/local \
      -DWITH_CLIENT_WMS=1 \
      -DWITH_CLIENT_WFS=1 \
      -DWITH_KML=1 \
      -DWITH_SOS=1 \
      -DWITH_XMLMAPFILE=1 \
      -DWITH_POINT_Z_M=1 \
      -DWITH_CAIRO=1 \
      -DWITH_RSVG=1

RUN ninja install


FROM ubuntu:18.04 as runner
LABEL maintainer="info@camptocamp.com"

# let's copy a few of the settings from /etc/init.d/apache2
ENV APACHE_CONFDIR=/etc/apache2 \
    APACHE_ENVVARS=/etc/apache2/envvars \
# and then a few more from $APACHE_CONFDIR/envvars itself
    APACHE_RUN_USER=www-data \
    APACHE_RUN_GROUP=www-data \
    APACHE_RUN_DIR=/var/run/apache2 \
    APACHE_PID_FILE=/var/run/apache2/apache2.pid \
    APACHE_LOCK_DIR=/var/lock/apache2 \
    APACHE_LOG_DIR=/var/log/apache2 \
    LANG=C \
    TERM=linux \
    MS_MAPFILE=/etc/mapserver/mapserver.map \
    MS_MAP_PATTERN=^\/etc\/mapserver\/[^\.][_A-Za-z0-9\-\.]+\/{1})*([_A-Za-z0-9\-\.]+\.map$

RUN apt-get update && \
    apt-get install --assume-yes --no-install-recommends ca-certificates apache2 libapache2-mod-fcgid curl \
        libfribidi0 librsvg2-2 libpq5 libpng16-16 libjpeg8 libgif7 libgeos-c1v5 libfcgi0ldbl libgdal20 \
        libxslt1.1 libprotobuf-c1 libcap2-bin && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    echo 'Allow apache2 to bind to port <1024 for any user' && \
    curl -L https://github.com/kelseyhightower/confd/releases/download/v0.14.0/confd-0.14.0-linux-amd64 > /bin/confd && \
    setcap cap_net_bind_service=+ep /usr/sbin/apache2 && \
    apt-get --purge autoremove -y curl libcap2-bin

RUN a2enmod fcgid headers status && \
    a2dismod -f auth_basic authn_file authn_core authz_user autoindex dir && \
    rm /etc/apache2/mods-enabled/alias.conf && \
    mkdir --parent ${APACHE_RUN_DIR} ${APACHE_LOCK_DIR} ${APACHE_LOG_DIR} /etc/confd/templates/ /etc/mapserver /etc/confd/conf.d && \
    find "$APACHE_CONFDIR" -type f -exec sed -ri ' \
       s!^(\s*CustomLog)\s+\S+!\1 /proc/self/fd/1!g; \
       s!^(\s*ErrorLog)\s+\S+!\1 /proc/self/fd/2!g; \
       ' '{}' ';' && \
    sed -ri 's!LogFormat "(.*)" combined!LogFormat "%{us}T %{X-Request-Id}i \1" combined!g' /etc/apache2/apache2.conf && \
    echo 'ErrorLogFormat "%{X-Request-Id}i [%l] [pid %P] %M"' >> /etc/apache2/apache2.conf && \
    chmod a+rx /bin/confd && \
    mkdir --parent /etc/confd/conf.d /etc/confd/templates /etc/mapserver /docker-entrypoint.d

EXPOSE 8080

COPY --from=builder /usr/local/bin /usr/local/bin/
COPY --from=builder /usr/local/lib /usr/local/lib/
COPY runtime /

ENV MS_DEBUGLEVEL=0 \
    MS_ERRORFILE=stderr \
    MAX_REQUESTS_PER_PROCESS=1000 \
    MIN_PROCESSES=1 \
    MAX_PROCESSES=5 \
    BUSY_TIMEOUT=300 \
    IDLE_TIMEOUT=300 \
    IO_TIMEOUT=40

RUN adduser www-data root && \
    chmod -R g+w ${APACHE_CONFDIR} ${APACHE_RUN_DIR} ${APACHE_LOCK_DIR} ${APACHE_LOG_DIR} /etc/confd /etc/mapserver /var/lib/apache2/fcgid /var/log && \
    chgrp -R root ${APACHE_LOG_DIR} /var/lib/apache2/fcgid

ENTRYPOINT ["/docker-entrypoint"]

CMD ["/usr/local/bin/start-server"]
