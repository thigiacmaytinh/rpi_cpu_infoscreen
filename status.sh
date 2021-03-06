#!/bin/bash

UPTIME=`uptime | awk -F'( |,|:)+' '{if ($7=="min") {d=0;h=0;m=$6} else {if ($7~/^day/ && $9=="min") {d=$6;h=0;m=$8} else if ($7~/^day/) {d=$6;h=$8;m=$9} else {d=0;h=$6;m=$7}}}{print d+0,"d",h+0,"h",m+0,"m"}'`
CPUUSE=`vmstat 1 2 | tail -1 | awk '{print $13+$14}'`
CPUTEMP=`echo "$(($(</sys/class/thermal/thermal_zone0/temp)/1000))'C"`
USEDRAM=`free | grep Mem | awk '{print $3/$2 * 100.0}' | awk '{printf "%.f\n", int($1)}'`
DISKUSE=`df -m / | tail -1 | awk '{ print $5; }'`
DATARECEIVED=`cat /proc/net/dev | grep eth0 | awk '/:/ { print($2) }' |  awk '{print $1/1024/1024/1024}' | awk '{printf "%0.2f GB",$1"."substr($2,1,2)}'`
DATASENT=`cat /proc/net/dev | grep eth0 | awk '/:/ { print($10) }' |  awk '{print $1/1024/1024/1024}' | awk '{printf "%0.2f GB",$1"."substr($2,1,2)}'`
./test_bcm8544 "$UPTIME" "CPU: $CPUUSE% $CPUTEMP" "RAM: $USEDRAM%" "DSK: $DISKUSE" " IN: $DATARECEIVED" "OUT: $DATASENT"
