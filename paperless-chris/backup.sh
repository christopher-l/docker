#!/usr/bin/env bash

set -e

case $1 in
    backup)
        docker compose exec webserver document_exporter ../export -d --data-only
        ;;
    restore)
        docker compose exec webserver document_importer ../export --data-only
        ;;
    restore_online)
        true
        ;;
    *)
        echo invalid command: $1
        exit 1
esac
