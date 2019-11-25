#!/bin/bash

master_ipAddress=$1
master_username=$2
workers_ipAddress=$3
workers_username=$4


# Install master

ssh -o StrictHostKeyChecking=no $master_username@$master_ipAddress /bin/bash << EOF
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


token=$(ssh -o StrictHostKeyChecking=no $master_username@$master_ipAddress /bin/bash << EOF
sudo cat /var/lib/rancher/k3s/server/node-token
EOF
)

echo "Join token is: $token"

# Install workers

IFS=',' read -r -a ipAddresses <<< "$workers_ipAddress"
IFS=',' read -r -a usernames <<< "$workers_username"

for index in "${!ipAddresses[@]}"
do
    username=${usernames[index]} 
    ipAddress=${ipAddresses[index]}

    echo "Installing worker node at $username@$ipAddress"

    ssh -o StrictHostKeyChecking=no $username@$ipAddress /bin/bash << EOF
export K3S_URL="https://${master_ipAddress}:6443"
export K3S_TOKEN="${token}"
curl -sfL https://get.k3s.io | sh -
EOF
done