# Docker image for MapServer

The main Mapfile should be in `/etc/mapserver/`.

You can use the image as is and mount a volume in `/etc/mapserver/` to customize it.

Only tags for minor releases exist, not tag for bug fixes.

If the container is run as root, apache listens on port `80`. If it is run as
another user, it listens on port `8080`.

## Tunings

You can use the following environment variables (when starting the container)
to tune it:

- `MS_DEBUGLEVEL`: The debug level `0`=off `5`=verbose
- `MS_ERRORFILE`: If you want the debug to something other than STDOUT
- `MAX_REQUESTS_PER_PROCESS`: To work around memory leaks (defaults to `1000`)
- `MIN_PROCESSES`: The minimum number of fcgi processes to keep (defaults to `1`)
- `MAX_PROCESSES`: The maximum number of fcgi processes to keep (defaults to `5`)
- `MAPSERVER_CATCH_SEGV`: Set to `1` to have the stacktraces in case of crash
- `BUSY_TIMEOUT`: The maximum time limit for request handling (defaults to `300`)
- `IDLE_TIMEOUT`: Application processes which have not handled a request for
  this period of time will be terminated (defaults to `300`)
- `IO_TIMEOUT`: The maximum period of time the module will wait while trying to
  read from or write to a FastCGI application (defaults to `40`)
- `APACHE_LIMIT_REQUEST_LINE`: The maximum size of the HTTP request line in
  bytes (defaults to `8190`)

## Running multiple Mapfiles

This section is for if you would like to use more than one Mapfile, or use a Mapfile
that isn't `/etc/mapserver/mapserver.map`.

In this example we have two Mapfiles we want to use that both reference data in
different directories. My Mapfiles are `wms.map` and `wfs.map` and are located
in `/mapfiles/` on the host, and the data for these Mapfiles is located in the
host in the directory `/mapdata/wms` and `/mapdata/wfs`.

```bash
docker run -d \
  --restart=unless-stopped \
  --volume=/mapfiles/wms.map/:/etc/mapserver/wms.map:ro \
  --volume=/mapfiles/wfs.map/:/etc/mapserver/wfs.map:ro \
  --volume=/mapdata/wms/:/mapdata/wms/:ro \
  --volume=/mapdata/wfs/:/mapdata/wfs/:ro \
  camptocamp/mapserver
```

For accessing maps for the WFS service add `map=/etc/mapserver/wfs.map` to
your query string. Here is the URL for a `GetCapabilities` request:

`http://your.mapserver.host/?map=/etc/mapserver/wfs.map&service=WFS&request=GetCapabilities`

Similarly, for accessing maps for the WMS service add `map=/etc/mapserver/wms.map` to
your query string.

## Changelog

### 8.0

- `confd` and `entrypoints.d` are removed, you should replace it by a `volume_from` a configuration image
  or an init container.
- The `MS_MAPFILE` has no more default value, was `/etc/mapserver/mapserver.map`.

## Contributing

Install the pre-commit hooks:

```bash
pip install pre-commit
pre-commit install --allow-missing-config
```
