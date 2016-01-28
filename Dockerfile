FROM tianon/apache2

ENV MAPSERVER_VERSION 7.0.0-1~bpo8+1

RUN echo "deb http://http.debian.net/debian jessie-backports main" > /etc/apt/sources.list.d/backports.list \
  && apt-get update \
  && apt-get install -y cgi-mapserver=$MAPSERVER_VERSION libapache2-mod-fcgid \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && a2enmod fcgid

COPY mapserver.conf /etc/apache2/conf-enabled/

ONBUILD COPY mapserver.map /etc/mapserver/
