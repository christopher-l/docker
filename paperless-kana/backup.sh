#!/usr/bin/env bash

set -e

sqlite3 data/db.sqlite3 ".backup 'dump.sqlite3'"