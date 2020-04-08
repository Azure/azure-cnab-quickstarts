function create-kubernetes-namespace() {
    manifest="{\"apiVersion\": \"v1\", \"kind\": \"Namespace\", \"metadata\": { \"name\": \"$1\" }}"
    echo $manifest | kubectl apply -f -
}

function delete-kubernetes-namespace() {
    kubectl delete namespace $1
}

"$@"