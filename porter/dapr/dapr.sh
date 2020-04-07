function create-kubernetes-namespace() {
    kubectl create namespace $1
}

function delete-kubernetes-namespace() {
    kubectl delete namespace $1
}

"$@"