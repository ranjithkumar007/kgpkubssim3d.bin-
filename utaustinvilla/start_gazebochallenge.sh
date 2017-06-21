#!/bin/bash
#
# UT Austin Villa start script for 3D simulation gazebo challenge
#

DIR="$( cd "$( dirname "$0" )" && pwd )" 
cd $DIR


export LD_LIBRARY_PATH=./libs:$LD_LIBRARY_PATH



./utaustinvilla --unum 2 --gazebo --host=$1 --port $2 &> /dev/null &



