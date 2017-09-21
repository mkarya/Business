#!/bin/bash

pids=`ps -ef | grep -v root | awk '{print $2}'`
processes=`ps -ef | grep -v root | awk '{print $8}'`
> fpdata
for  epid in $pids
do
        echo "files opened by $epid process" >> fpdata
        temp=`ls -ltr /proc/$epid/fd | grep -v socket | grep -v pipe | grep -v dev | grep -v anon | awk '{print $11}'` 
	echo $temp >> fpdata;

done
