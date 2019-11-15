#!/bin/bash

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