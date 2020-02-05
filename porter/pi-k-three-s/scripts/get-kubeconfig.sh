#!/bin/bash

master_host=$1
master_port=$2
master_username=$3
master_kubernetes_host=$4
master_kubernetes_port=$5

ssh -o StrictHostKeyChecking=no $master_username@$master_host -p $master_port /bin/bash << EOF
sudo cp /etc/rancher/k3s/k3s.yaml /tmp/config
sudo chmod 777 /tmp/config
EOF

mkdir ~/.kube
scp -P $master_port $master_username@$master_host:/tmp/config ~/.kube

ssh -o StrictHostKeyChecking=no $master_username@$master_host -p $master_port /bin/bash << EOF
sudo rm /tmp/config
EOF

kubectl config set-cluster default --server=https://$master_kubernetes_host:$master_kubernetes_port
kubectl config use-context default
kubectl config view