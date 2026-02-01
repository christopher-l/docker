#!/usr/bin/env bash

set -e

source .env

case $1 in
    backup)
        docker-compose exec -i mariadb \
            mariadb-dump -uroot -p$MARIADB_ROOT_PASSWORD --all-databases > dump.sql
        ;;
    restore)
        docker-compose exec -T mariadb \
            mariadb -uroot -p$MARIADB_ROOT_PASSWORD < dump.sql
        ;;
    restore_online)
        echo "mariadb"
        ;;
    *)
        echo invalid command: $1
        exit 1
esac
