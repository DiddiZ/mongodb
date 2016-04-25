#!/bin/bash
RET=1
while [[ RET -ne 0 ]]; do
    echo "=> Waiting for confirmation of MongoDB service startup"
    sleep 5
    mongo admin --eval "help" >/dev/null 2>&1
    RET=$?
done

mongo admin --eval "db.createUser({user: 'root', pwd: '$rootPwd', roles:[{role:'root',db:'admin'}]});"
mongo $dataName --authenticationDatabase admin --username root --password $rootPwd --eval "db.createUser({ user: '$dataUser', pwd: '$dataPwd', roles: [{ role: 'dbOwner', db: '$dataName' }]});"
touch /data/db/.mongodb_password_set
