# Setups up Kubernetes and Tiller on a Raspberry Pi cluster using k3s

## Simple deployment

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-cnab-quickstarts%2Fpi-k3s%2Fporter%2Fpi-k-three-s%2Fazuredeploy-simple.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>

## Advanced deployment

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-cnab-quickstarts%2Fpi-k3s%2Fporter%2Fpi-k-three-s%2Fazuredeploy-advanced.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>

TODO: Write up pre-requisites and instructions here

## Parameters and Credentials

 | Name | Description | Default | Required | 
 | --- | --- | --- | --- | 
 | master_ipAddress | IP address of the master Raspberry Pi node |  | No
master_username | Username for the master Raspberry Pi node |  | No
porter-debug | Print debug information from Porter when executing the bundle |  | No
ssh_key | Private ssh key for authenticating with all Raspberry Pis |  | Yes
workers_ipAddress | Comma-separated array of IP addresses of the worker Raspberry Pi nodes, e.g. '192.168.0.60,192.168.0.61,192.168.0.62' |  | No
workers_username | Comma-separated array of usernames for the worker Raspberry Pi nodes, e.g. 'pi,pi,pi' |  | No | 
