#!/usr/bin/env bash

set -e

source .env

case $1 in
    backup)
        sudo docker compose exec -i db /bin/bash -c \
            "PGPASSWORD=$DB_PASSWORD pg_dump --username hedgedoc hedgedoc" > backup/dump.sql
        ;;
    restore)
        sudo docker compose exec -T db /bin/bash -c \
            "PGPASSWORD=$DB_PASSWORD psql --username hedgedoc hedgedoc" < backup/dump.sql
        ;;
    restore_online)
        echo "db"
        ;;
    *)
        echo invalid command: $1
        exit 1
esac
