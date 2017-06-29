#!/bin/bash

echo -e "=====\n"
hostname -f #Get Hostname
printf "\n"
sudo dmidecode --type system | egrep -i 'System Information' -A 10 | grep Serial
printf "\n"
ifconfig -a #Get hardward addresses
printf "\n"
printf "====="

