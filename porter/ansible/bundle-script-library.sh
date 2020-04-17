#!/bin/bash

function generate-keyfile-from-cred() {
    # to avoid accidents when testing this script locally, don't clobber an existing key file
    if [[ -f '/root/.ssh/id_rsa' ]]; then
        echo "Keyfile already exists - skipping"
    else
        mkdir /root/.ssh
        echo $SSH_PRIVATE_KEY_BASE64 | base64 --decode - >/root/.ssh/id_rsa
        chmod 600 /root/.ssh/id_rsa
    fi
}
function run-ansible() {
    ANSIBLE_CMD="ansible-playbook -i ./ansible/environments/$ENVIRONMENT $2 ansible/$1"
    echo "ansible cmd: $ANSIBLE_CMD"
    $ANSIBLE_CMD
}

function install() {
    generate-keyfile-from-cred
    run-ansible "install.yml" "-e admin_public_key_base64=$ADMIN_PUBLIC_KEY_BASE64"
}
function uninstall() {
    run-ansible "uninstall.yml"
}
function upgrade() {
    generate-keyfile-from-cred
    run-ansible "install.yml" "-e skip_provision=true"
}

ACTION=$1
ENVIRONMENT=$2
# The public key will contain a space to base64 encode it to make life easier passing it around
ADMIN_PUBLIC_KEY_BASE64=$(echo $3 | base64 --wrap=0)

"$@"