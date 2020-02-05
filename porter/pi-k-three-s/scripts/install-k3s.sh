#!/bin/bash

master_internal_IP=$1
master_host=$2
master_port=$3
master_username=$4
workers_host=$5
workers_port=$6
workers_username=$7


# Install master

ssh -o StrictHostKeyChecking=no $master_username@$master_host -p $master_port /bin/bash << EOF
curl -sfL https://get.k3s.io | sh -

systemctl is-active --quiet k3s
while test $? -gt 0
do
    echo "Waiting for k3s service to start..."
    sleep 5
    systemctl is-active --quiet k3s
done
echo "k3s service is active"
EOF


token=$(ssh -o StrictHostKeyChecking=no $master_username@$master_host -p $master_port /bin/bash << EOF
sudo cat /var/lib/rancher/k3s/server/node-token
EOF
)

echo "Join token is: $token"

# Install workers

IFS=',' read -r -a hosts <<< "$workers_host"
IFS=',' read -r -a ports <<< "$workers_port"
IFS=',' read -r -a usernames <<< "$workers_username"

for index in "${!hosts[@]}"
do
    username=${usernames[index]} 
    port=${ports[index]} 
    host=${hosts[index]}

    echo "Installing worker node at $username@$host:$port"

    ssh -o StrictHostKeyChecking=no -o ProxyCommand="ssh -o StrictHostKeyChecking=no -W %h:%p $master_username@$master_host -p $master_port" $username@$host -p $port /bin/bash << EOF
export K3S_URL="https://${master_internal_IP}:6443"
export K3S_TOKEN="${token}"
curl -sfL https://get.k3s.io | sh -
EOF
done