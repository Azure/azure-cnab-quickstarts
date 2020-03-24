#!/bin/bash

NAMESPACE=$1

RETRIES=0
while [ -z $IP ]; do
    if [[ $RETRIES -gt 100 ]]; then
        echo "Exceeded number of retries for getting external IP address."
        exit 1    
    fi

    IP=$(kubectl get service calculator-front-end --namespace $NAMESPACE -o=jsonpath='{.status.loadBalancer.ingress[*].ip}')

    if [[ -z $IP ]]; then
        echo "External IP address not ready yet. Trying again in 5 seconds."
        sleep 5
        RETRIES=$((RETRIES + 1))
    else
        echo "Found external IP address."
    fi
done

echo "External IP address for calculator front-end is: $IP"
echo $IP > IP