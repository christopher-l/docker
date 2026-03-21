#!/usr/bin/env bash

set -e

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )"

for d in */ ; do
    (
        cd $d
        if [ -f backup.sh ]; then
            echo Backing up $d...
            ./backup.sh backup
        fi
    )
done
