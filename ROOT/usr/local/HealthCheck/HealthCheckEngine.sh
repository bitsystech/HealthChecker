#!/bin/sh
# Engine to initiate the scripts
# This is the engine 

# This is where you will keep all your scripts
HealthCheckList=/usr/local/HealthCheck/SCRIPTS

for SCRIPT in "$HealthCheckList"/*
do
if [ -f $SCRIPT -a -x $SCRIPT ]
then
$SCRIPT
fi
done