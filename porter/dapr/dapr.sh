function replace-tokens() {
    envsubst < /cnab/app/values.yaml.template > /cnab/app/values.yaml
    cat /cnab/app/values.yaml && echo \n\n
}
     
function create-kubernetes-namespace() {
    kubectl create namespace $1
}

function delete-kubernetes-namespace() {
    kubectl delete namespace $1
}

"$@"