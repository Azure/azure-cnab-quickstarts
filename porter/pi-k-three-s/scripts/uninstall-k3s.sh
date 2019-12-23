#!/bin/bash

master_ipAddress=$1
master_username=$2
workers_ipAddress=$3
workers_username=$4


# Uninstall master

ssh -o StrictHostKeyChecking=no $master_username@$master_ipAddress /bin/bash << EOF
/usr/local/bin/k3s-killall.sh
/usr/local/bin/k3s-uninstall.sh
EOF


# Uninstall workers

IFS=',' read -r -a ipAddresses <<< "$workers_ipAddress"
IFS=',' read -r -a usernames <<< "$workers_username"

for index in "${!ipAddresses[@]}"
do
    username=${usernames[index]} 
    ipAddress=${ipAddresses[index]}

    echo "Uninstalling worker node at $username@$ipAddress"

    ssh -o StrictHostKeyChecking=no $username@$ipAddress /bin/bash << EOF
/usr/local/bin/k3s-killall.sh
/usr/local/bin/k3s-agent-uninstall.sh
EOF
done