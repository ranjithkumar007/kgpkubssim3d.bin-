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
# Starts a magmaOffenburg RoboCup client for the magma challenge tool
# example: ./startChallengePlayer.sh 127.0.0.1 3100 0 0 KickChallenge
###########################################

if [ $# -lt 2 ]; then
        echo "Usage: $0 <Server IP> <Server Port> <Start Pos X> <Start Pos Y> <Challenge Name>"
        exit 1
fi

SERVER_IP=$1
SERVER_PORT=$2
TEAM_NAME=magmaOffenburg
PLAYER_TYPE=NaoToe
DECISION_MAKER=$5
LOGLEVEL=off

BASEDIR=$(dirname $0)
CLSPTH=$BASEDIR/magmaOffenburg.jar
CLSPTH=${CLSPTH}:$BASEDIR/commons-math3-3.3.jar

start()
{
	java -cp $CLSPTH magma.robots.RoboCupClient --teamname=$TEAM_NAME --playerid=$1 --server=$SERVER_IP --port=$SERVER_PORT --loglevel=$LOGLEVEL --serverversion=066 --factory=$PLAYER_TYPE --decisionmaker=$DECISION_MAKER 1>outAndErrorAgents$SERVER_PORT.log 2>&1 &
}

if [ $DECISION_MAKER == "GazeboRunChallenge" ]; then
  PLAYER_TYPE=NaoGazebo
fi

if [ $DECISION_MAKER == "KeepAwayChallenge" ]; then
  start 8
  sleep 1
  start 9
  sleep 1
  start 10
else
  start 8
fi