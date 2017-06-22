#! /bin/bash

PID=`ps -ef | grep itandroids.jar | awk '{ print $2 }'`
kill -9 $PID
