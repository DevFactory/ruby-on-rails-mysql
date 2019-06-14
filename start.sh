#!/bin/bash

# Set the right Rake version
bundle install

# Start the database
/etc/init.d/mysql start

# Setup the database if not already setup
mysql < database_backup.sql

# Start the server
rails server -e development
