#!/bin/bash

master_ipAddress=$1
master_username=$2

ssh -o StrictHostKeyChecking=no $master_username@$master_ipAddress /bin/bash << EOF
sudo cp /etc/rancher/k3s/k3s.yaml /tmp/config
sudo chmod 777 /tmp/config
EOF

mkdir ~/.kube
scp $master_username@$master_ipAddress:/tmp/config ~/.kube

ssh -o StrictHostKeyChecking=no $master_username@$master_ipAddress /bin/bash << EOF
sudo rm /tmp/config
EOF

kubectl config set-cluster default --server=https://$master_ipAddress:6443
kubectl config use-context default
kubectl config view