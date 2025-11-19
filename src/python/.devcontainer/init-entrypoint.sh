#!/bin/sh

if [ -f /configuration/postgres.env ]; then
    exit 0
fi

DB_PASSWORD=$(head -c 16 /dev/urandom | base64)
COLONIES_PRVKEY=$(colonies security generate 2>&1 | grep 'PrvKey=' | awk -F'PrvKey=' '{print $2}')

SERVER_KEYPAIR=$(colonies security generate 2>&1)
SERVER_ID=$(echo "$SERVER_KEYPAIR" | grep -o 'Id=[^ ]*' | awk -F'=' '{print $2}')
SERVER_PRVKEY=$(echo "$SERVER_KEYPAIR" | grep -o 'PrvKey=[^ ]*' | awk -F'=' '{print $2}')


echo "export POSTGRES_PASSWORD=$DB_PASSWORD" >> /configuration/postgres.env

echo "export COLONIES_DB_PASSWORD=$DB_PASSWORD" >> /configuration/colonyos.env
echo "export COLONIES_PRVKEY=$COLONIES_PRVKEY" >> /configuration/colonyos.env

echo "export COLONIES_SERVER_ID=$SERVER_ID" >> /configuration/colonyos.env
echo "export COLONIES_SERVER_PRVKEY=$SERVER_PRVKEY" >> /configuration/colonyos.env

COLONY_KEYPAIR=$(colonies security generate 2>&1)
COLONY_ID=$(echo "$COLONY_KEYPAIR" | grep -o 'Id=[^ ]*' | awk -F'=' '{print $2}')
COLONY_PRVKEY=$(echo "$COLONY_KEYPAIR" | grep -o 'PrvKey=[^ ]*' | awk -F'=' '{print $2}')

echo "export COLONIES_SERVER_ID=$SERVER_ID" >> /configuration/client.env
echo "export COLONIES_SERVER_PRVKEY=$SERVER_PRVKEY" >> /configuration/client.env

echo "export COLONIES_COLONY_ID=$COLONY_ID" >> /configuration/client.env
echo "export COLONIES_COLONY_PRVKEY=$COLONY_PRVKEY" >> /configuration/client.env

USER_KEYPAIR=$(colonies security generate 2>&1)
USER_ID=$(echo "$USER_KEYPAIR" | grep -o 'Id=[^ ]*' | awk -F'=' '{print $2}')
USER_PRVKEY=$(echo "$USER_KEYPAIR" | grep -o 'PrvKey=[^ ]*' | awk -F'=' '{print $2}')

echo "export COLONIES_USER_ID=$USER_ID" >> /configuration/client.env
echo "export COLONIES_PRVKEY=$USER_PRVKEY" >> /configuration/client.env

EXECUTOR_KEYPAIR=$(colonies security generate 2>&1)
EXECUTOR_ID=$(echo "$EXECUTOR_KEYPAIR" | grep -o 'Id=[^ ]*' | awk -F'=' '{print $2}')
EXECUTOR_PRVKEY=$(echo "$EXECUTOR_KEYPAIR" | grep -o 'PrvKey=[^ ]*' | awk -F'=' '{print $2}')

echo "export COLONIES_EXECUTOR_ID=$EXECUTOR_ID" >> /configuration/client.env
echo "export COLONIES_EXECUTOR_PRVKEY=$EXECUTOR_PRVKEY" >> /configuration/client.env

