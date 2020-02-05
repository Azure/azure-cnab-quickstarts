#!/bin/bash

master_host=$1
master_port=$2
master_username=$3
workers_host=$4
workers_port=$5
workers_username=$6

function enableContainerFeatures {
    username=$1
    port=$2
    host=$3

    # Enable container features and reboot
    ssh -o StrictHostKeyChecking=no -o ProxyCommand="ssh -o StrictHostKeyChecking=no -W %h:%p $master_username@$master_host -p $master_port" $username@$host -p $port /bin/bash << EOF
sudo sed -i '$ s/$/ cgroup_enable=cpuset cgroup_memory=1 cgroup_enable=memory/' /boot/cmdline.txt
sudo reboot
EOF
}

function waitForSsh {
    username=$1
    port=$2
    host=$3
    
    ssh -o StrictHostKeyChecking=no -o ProxyCommand="ssh -o StrictHostKeyChecking=no -W %h:%p $master_username@$master_host -p $master_port" $username@$host -p $port echo
    while test $? -gt 0
    do
        echo "Waiting for reboot on $host..."
        sleep 5
        ssh -o StrictHostKeyChecking=no -o ProxyCommand="ssh -o StrictHostKeyChecking=no -W %h:%p $master_username@$master_host -p $master_port" $username@$host -p $port echo
    done

    echo "Node at $host started"
}

# Update master node

enableContainerFeatures $master_username $master_port $master_host

# Update worker nodes

IFS=',' read -r -a hosts <<< "$workers_host"
IFS=',' read -r -a ports <<< "$workers_port"
IFS=',' read -r -a usernames <<< "$workers_username"

for index in "${!hosts[@]}"
do
    enableContainerFeatures ${usernames[index]} ${ports[index]} ${hosts[index]}
done

# Wait for nodes to start up again

waitForSsh $master_username $master_port $master_host

for index in "${!hosts[@]}"
do
    waitForSsh ${usernames[index]} ${ports[index]} ${hosts[index]}
done