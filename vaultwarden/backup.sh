#!/usr/bin/env bash

set -e

rm -f backup/db.sqlite3
sqlite3 data/db.sqlite3 ".backup 'backup/db.sqlite3'"
rsync -a --delete data/attachments data/rsa_key.pem backup/