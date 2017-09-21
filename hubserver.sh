#!/bin/bash
source /home/cloud/.envs/ecovent-server/bin/activate
export HUBSERVER_CONF_DIR='/home/cloud/conf'
/home/cloud/ecovent-server/bin/hubserver $@
