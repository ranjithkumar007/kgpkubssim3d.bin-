#! /bin/bash

#
# ITAndroids start script
#
BINARY_DIR="./"
NUM_PLAYERS=11
	
PID=`ps -ef | grep itandroids.jar | awk '{ print $2 }'`
kill -9 $PID

#killall -9 "$AGENT_BINARY" &> /dev/null

#echo "Running agent No. 1"
java -jar itandroids.jar ITAndroidsMagma 1 $1 3100 none 64 &
sleep 1

for ((i=2;i<=$NUM_PLAYERS;i++)); do
	#echo "Running agent No. $i"
	java -jar itandroids.jar ITAndroidsMagma $i $1 3100 none 64 15 &
	sleep 1
done
