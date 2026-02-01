#!/usr/bin/env bash

set -e

cd "$1"

echo "Creating backup..."
./backup.sh backup
echo "Stopping services..."
docker compose down --volumes
echo "Backing up original state..."
rsync -a --delete ./ "$HOME/Docker.bak/$1/"
echo "Clearing data directory..."
rm -r data
mkdir data
if ./backup.sh restore_online; then
    echo "Starting service $(./backup.sh restore_online)..."
    docker compose up -d --wait $(./backup.sh restore_online)
fi
echo "Restoring backup..."
./backup.sh restore
echo "Starting services..."
docker compose up -d --wait
