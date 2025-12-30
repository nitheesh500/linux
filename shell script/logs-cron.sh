#!/bin/bash

logfile=/var/log/cloud-init.log

if [ -f $logfile ]
then
    echo "file found"
    if grep -i "error" $logfile
    then
        echo "Error Found"
    else
        echo "No Errors"
    fi
else
    echo "File not found"
fi