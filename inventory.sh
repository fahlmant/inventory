#!/bin/bash

#Get Hostname
HOSTNAME=$(hostname -f)
echo "hostname: $HOSTNAME"
#Get Serial number for system
sudo dmidecode --type system | egrep -i 'System Information' -A 10 | grep Serial | sed -e 's/^[[:space:]]*//g'
#Get each device and mac adress
for f in /sys/class/net/*; do
  echo  "$f"
  cat $f/address
done
printf "\n"
