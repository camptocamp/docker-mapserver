# Docker image for mapserver 7.4

Here is a sample Dockerfile for using it:

```
FROM camptocamp/mapserver

COPY *.map /etc/mapserver/
COPY *.sh *.env /docker-entrypoint.d/
```

The main mapfile should be `/etc/mapserver/mapserver.map`.

Or you can use the image as is and mount volumes to customize it.

Only tags for minor releases exist, not tag for bug fixes.

If the container is run as root, apache listens on port 80. If it is run as
another user, it listens on port 8080.

## Tunings

All the bash snippets in /docker-entrypoint.d ending with `.env` will
be sourced.

All the executable files in /docker-entrypoint.d ending with `.sh` will
be executed by the default entrypoint.

All the files ending with `.tmpl` in /etc/mapserver and /etc/apache2 (can be
changed by defining CONFD_DIRS in one of the sourced files) will go though
confd with the `env` backend. The TOML files are created automagically to
create a file at the same location, with just the `.tmpl` extension removed.

You can use the following environment variables (when starting the container)
to tune it:

-   MS_DEBUGLEVEL: The debug level 0=off 5=verbose
-   MS_ERRORFILE: If you want the debug to something other than STDOUT
-   MAX_REQUESTS_PER_PROCESS: To work around memory leaks (defaults to 1000)
-   MIN_PROCESSES: The minimum number of fcgi processes to keep (defaults to 1)
-   MAX_PROCESSES: The maximum number of fcgi processes to keep (defaults to 5)
-   MAPSERVER_CATCH_SEGV: Set to 1 to have the stacktraces in case of crash
-   LISTEN_PORT_80: When running the container as an unprivileged user, apache
    will listen to port 8080 instead of 80. Set to 1 force listening to port 80
    instead.
-   BUSY_TIMEOUT: The maximum time limit for request handling (defaults to 300)
-   IDLE_TIMEOUT: Application processes which have not handled a request for
    this period of time will be terminated (defaults to 300)
-   IO_TIMEOUT: The maximum period of time the module will wait while trying to
    read from or write to a FastCGI application (defaults to 40)

Fonts present in the `/etc/mapserver/fonts` directory will be installed and thus usable by mapserver.

## Project version

-   The version 7.0.x will be in the [branch 7.0](https://github.com/camptocamp/docker-mapserver/tree/7.0).
-   The version 7.2.x will be in the [branch 7.2](https://github.com/camptocamp/docker-mapserver/tree/7.2).
-   The version 7.4.x will be in the [branch 7.4](https://github.com/camptocamp/docker-mapserver/tree/7.4).
