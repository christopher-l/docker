#!/usr/bin/env bash

set -e

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )"

for d in */ ; do
    (
        echo Backing up $d...
        cd $d
        ./backup.sh backup
    )
done

echo Copying data...
rsync . -a \
    --exclude='/*/data/*' \
    --exclude='/.git' \
    --exclude='/.ssh' \
    --delete \
    --delete-excluded \
    /home/chris/Backup/Vortex/Docker/
