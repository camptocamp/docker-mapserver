#!/bin/bash
set -e

# save the environment to be able to restore it in the FCGI daemon (used
# in /usr/local/bin/qgis_mapsev_wrapper)
env | sed -e 's/^/export /' > /tmp/init_env.sh

if [[ "${UID}" != 0 ]]
then
    echo "Switching listen port to 8080"
    cd /tmp
    sed -i -e 's/<VirtualHost \*:80>/<VirtualHost *:8080>/' /etc/apache2/sites-available/000-default.conf
    sed -i -e 's/Listen 80/Listen 8080/' /etc/apache2/ports.conf
fi

exec apache2 -DFOREGROUND
