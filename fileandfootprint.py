#!/usr/bin/python
import sys
if len(sys.argv) < 2:
	print 'please provide log file name also';
	exit();

filename = '/home/ecoventstaff/tools/report/' + sys.argv[1];
sample = open(filename,'r');

for line in sample:
	if "footrpint in cache" in line:
		print line.replace("footrpint in cache",'');
	if "Resident Pages" in line:
		print line;

	
		
