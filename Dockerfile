FROM debian:jessie

# let's copy a few of the settings from /etc/init.d/apache2
ENV APACHE_CONFDIR /etc/apache2
ENV APACHE_ENVVARS $APACHE_CONFDIR/envvars
# and then a few more from $APACHE_CONFDIR/envvars itself
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_PID_FILE $APACHE_RUN_DIR/apache2.pid
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_LOG_DIR /var/log/apache2
ENV LANG C

ENV MAPSERVER_VERSION 7.0.*


RUN echo "deb http://http.debian.net/debian jessie-backports main" > /etc/apt/sources.list.d/backports.list \
  && apt-get update \
  && apt-get install -y apache2 cgi-mapserver=$MAPSERVER_VERSION libapache2-mod-fcgid curl \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && a2enmod fcgid headers \
  && a2dismod -f auth_basic authn_file authn_core authz_host authz_user autoindex dir status \
  && rm /etc/apache2/mods-enabled/alias.conf \
  && mkdir -p $APACHE_RUN_DIR $APACHE_LOCK_DIR $APACHE_LOG_DIR \
  && find "$APACHE_CONFDIR" -type f -exec sed -ri ' \
       s!^(\s*CustomLog)\s+\S+!\1 /proc/self/fd/1!g; \
       s!^(\s*ErrorLog)\s+\S+!\1 /proc/self/fd/2!g; \
       ' '{}' ';' \
  && curl -L https://github.com/kelseyhightower/confd/releases/download/v0.12.0-alpha3/confd-0.12.0-alpha3-linux-amd64 > /bin/confd \
  && apt-get --purge autoremove -y curl \
  && chmod a+rx /bin/confd \
  && mkdir -p /etc/confd/conf.d /etc/confd/templates /etc/mapserver /docker-entrypoint.d

EXPOSE 80

COPY . /

ENV MS_DEBUGLEVEL 0
ENV MS_ERRORFILE stderr
ENV MAX_REQUESTS_PER_PROCESS 1000

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["apache2", "-DFOREGROUND"]
