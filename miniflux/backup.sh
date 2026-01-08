#!/usr/bin/env bash

set -e

source .env

docker-compose exec -i db /bin/bash -c \
    "PGPASSWORD=$DB_PASSWORD pg_dump --username $DB_USER $DB_DATABASE" > dump.sql

# Restore with
# source .env
# docker-compose exec -T db /bin/bash -c \
#     "PGPASSWORD=$DB_PASSWORD psql --username $DB_USER $DB_DATABASE" < dump.sql
