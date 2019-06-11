#!/bin/bash

MYSQL_DATA_DIR=/data/.mysql_data

if [ ! -d ${MYSQL_DATA_DIR} ]; then
  rsync -av /var/lib/mysql/ ${MYSQL_DATA_DIR}
fi

/etc/init.d/mysql start
mysql < /tmp/open-remote-connections.sql

exec "$@"
