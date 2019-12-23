## Deploy from Azure


You will need to create a service principal in order to use the 'Deploy from Azure' buttons.


For detailed instructions on deploying from Azure, including how to setup the service principal, see [Consuming: Deploy from Azure](../../docs/consuming.md#deploy-from-azure)

### Simple deployment


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-cnab-quickstarts%2Fmaster%2Fporter%2Fpi-k-three-s%2Fazuredeploy-simple.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>

### Advanced deployment


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-cnab-quickstarts%2Fmaster%2Fporter%2Fpi-k-three-s%2Fazuredeploy-advanced.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>


## Deploy from Cloud Shell


For detailed instructions on deploying from Cloud Shell, including how to setup the Cloud Shell environment, see [Consuming: Deploy from Cloud Shell](../../docs/consuming.md#deploy-from-cloud-shell)


```porter install --tag cnabquickstarts.azurecr.io/porter/pi-k-three-s/bundle:latest -d azure```


## Parameters and Credentials

 | Name | Description | Default | Required | 
 | --- | --- | --- | --- | 
 | master_ipAddress | IP address of the master Raspberry Pi node |  | No
master_username | Username for the master Raspberry Pi node |  | No
porter-debug | Print debug information from Porter when executing the bundle |  | No
ssh_key | Private ssh key for authenticating with all Raspberry Pis |  | Yes
workers_ipAddress | Comma-separated array of IP addresses of the worker Raspberry Pi nodes, e.g. '192.168.0.60,192.168.0.61,192.168.0.62' |  | No
workers_username | Comma-separated array of usernames for the worker Raspberry Pi nodes, e.g. 'pi,pi,pi' |  | No | 
