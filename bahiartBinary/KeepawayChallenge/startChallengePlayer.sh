#!/bin/bash
# BahiaRT 2013 binary

sleep 0.5
echo "Launch 9"
./bahiart -u 9 -h $1 -p $2 -b $3 $4 $5 -c >/dev/null 2>&1 &
sleep 0.5
echo "Launch 10"
./bahiart -u 10 -h $1 -p $2 -b $3 $4 $5 -c >/dev/null 2>&1 &
sleep 0.5
echo "Launch 11"
./bahiart -u 11 -h $1 -p $2 -b $3 $4 $5 -c >/dev/null 2>&1 &
sleep 0.5
