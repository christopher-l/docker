#!/usr/bin/env bash

set -e

rsync -a --delete data/ backup/
