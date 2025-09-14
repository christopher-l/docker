#!/usr/bin/env bash

set -e

docker compose exec webserver document_exporter ../export -d --data-only