FROM tianon/true

COPY mapserver /etc/mapserver
COPY db /docker-entrypoint-initdb.d

VOLUME /etc/mapserver
VOLUME /docker-entrypoint-initdb.d
