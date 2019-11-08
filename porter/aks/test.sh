#!/bin/bash

if [[ $(az aks show --name blah --resource-group blah) == false ]]
then
    echo "Hello!"
else
    echo "AKS cluster already exists in specified resource group with specified name"
fi