#Docker image for mapserver 5.0

Here is a sample Dockerfile for using it:
```
FROM camptocamp/mapserver
MAINTAINER Camptocamp "info@camptocamp.com"

COPY *.map /etc/mapserver/
COPY *.sh /docker-entrypoint.d/
```

All the executable files in /docker-entrypoint.d ending with `.sh` will
be executed by the default entrypoint.