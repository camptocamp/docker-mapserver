FROM tianon/apache2

ENV MAPSERVER_VERSION 7.0.0-1~bpo8+1

RUN echo "deb http://http.debian.net/debian jessie-backports main" > /etc/apt/sources.list.d/backports.list \
  && apt-get update \
  && apt-get install -y cgi-mapserver=$MAPSERVER_VERSION libapache2-mod-fcgid \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && a2enmod fcgid

COPY mapserver.conf /etc/apache2/conf-enabled/
COPY docker-entrypoint.sh /

ONBUILD COPY mapserver.map /etc/mapserver/

ENTRYPOINT ["/docker-entrypoint.sh"]

# A bug in Docker resets the CMD of the parent image if you set the ENTRYPOINT:
#   https://github.com/docker/docker/issues/5147
CMD ["apache2", "-DFOREGROUND"]
