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

        IP=$(kubectl get service -l app.kubernetes.io/component=controller,app.kubernetes.io/name=ingress-nginx,app.kubernetes.io/instance=$INSTALLATION_NAME --namespace $NAMESPACE -o=jsonpath='{.items[0].status.loadBalancer.ingress[*].ip}')

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

function add-helm-repos {
    helm repo add jetstack https://charts.jetstack.io
    helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
    helm repo add stable https://kubernetes-charts.storage.googleapis.com/
    helm repo update
}

function create-cert-manager-namespace {
    kubectl create namespace $1
    kubectl label namespace $1 certmanager.k8s.io/disable-validation=true
}

function replace-tokens {
    envsubst < /cnab/app/cluster-issuer-$1.yaml > /cnab/app/cluster-issuer.yaml
    cat /cnab/app/cluster-issuer.yaml
}

function delete-certmanager-namespace {
    kubectl delete namespace $1
}

"$@"