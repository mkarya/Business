#!/bin/bash

if [ ! -d "report" ]; then 
	mkdir report
fi

logfilename=report/$0_log_`date | awk '{print $1$2$3_$4}'`
touch $logfilena

pids=`ps -ef | grep -v root | awk '{print $2}'`
processes=`ps -ef | grep -v root | awk '{print $8}'`

for  epid in $pids
do
        echo "files opened by $epid process"
	processName=`cat /proc/$epid/cmdline | xargs -0 echo`
	echo "analysing"  $processName $epid >> $logfilename 
        temp=`ls -ltr /proc/$epid/fd | grep -v socket | grep -v pipe | grep -v dev | grep -v anon | awk '{print $11}'`
	echo "opened log files by this process" >> $logfilename
 #	echo $temp >> $logfilename
	files=$files.$temp
	for etemp in $temp
	do
		du -h $etemp >> $logfilename
	done
	echo "---------------------------------------" >> $logfilename
	echo '' >> $logfilename
done

if [ -f "fileset" ]; then 
	> fileset
fi 

for efile in $files
do
	echo $efile  | sed 's/\.*$//g' >> fileset
done

cat fileset | sort -u > fileset1

afiles=`cat fileset1`

rm fileset fileset1

if [ -f "vmoutput" ]; then 
	> vmoutput
fi

kk=`date | awk '{print $4}'`

for efile in $afiles
do
	echo "$efile footrpint in cache" >> '/home/ecoventstaff/tools/report/'$kk.'log'
	/home/ecoventstaff/tools/vmtouch/vmtouch $efile >> '/home/ecoventstaff/tools/report/'$kk.'log'
done
