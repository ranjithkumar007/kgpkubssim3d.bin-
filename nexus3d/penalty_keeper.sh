#!/bin/sh

host=$1;
port=3100;

if [ -e $host ]; then
	host="localhost";
fi
if [ -e $port ]; then
	port="3100";
fi
echo $port
##$LD_LIBRARY_PATH=lib;$LD_LIBRARY_PATH ;
##export $LD_LIBRARY_PATH > /dev/null

export LD_LIBRARY_PATH=./lib:$LD_LIBRARY_PATH


BINARY=nexus_keeper

killall -9 $BINARY >/dev/null

##for i in `seq 1 11`; do
##  echo "Running $i";
  ./$BINARY --unum 1 --host $host --port $port 1>/dev/null 2>/dev/null &
##  sleep 1;
##done
