#!/bin/bash

pid=`cat file_names`
for  epid in $pid
do
        echo "content on $epid file" >> cache_usage
        vmtouch/vmtouch $epid >> cache_usage

done

