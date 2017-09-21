#!/usr/bin/python
import sys
if len(sys.argv) < 2:
	print 'please provide log file name also';
	exit();

filename = '/home/ecoventstaff/tools/report/'+ sys.argv[1];
sample = open(filename,'r');

total = 0;
for line in sample:
	if "Resident Pages" in line:
		token = line.split();
		for item in token:
			if "K/" in item:
				value = item.split("K/");
				total = total + int(value[0]);
			if "M/" in item:
				value = item.split("M/");
				total = total + int(value[0]) * 1000;

sample.close();

print total
	
		
