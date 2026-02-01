#!/usr/bin/env bash

set -e

case $1 in
    backup)
        rsync -a data/ backup/
        ;;
    restore)
        rsync -a backup/ data/
        ;;
    restore_online)
        false
        ;;
    *)
        echo invalid command: $1
        exit 1
esac
