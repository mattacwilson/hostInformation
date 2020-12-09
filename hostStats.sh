#!/bin/bash
#Created by Matthew Wilson
#Quick script to display some host info and prints to log file
#Created 09/12/20






date=$(date) #date
uptime=$(uptime) #how long has host been running
w=$(w) #Who is currently connected
last=$(last) #Who was last logged in
df=$(df) #Disk space free
free=$(free) #RAM free
logfile='/home/kali/hostStats/hostInfo_'$(date +"%d_%m_%Y---%T")'.txt'


#Print information to file
echo 'Date: '$date > $logfile
echo '==================================================================' >> $logfile
echo 'Uptime: ' $uptime >> $logfile
echo "Currently connected:" >> $logfile
w >> $logfile
echo "=================================================================="
echo "Last Logins:" >> $logfile
last -a | head -3 >>$logfile
echo '==================================================================' >> $logfile
echo "Disk Memory and Usage:" >> $logfile
df -h | xargs | awk '{print "Free/total disk: " $11 " / " $9}' >> $logfile
free -m | xargs | awk '{print "Free/total memory: " $17 " / " $8 " MB"}' >> $logfile


if test -e  $logfile
then
	echo $logfile 'has been created, contents below'

	cat $logfile
else 
	echo 'Error creating file'
fi


