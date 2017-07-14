#!/bin/sh

host=$1;
export LD_LIBRARY_PATH=./lib:$LD_LIBRARY_PATH
port=3100;
if [ -e $host ]; then
	host="localhost";
fi

BINARY=nexus3D

killall -9 $BINARY >/dev/null

for i in `seq 1 11`; do
  echo "Running $i";
  ./$BINARY --unum $i --host $host --port $port 1>/dev/null 2>/dev/null &
  sleep 1;
done
