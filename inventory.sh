#!/bin/bash

#THIS IS MADE FOR COREOS SYSTEMS

#Preamble
mayday
MAYDAY_DIR=$(ls /tmp | grep mayday)
MAYDAY_DIR_DATE=$(ls /tmp | grep mayday | sed -e 's/.tar.gz//g' -e 's/^.*2017/2017/g')
PWD=/tmp
tar xvf /tmp/$MAYDAY_DIR
cd /tmp/$MAYDAY_DIR_DATE


#1) Get Hostname via Mayday
cat hostname

#2) Get Serial number for system
sudo dmidecode --type system | egrep -i 'System Information' -A 10 | grep Serial | sed -e 's/^[[:space:]]*//g' | awk '{print "#^" $0}'

#3) IP Address via Mayday (IPv4 and IPv6 on eth0)
cat ip_addr_show | awk '/eth0/ {print $4}' 


#4) Mac Address via Mayday for eth0
cat ip_link_show | awk '/eth0/ {print $17}'

#5) IPMI Mac Addr


#6) IPMI User


#7) IPMI Password


#8) Disk Info
df -h

#9) CPU Info
lscpu | awk '/Arch|mode|Order|CPU(s)|Model name|CPU MHz/'

#10) Ram Info via Mayday
cat free
printf "\n"
