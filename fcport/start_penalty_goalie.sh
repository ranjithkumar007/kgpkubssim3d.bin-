#!/bin/bash
# FC Portugal 3D 2008 binary

cd binPenalty

#echo "Launch simulator"
#simspark &
#sleep 3
host="localhost"
if [ $# -gt 0 ]; then
	host="${1}"  
fi


echo "Launch 6"
./fcpagent -u 1 -r 0 -h ${host} $2 >/dev/null 2>&1 &
