#!/bin/bash

check_service(){

    if systemctl is-active --quiet $1
    then
        echo "Runing $1"
    else
        echo "Not Running $1"
    fi
}

check_service sshd
check_service docker
check_service cron