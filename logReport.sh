#!/bin/bash
for i in `cat report/09:24:59.log`
do
	echo $i | awk '{print $1}'
	echo $i | awk '{print $3}'
done
