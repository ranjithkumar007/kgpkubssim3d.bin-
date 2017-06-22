#!/usr/bin/env bash
#> /dev/null 2>&1 &

SERVER_IP=$1
SERVER_PORT=3100
TEAM_NAME="ITAndroids2"

cd binaries/

for AGENT_NUM in $(seq 1 11);
do
    ./agent $SERVER_IP $SERVER_PORT $TEAM_NAME $AGENT_NUM > /dev/null 2>&1 &
    sleep 1;
done
