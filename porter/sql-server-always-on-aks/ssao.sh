function create-aks {
    if [[ -z $(az aks show --name $1 --resource-group $2 2> /dev/null) ]]
    then
        az aks create \
        --name $1 \
        --resource-group $2 \
        --kubernetes-version $3 \
        --node-count $4 \
        --service-principal $5 \
        --client-secret $6 \
        --location $7 \
        --generate-ssh-keys
    else
        echo "AKS cluster already exists in specified resource group with specified name"
    fi
}

function wait-for-sql-custom-resource {
    crd=''
    while [[ -z $crd ]]
        do crd=$(kubectl get crd --field-selector=metadata.name=sqlservers.mssql.microsoft.com --ignore-not-found=true)
        echo 'Waiting for sql server CRD to be created'
        sleep 30
    done
}

function output-primary-ip-address {
    PRIMARY_IP=''
    while [[ -z $PRIMARY_IP ]]
        do PRIMARY_IP=$(kubectl get svc/ag1-primary -n ag1 -o=jsonpath='{.status.loadBalancer.ingress[0].ip}' --ignore-not-found=true)
        echo 'Waiting for primary AG IP Address' 
        sleep 30
    done
    echo Connect to SQL Primary: sqlcmd -S ${PRIMARY_IP} -U sa
}

function delete-resource-group {
    az group delete --name $1 --yes
}

"$@"