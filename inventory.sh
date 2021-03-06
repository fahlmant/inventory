#!/bin/bash

#1) Get Hostname
printf "#^Hostname: $HOSTNAME\n"

#2) Get Serial number for system
dmidecode

#3) IP Address
printf "#^IP Adresses:\n"
ip -o addr show  | awk '{print $2 " " $3 " " $4}'

#4) Get Mac Address
printf "#^MAC Adresses:\n"
ip -o link show | awk '!/lo:/'

#8) Disk Info
printf "#^Disk Info:\n"
df -h

#9) CPU Info
printf "#^CPU Info:\n"
cat /proc/cpuinfo | grep -i 'model name' -m 1

#10) Ram Info
printf "#^Memory Info:\n"
free -m

printf "#^END"
printf "\n"
