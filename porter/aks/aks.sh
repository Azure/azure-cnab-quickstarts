function create-aks {
    if [[ -z $(az aks show --name $1 --resource-group $2 2> /dev/null) ]]
    then
        az aks create \
        --name $1 \
        --resource-group $2 \
        --kubernetes-version $3 \
        --node-vm-size $4 \
        --node-count $5 \
        --service-principal $6 \
        --client-secret $7 \
        --location $8 \
        --vm-set-type $9 \
        --generate-ssh-keys
    else
        echo "AKS cluster already exists in specified resource group with specified name"
    fi
}

"$@"