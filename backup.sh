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
