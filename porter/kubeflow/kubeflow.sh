#!/usr/bin/env bash

install-kubeflow() {
    export KF_NAME=$1
    export BASE_DIR=/kubeflow
    export KF_DIR=${BASE_DIR}/${KF_NAME}
    export CONFIG_URI=$2
    mkdir -p ${KF_DIR}
    cd ${KF_DIR}
    kfctl apply -V -f ${CONFIG_URI}
}

uninstall-kubeflow() {
    export KF_NAME=$1
    export BASE_DIR=/kubeflow
    export KF_DIR=${BASE_DIR}/${KF_NAME}
    export CONFIG_URI=$2
    mkdir -p ${KF_DIR}
    cd ${KF_DIR}
    kfctl delete -f ${CONFIG_URI}
}

# Call the requested function and pass the arguments as-is
"$@"