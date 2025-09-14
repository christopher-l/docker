#!/usr/bin/env bash

set -e

source .env

docker-compose exec -i mariadb \
    mariadb-dump -uroot -p$MYSQL_ROOT_PASSWORD --all-databases > dump.sql

# Restore with
# docker-compose exec -T mariadb mysql -uroot -p$MYSQL_ROOT_PASSWORD < dump.sql