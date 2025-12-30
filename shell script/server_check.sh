#!/bin/bash

serversList=(www.google.com www.facebook.com www.amazon.com)

for i in ${serversList[@]}
do
    if ping -c 1 $i &>/dev/null
    then
        echo "UP"
    else
        echo "DOWN"
    fi
done