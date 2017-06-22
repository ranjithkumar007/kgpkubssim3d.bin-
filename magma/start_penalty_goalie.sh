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
# but WI THOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with magmaOffenburg. If not, see <http://www.gnu.org/licenses/>.
#*******************************************************************************
#!/bin/bash
###########################################
# Starts the goalie for penalties.
# Example: ./start_penalty_goalie.sh 127.0.0.1
###########################################


CLSPTH=./magmaOffenburg.jar
CLSPTH=${CLSPTH}:./commons-math3-3.3.jar

if [ $# -ne 1 ]; then
	echo "Usage: $0 <Server IP>"
	exit 1
fi

SERVER_IP="--server=$1"
TEAM_NAME="--teamname=magma"
NUM="--playerid=1"


java -cp $CLSPTH magma.robots.RoboCupClient $TEAM_NAME $NUM $SERVER_IP &

