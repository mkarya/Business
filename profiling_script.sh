#!/bin/bash

pids=`ps -ef | grep -v root | awk '{print $2}'`
processes=`ps -ef | grep -v root | awk '{print $8}'`

for  epid in $pids
do
        echo "files opened by $epid process"
        temp=`ls -ltr /proc/$epid/fd | grep -v socket | grep -v pipe | grep -v dev | grep -v anon | awk '{print $11}'`
	files=$files.$temp
done
> fileset
for efile in $files
do
	echo $efile  | sed 's/\.*$//g' >> fileset
done

cat fileset | sort -u > fileset1

afiles=`cat fileset1`

> vmoutput

kk=`date | awk '{print $4}'`
for efile in $afiles
do
	echo "$efile footrpint in cache" >> '/home/ecoventstaff/tools/report/'$kk.'log'
	/home/ecoventstaff/tools/vmtouch/vmtouch $efile >> '/home/ecoventstaff/tools/report/'$kk.'log'
done

#echo $files | sort | uniq

