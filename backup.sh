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

# echo Creating archive...
# tar \
#     --exclude='miniflux/db/*' \
#     --exclude='hedgedoc/mariadb/*' \
#     --exclude=paperless-ngx/data/db.sqlite3 \
#     --exclude='upload-share/run/*' \
#     -czf "$1" -C $(dirname $(pwd)) $(basename $(pwd))

echo Copying data...
rsync -a \
    --exclude='miniflux/db/*' \
    --exclude='hedgedoc/mariadb/*' \
    --exclude='paperless-kana/data/*' \
    --exclude='upload-share/data/*' \ 