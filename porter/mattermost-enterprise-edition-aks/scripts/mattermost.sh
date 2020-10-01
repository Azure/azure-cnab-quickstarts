function replace-tokens {
    export INGRESS_HOST=$1
    export CERT_MANAGER_ISSUER=$2
    envsubst < /cnab/app/mattermost-values.template.yaml > /cnab/app/mattermost-values.yaml
    cat /cnab/app/mattermost-values.yaml
}

"$@"