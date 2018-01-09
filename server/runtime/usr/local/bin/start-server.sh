#!/bin/bash
set -e

# save the environment to be able to restore it in the FCGI daemon (used
# in /usr/local/bin/qgis_mapsev_wrapper)
env | sed -e 's/^/export /' > /tmp/init_env.sh

exec apache2 -DFOREGROUND
