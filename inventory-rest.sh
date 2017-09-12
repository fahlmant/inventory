#!/bin/bash


declare -a commands=("hostname -f" "ip -o addr show | awk '{print $2 \" \" $3 \" \" $4}'" "ip -o link show | awk '!/lo:/'" "lsblk" "cat /proc/cpuinfo " "free -m");

for i in "${commands[@]}"; do
    echo $i
   `OUTPUT=$($i) && curl -X PUT  -d host=$(hostname -f) -d command="'$i'" -d bob="'$OUTPUT'" 10.7.28.191:8000`
done

