#!/bin/sh
currentDate=$(date +%Y'-'%m'-'%d);
read -p 'Where to(Leaving this blank will save the file under "~/logs/"): ' prefix;
echo $prefix
if [ -z "$prefix" ]
then
    prefix="/Users/$USER/logs/";
fi
suffix="_GPU_LOG.log";
filename="$prefix$currentDate$suffix"
echo $filename;
touch $filename;
read -p 'set logging interval: ' time
while sleep $time;
do
date +%H':'%M':'%S >> $filename
ioreg -l |grep \"PerformanceStatistics\" | cut -d '{' -f 2 | tr '|' ',' | tr -d '}' | tr ',' '\n'|grep 'Temp\|Fan\|Clock' >> $filename 
echo '------------------------------' >> $filename 
done
