#!/bin/bash

master_host=$1
master_port=$2
master_username=$3
workers_host=$4
workers_port=$5
workers_username=$6

function disableContainerFeatures {
    username=$1
    port=$2
    host=$3

    # Enable container features and reboot
    ssh -o StrictHostKeyChecking=no -J $master_username@$master_host:$master_port $username@$host -p $port /bin/bash << EOF
sudo sed -i 's/ cgroup_enable=cpuset cgroup_memory=1 cgroup_enable=memory//g' /boot/cmdline.txt
EOF
}

# Update master node

disableContainerFeatures $master_username $master_port $master_host

# Update worker nodes

IFS=',' read -r -a hosts <<< "$workers_host"
IFS=',' read -r -a ports <<< "$workers_port"
IFS=',' read -r -a usernames <<< "$workers_username"

for index in "${!hosts[@]}"
do
    disableContainerFeatures ${usernames[index]} ${ports[index]} ${hosts[index]}
done