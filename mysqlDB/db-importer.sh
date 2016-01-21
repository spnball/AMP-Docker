#!/bin/bash

set -e
if [ -z "$1" ]; then
	echo >&2 'error: database is uninitialized and password option is not specified '
	echo >&2 '  You need to specify one of MYSQL_ROOT_PASSWORD, MYSQL_ALLOW_EMPTY_PASSWORD and MYSQL_RANDOM_ROOT_PASSWORD'
	exit 1
fi

sleep 1

# Waiting for until mysql is started
while true
do
    UP=$(mysql --host="127.0.0.1" --user="root" --password="$MYSQL_ROOT_PASSWORD" \
    -e "show databases;" 2>/dev/null | grep information_schema | wc -l
);
    if [ "$UP" -ne 0 ];
    then
        echo `date +%Y-%m-%d:%H:%M:%S` "Start checking data import.";
        break;
    else
        echo `date +%Y-%m-%d:%H:%M:%S` "Waiting for mysql starting up.";
    fi
    sleep 1
done

echo `date +%Y-%m-%d:%H:%M:%S` "Start initialize mysql data."

import_database () {
    DATABASE=$1;
    echo `date +%Y-%m-%d:%H:%M:%S` "Checking '$DATABASE' database."
    DB_EXISTS=$(mysql --host="127.0.0.1" --user="root" --password="$MYSQL_ROOT_PASSWORD"  \
                -e "show databases;" 2>/dev/null | grep "^$DATABASE$" | wc -l);
    if [ "$DB_EXISTS" -ne 0 ];
    then
        echo `date +%Y-%m-%d:%H:%M:%S` "$DATABASE already exists.";
    else
        echo `date +%Y-%m-%d:%H:%M:%S` "Prepare importing $DATABASE";
        
        sftp -o "StrictHostKeyChecking no" -i /root/.ssh/id_rsa "$DEV_SSH_HOST":/tmp/acommerce.sql.tar.gz /tmp
        
        tar -xzf /tmp/acommerce.sql.tar.gz /tmp/
    fi
}

import_database "acommerce"
