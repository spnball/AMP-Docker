#!/bin/bash

set -e

/db-importer.sh "$@" &

# first things first, call the MySQL image provided entrypoint script
# "$@" is to pass all parameters as they are provided
/entrypoint.sh mysqld 



