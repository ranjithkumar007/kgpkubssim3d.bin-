#!/bin/bash
HOST=$1
TEAMNAME=$2
UNUM=$3
cd seeding
./start_drop_in.sh $@
echo done.
