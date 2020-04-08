#!/bin/bash

function configure-dns-name {
    NAMESPACE=$1
    INSTALLATION_NAME=$2
    DNS_NAME=$3

    RETRIES=0
    while [ -z $IP ]; do
        if [[ $RETRIES -gt 100 ]]; then
            echo "Exceeded number of retries for getting external IP address."
            exit 1    
        fi

        IP=$(kubectl get service -l app=nginx-ingress,release=$INSTALLATION_NAME --namespace $NAMESPACE -o=jsonpath='{.items[0].status.loadBalancer.ingress[*].ip}')

        if [[ -z $IP ]]; then
            echo "External IP address not ready yet. Trying again in 5 seconds."
            sleep 5
            RETRIES=$((RETRIES + 1))
        else
            echo "Found external IP address."
        fi
    done

    DNSNAME=$DNS_NAME
    PUBLICIPID=$(az network public-ip list --query "[?ipAddress!=null]|[?contains(ipAddress, '$IP')].[id]" --output tsv)
    az network public-ip update --ids $PUBLICIPID --dns-name $DNSNAME
    FQDN=$(az network public-ip list --query "[?ipAddress!=null]|[?contains(ipAddress, '$IP')].[dnsSettings.fqdn]" --output tsv)
    echo $FQDN > FQDN
}

function add-jetstack-helm-repo {
    helm repo add jetstack https://charts.jetstack.io
}

function run-cert-manage-pre-reqs {
    kubectl apply -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.8/deploy/manifests/00-crds.yaml
    kubectl create namespace $1
    kubectl label namespace $1 certmanager.k8s.io/disable-validation=true
}

function replace-tokens {
    envsubst < /cnab/app/cluster-issuer-$1.yaml > /cnab/app/cluster-issuer.yaml
}

function delete-certmanager-namespace {
    kubectl delete namespace $1
}

"$@"