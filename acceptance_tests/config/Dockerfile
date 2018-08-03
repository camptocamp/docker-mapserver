FROM ubuntu:18.04

COPY mapserver /etc/mapserver
COPY db /docker-entrypoint-initdb.d

RUN chmod -R g+w /etc/mapserver

VOLUME /etc/mapserver
VOLUME /docker-entrypoint-initdb.d
