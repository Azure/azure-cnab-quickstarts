#!/bin/bash

master_host=$1
master_port=$2
master_username=$3
workers_host=$4
workers_port=$5
workers_username=$6


# Uninstall master

ssh -o StrictHostKeyChecking=no $master_username@$master_host -p $master_port /bin/bash << EOF
/usr/local/bin/k3s-killall.sh
/usr/local/bin/k3s-uninstall.sh
EOF


# Uninstall workers

IFS=',' read -r -a hosts <<< "$workers_host"
IFS=',' read -r -a ports <<< "$workers_port"
IFS=',' read -r -a usernames <<< "$workers_username"

for index in "${!hosts[@]}"
do
    username=${usernames[index]} 
    port=${ports[index]} 
    host=${hosts[index]}

    echo "Uninstalling worker node at $username@$host"

    ssh -o StrictHostKeyChecking=no -J $master_username@$master_host:$master_port $username@$host -p $port /bin/bash << EOF
/usr/local/bin/k3s-killall.sh
/usr/local/bin/k3s-agent-uninstall.sh
EOF
done