#!/bin/bash

echo `date | awk '{print $4}'` . `free | awk '{print $7}'` >> /home/ecoventstaff/tools/report/overallcache
