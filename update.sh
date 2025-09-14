#!/usr/bin/env bash

set -e

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )"

echo "Pruning docker..."
docker system prune --all --volumes --force

exclude=(
    upload-share/
)

for d in */ ; do
    echo ""
    if [[ ${exclude[@]} =~ $d ]]; then
        echo "Skipping $d"
        continue
    fi
    echo "Entering $d"
    (
        cd $d
        echo "Creating backup..."
        ./backup.sh
        echo "Pulling images..."
        docker compose pull
        echo "Updating service..."
        docker compose up -d
    )
    echo "done"
done