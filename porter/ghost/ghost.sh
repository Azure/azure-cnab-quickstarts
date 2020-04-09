function replace-tokens {
    envsubst < /cnab/app/values.yaml.template > /cnab/app/values.yaml
    cat /cnab/app/values.yaml && echo \n\n
}

"$@"