#!/usr/bin/env bash

set -e

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )"

for d in */ ; do
    (
        echo Backing up $d...
        cd $d
        ./backup.sh
    )
done

echo Copying data...
rsync . -a \
    --exclude='miniflux/db/*' \
    --exclude='hedgedoc/mariadb/*' \
    --exclude='paperless-kana/data/*' \
    --exclude='upload-share/data/*' \
    --delete \
    --delete-excluded \
    /home/chris/Backup/Vortex/Docker/