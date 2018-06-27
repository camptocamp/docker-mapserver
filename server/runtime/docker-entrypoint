#!/bin/bash
set -e

#Run entry point scripts if any
DIR=/docker-entrypoint.d
if [[ -d "$DIR" ]]
then
    for env_file in `/bin/run-parts --list --regex '\.env$' "$DIR"`
    do
        . "$env_file"
    done
    /bin/run-parts --regex '\.sh$' "$DIR"
fi

#Scan for files that are managed by confd
CONFD_DIRS=${CONFD_DIRS:-"/etc/apache2 /etc/mapserver"}
find $CONFD_DIRS -name "*.tmpl" | while read template
do
  dest="${template%.tmpl}"
  mangled="${dest//\//_}"   # replace slashes by underscores
  newTemplate="${mangled}.toml"
  toml=/etc/confd/conf.d/${mangled}.toml
  mv "${template}" "/etc/confd/templates/${newTemplate}"
  echo "[template]" > "$toml"
  echo "src = \"$newTemplate\"" >> "$toml"
  echo "dest = \"$dest\"" >> "$toml"
  echo "keys = []" >> "$toml"
done

/bin/confd -onetime -backend env

rm -f $APACHE_RUN_DIR/apache2.pid

exec "$@"
