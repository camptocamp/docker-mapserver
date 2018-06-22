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
    LANG=C

RUN apt-get update && \
    apt-get install -y apache2 libapache2-mod-fcgid curl libfribidi0 librsvg2-2 libpq5 libpng16-16 libjpeg8 libgif7 libgeos-c1v5 libfcgi0ldbl libgdal20 libxslt1.1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    a2enmod fcgid headers && \
    a2dismod -f auth_basic authn_file authn_core authz_host authz_user autoindex dir status && \
    rm /etc/apache2/mods-enabled/alias.conf && \
    mkdir -p $APACHE_RUN_DIR $APACHE_LOCK_DIR $APACHE_LOG_DIR && \
    find "$APACHE_CONFDIR" -type f -exec sed -ri ' \
       s!^(\s*CustomLog)\s+\S+!\1 /proc/self/fd/1!g; \
       s!^(\s*ErrorLog)\s+\S+!\1 /proc/self/fd/2!g; \
       ' '{}' ';' && \
    curl -L https://github.com/kelseyhightower/confd/releases/download/v0.14.0/confd-0.14.0-linux-amd64 > /bin/confd && \
    apt-get --purge autoremove -y curl && \
    chmod a+rx /bin/confd  && \
    mkdir -p /etc/confd/conf.d /etc/confd/templates /etc/mapserver /docker-entrypoint.d && \
    adduser www-data root && \
    chmod -R g+w /etc/apache2 /var/run/apache2 /var/lock/apache2 /var/log/apache2

EXPOSE 80

COPY runtime /
COPY target /usr/local/

ENV MS_DEBUGLEVEL=0 \
    MS_ERRORFILE=stderr \
    MAX_REQUESTS_PER_PROCESS=1000

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/usr/local/bin/start-server.sh"]
