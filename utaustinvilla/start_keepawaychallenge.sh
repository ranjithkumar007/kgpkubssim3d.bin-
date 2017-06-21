#!/bin/bash
#
# UT Austin Villa start script for 3D simulation keepaway challenge
#

AGENT_BINARY=utaustinvilla
BINARY_DIR="."
LIBS_DIR="./libs"
NUM_PLAYERS=3

export LD_LIBRARY_PATH=$LIBS_DIR:$LD_LIBRARY_PATH


DIR="$( cd "$( dirname "$0" )" && pwd )" 
cd $DIR

for ((i=1;i<=$NUM_PLAYERS;i++)); do
    "$BINARY_DIR/$AGENT_BINARY" --unum $i --type 4 --host=$1 --port $2 --keepawaychallenge --modelfiledir models/models_b/w0d75vp0d75 &> /dev/null &
    sleep 1
done


