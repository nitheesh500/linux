#!/bin/bash

if [ -f /etc/passwd ]
then 
    echo " file exists"
else
    echo "file does not exists"
fi

if [ -d /var/log ]
then
    echo "Directory exists"
else
    echo "Directory does not exists"
fi

service="sshd"

if  systemctl is-active --quiet $service 
then 
    echo "$service is running"
else
    echo "$service is not running"
fi