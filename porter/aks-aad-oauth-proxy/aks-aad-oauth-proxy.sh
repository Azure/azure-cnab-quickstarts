function create-AAD-app-registration {
    az ad app create --display-name "$1" --identifier-uris "http://$1" --password "$2" --reply-url "https://$3/oauth2/callback"
    AAD_CLIENT_ID=$(az ad app list --display-name $1 --query "[0].appId" -o tsv)
    az ad app permission add --id $AAD_CLIENT_ID --api 00000002-0000-0000-c000-000000000000 --api-permissions 311a71cc-e848-46a1-bdf8-97ff7156d8e6=Scope
}

function replace-tokens {
    export AAD_CLIENT_ID=$(az ad app list --display-name $1 --query "[0].appId" -o tsv)
    export COOKIE_SECRET=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-32};echo;)
    envsubst < oauth2-proxy-azure.yaml > manifest.yaml
    cat manifest.yaml && echo \n\n
}

function create-namespace {
    manifest="{\"apiVersion\": \"v1\", \"kind\": \"Namespace\", \"metadata\": { \"name\": \"$1\" }}"
    echo $manifest | kubectl apply -f -
}

function create-oauth2-secret {
    kubectl create secret generic oauth2-secrets --namespace $1 --from-literal=clientSecret=$2
}

function delete-namespace {
    kubectl delete namespace $1
}

"$@"