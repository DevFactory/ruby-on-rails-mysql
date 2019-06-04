#!/bin/bash

/etc/init.d/mysql start
mysql < /tmp/open-remote-connections.sql

# Start code-server
/opt/code-server-linux/code-server --no-auth /data

exec "$@"
