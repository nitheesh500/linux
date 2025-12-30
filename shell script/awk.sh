#!/bin/bash
awk '{print $1}' users.txt

awk '{print $2}' users.txt

awk '$3=="DevOps" {print $1}' users.txt
 