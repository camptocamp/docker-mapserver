FROM ubuntu:18.04
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

# Be able to install font as nonroot
RUN chmod u+s /usr/bin/fc-cache

EXPOSE 8080

COPY runtime /
COPY target /usr/local/

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
