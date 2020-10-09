function replace-tokens {
    export INGRESS_HOST=$2
    export CERT_MANAGER_ISSUER=$3

    if [[ $MATTERMOST_LICENSE == '' ]]
    then 
        export MATTERMOST_LICENSE='nolicense' # Set to a value, otherwise the Helm template isn't happy
    fi

    envsubst < /cnab/app/mattermost-$1-values.yaml > /cnab/app/mattermost-values.yaml
    cat /cnab/app/mattermost-values.yaml
}

"$@"