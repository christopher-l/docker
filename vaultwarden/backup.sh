#!/usr/bin/env bash

set -e

case $1 in
    backup)
        rm -f backup/db.sqlite3
        sqlite3 data/db.sqlite3 ".backup 'backup/db.sqlite3'"
        rsync -a --delete data/attachments data/rsa_key.pem backup/
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
