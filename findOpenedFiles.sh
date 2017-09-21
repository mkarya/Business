#!/bin/bash

pid=`cat all_pids`
for  epid in $pid
do
        echo "content on $epid directory"
        ls -ltr /proc/$epid/fd >> log_files

done

