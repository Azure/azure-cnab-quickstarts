#!/bin/bash

master_ipAddress=$1
master_username=$2
workers_ipAddress=$3
workers_username=$4

function disableContainerFeatures {
    username=$1
    ipAddress=$2

    # Enable container features and reboot
    ssh -o StrictHostKeyChecking=no $username@$ipAddress /bin/bash << EOF
sudo sed -i 's/ cgroup_enable=cpuset cgroup_memory=1 cgroup_enable=memory//g' /boot/cmdline.txt
EOF
}

# Update master node

disableContainerFeatures $master_username $master_ipAddress

# Update worker nodes

IFS=',' read -r -a ipAddresses <<< "$workers_ipAddress"
IFS=',' read -r -a usernames <<< "$workers_username"

for index in "${!ipAddresses[@]}"
do
    disableContainerFeatures ${usernames[index]} ${ipAddresses[index]}
done