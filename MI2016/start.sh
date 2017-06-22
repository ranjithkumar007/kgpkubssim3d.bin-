#!/bin/bash
#
# RoboCup 2015 sample start script for 3D soccer simulation
#

#export LD_LIBRARY_PATH=./:./libs/

AGENT_BINARY="Miracle3D"
BINARY_DIR="."
NUM_PLAYERS=11
HOST=$1 ###
#default values
if [ "$HOST" == "" ]; then HOST="127.0.0.1"; fi ####
#if [ "$NUM_PLAYERS" == "" ]; then NUM_PLAYERS=11; fi

#killall -9 "$AGENT_BINARY" &> /dev/null
i=1
while [ $i -ne 12 ]
do
   case $i in
#	3 | 4)
#		echo "Running agent No. $i --type 1"
#		"$BINARY_DIR/$AGENT_BINARY" --unum=$i --type=1 --host=$1 &
#		;;
	5 | 6)
		echo "Running agent No. $i --type 2"
		"$BINARY_DIR/$AGENT_BINARY" --unum=$i --type=2 --host=$1 &
		sleep 1
		;;
#	7 | 8)
#
#		echo "Running agent No. $i --type 3"
#		"$BINARY_DIR/$AGENT_BINARY" --unum=$i --type=3 --host=$1 &
#		;;
	10 | 11)
		echo "Running agent No. $i --type 4"
		"$BINARY_DIR/$AGENT_BINARY" --unum=$i --type=4 --host=$1 &
		sleep 1
		;;
	*)
		echo "Running agent No. $i --type 0"
		"$BINARY_DIR/$AGENT_BINARY" --unum=$i --type=0 --host=$1 &
		sleep 1
		;;
   esac 
	i=`expr $i + 1`
    sleep 1;
done

