#!/bin/sh

pid=$1
sleep_100_ms=0.1
sleep_500_ms=0.5

if [ -z $pid ]
then
  echo "Please enter pid"
  exit 1
fi


while true
do
  ts=`date +%s`
  thread_dump=$pid'_'$ts
  echo $thread_dump
  jstack -l $pid > $thread_dump.txt
  sleep $sleep_100_ms
done


#time sleep 0.5      # 500 milliseconds (1/2 of a second)
#time sleep 0.001    # 1 millisecond (1/1000 of a second)
#time sleep 1.0      # 1 second (1000 milliseconds)
#vim: ts=2 sts=2 sw=2 et nospell :
