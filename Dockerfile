FROM osgeo/gdal:ubuntu-small-3.5.1 as builder
LABEL maintainer Camptocamp "info@camptocamp.com"
SHELL ["/bin/bash", "-o", "pipefail", "-cux"]

RUN --mount=type=cache,target=/var/cache,sharing=locked \
    --mount=type=cache,target=/root/.cache \
    apt-get update \
    && apt-get upgrade --assume-yes \
    && LC_ALL=C apt-get install --assume-yes --no-install-recommends bison \
        flex python-lxml libfribidi-dev swig \
        cmake librsvg2-dev colordiff libpq-dev libpng-dev libjpeg-dev libgif-dev libgeos-dev libgd-dev \
        libfreetype6-dev libfcgi-dev libcurl4-gnutls-dev libcairo2-dev libxml2-dev \
        libxslt1-dev python-dev php-dev libexempi-dev lcov lftp ninja-build git curl \
        clang libprotobuf-c-dev protobuf-c-compiler libharfbuzz-dev libcairo2-dev librsvg2-dev \
    && ln -s /usr/local/lib/libproj.so.* /usr/local/lib/libproj.so

ARG MAPSERVER_BRANCH
ARG MAPSERVER_REPO=https://github.com/mapserver/mapserver

RUN git clone ${MAPSERVER_REPO} --branch=${MAPSERVER_BRANCH} --depth=100 /src

COPY checkout_release /tmp
RUN cd /src \
    && /tmp/checkout_release ${MAPSERVER_BRANCH}

COPY instantclient /tmp/instantclient

ARG WITH_ORACLE=OFF

RUN --mount=type=cache,target=/var/cache,sharing=locked \
    --mount=type=cache,target=/root/.cache \
    (if test "${WITH_ORACLE}" = "ON"; then \
       apt-get update && \
       LC_ALL=C apt-get install --assume-yes --no-install-recommends \
       libarchive-tools libaio-dev && \
       mkdir -p /usr/local/lib && \
       cd /usr/local/lib && \
       (for i in /tmp/instantclient/*.zip; do bsdtar --strip-components=1 -xvf "$i"; done) && \
       ln -s libnnz19.so /usr/local/lib/libnnz18.so; \
     fi )

WORKDIR /src/build
RUN if test "${WITH_ORACLE}" = "ON"; then \
      export ORACLE_HOME=/usr/local/lib; \
    fi; \
    cmake .. \
    -GNinja \
    -DCMAKE_C_FLAGS="-O2 -DPROJ_RENAME_SYMBOLS" \
    -DCMAKE_CXX_FLAGS="-O2 -DPROJ_RENAME_SYMBOLS" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr/local \
    -DWITH_CLIENT_WMS=1 \
    -DWITH_CLIENT_WFS=1 \
    -DWITH_OGCAPI=1 \
    -DWITH_KML=1 \
    -DWITH_SOS=1 \
    -DWITH_XMLMAPFILE=1 \
    -DWITH_POINT_Z_M=1 \
    -DWITH_CAIRO=1 \
    -DWITH_RSVG=1 \
    -DUSE_PROJ=1 \
    -DUSE_WFS_SVR=1 \
    -DUSE_OGCAPI_SVR=1 \
    -DWITH_ORACLESPATIAL=${WITH_ORACLE}

RUN ninja install \
    && if test "${WITH_ORACLE}" = "ON"; then rm -rf /usr/local/lib/sdk; fi

FROM osgeo/gdal:ubuntu-small-3.5.1 as runner
LABEL maintainer Camptocamp "info@camptocamp.com"
SHELL ["/bin/bash", "-o", "pipefail", "-cux"]

# Let's copy a few of the settings from /etc/init.d/apache2
ENV APACHE_CONFDIR=/etc/apache2 \
    APACHE_ENVVARS=/etc/apache2/envvars \
    # And then a few more from $APACHE_CONFDIR/envvars itself
    APACHE_RUN_USER=www-data \
    APACHE_RUN_GROUP=www-data \
    APACHE_RUN_DIR=/var/run/apache2 \
    APACHE_PID_FILE=/var/run/apache2/apache2.pid \
    APACHE_LOCK_DIR=/var/lock/apache2 \
    APACHE_LOG_DIR=/var/log/apache2 \
    LANG=C \
    TERM=linux \
    MS_MAP_PATTERN=^\\/etc\\/mapserver\\/([^\\.][-_A-Za-z0-9\\.]+\\/{1})*([-_A-Za-z0-9\\.]+\\.map)$

RUN --mount=type=cache,target=/var/cache,sharing=locked \
    --mount=type=cache,target=/root/.cache \
    apt-get update \
    && apt-get upgrade --assume-yes \
    && apt-get install --assume-yes --no-install-recommends ca-certificates apache2 libapache2-mod-fcgid curl \
        libfribidi0 librsvg2-2 libpng16-16 libgif7 libfcgi0ldbl \
        libxslt1.1 libprotobuf-c1 libcap2-bin libaio1 \
    && echo 'Allow apache2 to bind to port <1024 for any user' \
    && setcap cap_net_bind_service=+ep /usr/sbin/apache2 \
    && apt-get --purge autoremove --yes curl libcap2-bin

RUN a2enmod fcgid headers status \
    && a2dismod -f auth_basic authn_file authn_core authz_user autoindex dir \
    && rm /etc/apache2/mods-enabled/alias.conf \
    && mkdir --parent ${APACHE_RUN_DIR} ${APACHE_LOCK_DIR} ${APACHE_LOG_DIR} /etc/mapserver \
    && find "$APACHE_CONFDIR" -type f -exec sed -ri ' \
    s!^(\s*CustomLog)\s+\S+!\1 /proc/self/fd/1!g; \
    s!^(\s*ErrorLog)\s+\S+!\1 /proc/self/fd/2!g; \
    ' '{}' ';' \
    && sed -ri 's!LogFormat "(.*)" combined!LogFormat "%{us}T %{X-Request-Id}i \1" combined!g' /etc/apache2/apache2.conf \
    && echo 'ErrorLogFormat "%{X-Request-Id}i [%l] [pid %P] %M"' >> /etc/apache2/apache2.conf \
    && mkdir --parent /etc/mapserver

EXPOSE 8080

COPY --from=builder /usr/local/bin /usr/local/bin/
COPY --from=builder /usr/local/lib /usr/local/lib/
COPY --from=builder /usr/local/share/mapserver /usr/local/share/mapserver/
COPY --from=builder /src/share/ogcapi/templates/html-bootstrap4 /usr/local/share/mapserver/ogcapi/templates/html-bootstrap4/

COPY runtime /

RUN ldconfig

ENV MS_DEBUGLEVEL=0 \
    MS_ERRORFILE=stderr \
    MAPSERVER_CONFIG_FILE=/etc/mapserver.conf \
    MAX_REQUESTS_PER_PROCESS=1000 \
    MIN_PROCESSES=1 \
    MAX_PROCESSES=5 \
    BUSY_TIMEOUT=300 \
    IDLE_TIMEOUT=300 \
    IO_TIMEOUT=40 \
    GET_ENV=env

RUN adduser www-data root \
    && chmod -R g+w ${APACHE_CONFDIR} ${APACHE_RUN_DIR} ${APACHE_LOCK_DIR} ${APACHE_LOG_DIR} /etc/mapserver /var/lib/apache2/fcgid /var/log \
    && chgrp -R root ${APACHE_LOG_DIR} /var/lib/apache2/fcgid

CMD ["/usr/local/bin/start-server"]

WORKDIR /etc/mapserver
