#!/bin/bash
set -m

mongodb_cmd="mongod --storageEngine mmapv1"
cmd="$mongodb_cmd --master --auth"

$cmd &
if [ ! -f /data/db/.mongodb_password_set ]; then
    /set_mongodb_password.sh
fi

fg