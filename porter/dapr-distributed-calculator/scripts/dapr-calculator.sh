#!/usr/bin/env bash

function create-namespace() {
    kubectl create namespace $1
}

function delete-namespace() {
    kubectl delete namespace $1
}

"$@"