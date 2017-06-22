PID=`ps -ef | grep itandroids.jar | awk '{ print $2 }'`
kill -9 $PID

java -jar itandroids.jar ITAndroids 1 $1 3100 none 64 &
