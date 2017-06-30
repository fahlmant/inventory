#!/bin/bash

#1) Get Hostname
HOSTNAME=$(hostname -f)
echo "hostname: $HOSTNAME"

#2) Get Serial number for system
sudo dmidecode --type system | egrep -i 'System Information' -A 10 | grep Serial | sed -e 's/^[[:space:]]*//g'

#3) IP Address

#4) Get each device and mac adress
for f in /sys/class/net/*; do
  echo  "$f"
  cat $f/address
done

#5) IPMI Mac Addr
#6) IPMI User
#7) IPMI Password

#8) Disk Info

#9) CPU Info
lscpu

#10) Ram Info

printf "\n"
