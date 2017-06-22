#*******************************************************************************
# Copyright 2008, 2011 Hochschule Offenburg
# Klaus Dorer, Mathias Ehret, Stefan Glaser, Thomas Huber, Fabian Korak,
# Simon Raffeiner, Srinivasa Ragavan, Thomas Rinklin,
# Joachim Schilling, Ingo Schindler, Rajit Shahi, Bjoern Weiler
#
# This file is part of magmaOffenburg.
#
# magmaOffenburg is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# magmaOffenburg is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with magmaOffenburg. If not, see <http://www.gnu.org/licenses/>.
#*******************************************************************************
#!/bin/bash
###########################################
# Starts a magmaOffenburg RoboCup client
# example: ./startCommon.sh 127.0.0.1 3100 magma magmaOffenburg.jar 11
###########################################

if [ $# -ne 5 ]; then
        echo "Usage: $0 <Server IP> <Server Port> <Team name> <jarName> <Players>"
        exit 1
fi

SERVER_IP=$1
SERVER_PORT=$2
TEAM_NAME=$3
JAR_NAME=$4
NUMPLAYERS=$5
PLAYERS="`seq 1 ${NUMPLAYERS}`"
PLAYERID=(x 1 2 3 4 5 6 7 8 9 10 11)
LOGLEVEL=severe

BASEDIR=$(dirname $0)
CLSPTH=$BASEDIR/$JAR_NAME
CLSPTH=${CLSPTH}:$BASEDIR/commons-math3-3.3.jar

mkdir -p log

for NUM in ${PLAYERS}; do
   java -cp $CLSPTH magma.robots.RoboCupClient --teamname=$TEAM_NAME --playerid=${PLAYERID[$NUM]} --server=$SERVER_IP --port=$SERVER_PORT --loglevel=$LOGLEVEL --serverversion=066 1>log/outAndErrorAgents$SERVER_PORT.log 2>&1 &
   #echo ${PLAYERID[$NUM]}
   sleep 1
done
