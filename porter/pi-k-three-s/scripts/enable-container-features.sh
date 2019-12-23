#!/bin/bash

master_ipAddress=$1
master_username=$2
workers_ipAddress=$3
workers_username=$4

function enableContainerFeatures {
    username=$1
    ipAddress=$2

    # Enable container features and reboot
    ssh -o StrictHostKeyChecking=no $username@$ipAddress /bin/bash << EOF
sudo sed -i '$ s/$/ cgroup_enable=cpuset cgroup_memory=1 cgroup_enable=memory/' /boot/cmdline.txt
sudo reboot
EOF
}

function waitForSsh {
    username=$1
    ipAddress=$2
    
    ssh -o StrictHostKeyChecking=no $username@$ipAddress echo
    while test $? -gt 0
    do
        echo "Waiting for reboot on $ipAddress..."
        sleep 5
        ssh -o StrictHostKeyChecking=no $username@$ipAddress echo
    done

    echo "Node at $ipAddress started"
}

# Update master node

enableContainerFeatures $master_username $master_ipAddress

# Update worker nodes

IFS=',' read -r -a ipAddresses <<< "$workers_ipAddress"
IFS=',' read -r -a usernames <<< "$workers_username"

for index in "${!ipAddresses[@]}"
do
    enableContainerFeatures ${usernames[index]} ${ipAddresses[index]}
done

# Wait for nodes to start up again

waitForSsh $master_username $master_ipAddress

for index in "${!ipAddresses[@]}"
do
    waitForSsh ${usernames[index]} ${ipAddresses[index]}
done