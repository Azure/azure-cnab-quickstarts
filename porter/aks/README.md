# Azure Kubernetes Service (AKS)

This Bundle installs an instance of Azure Kubernetes Service (AKS)

## Deploy from Azure


You will need to create a service principal in order to use the 'Deploy from Azure' buttons.


For detailed instructions on deploying from Azure, including how to setup the service principal, see [Consuming: Deploy from Azure](../../docs/consuming.md#deploy-from-azure)

### Simple deployment


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-cnab-quickstarts%2Fmaster%2Fporter%2Faks%2Fazuredeploy-simple.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>

### Advanced deployment


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-cnab-quickstarts%2Fmaster%2Fporter%2Faks%2Fazuredeploy-advanced.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>


## Deploy from Cloud Shell


For detailed instructions on deploying from Cloud Shell, including how to setup the Cloud Shell environment, see [Consuming: Deploy from Cloud Shell](../../docs/consuming.md#deploy-from-cloud-shell)


```porter install --tag cnabquickstarts.azurecr.io/porter/aks/bundle:0.1.3-pull-29-merge.1-131 -d azure```


## Parameters and Credentials

 | Name | Description | Default | Required | 
 | --- | --- | --- | --- | 
 | azure_client_id | AAD Client ID for Azure account authentication - used for AKS Cluster SPN details and for authentication to azure to get KubeConfig |  | Yes
azure_client_secret | AAD Client Secret for Azure account authentication - used for AKS Cluster SPN details and for authentication to azure to get KubeConfig |  | Yes
azure_location | The Azure location to create the resources in |  | Yes
azure_subscription_id | Azure Subscription Id used to set the subscription where the account has access to multiple subscriptions |  | Yes
azure_tenant_id | Azure AAD Tenant Id for Azure account authentication - used to authenticate to Azure to get KubeConfig |  | Yes
cluster_name | The name to use for the AKS Cluster |  | Yes
kubernetes_version | The Kubernetes version to use |  | No
node_count | The VM size to use for the cluster |  | No
node_vm_size | The VM size to use for the cluster |  | No
porter-debug | Print debug information from Porter when executing the bundle |  | No
resource_group | The name of the resource group to create the AKS Cluster in |  | Yes
vm_set_type | Agent pool VM set type |  | No | 


## Known issues

- ~~[ERROR instead of WARNING on cluster name doesn't exist](https://github.com/Azure/azure-cnab-quickstarts/issues/28)~~
- ~~[portal says template not available](https://github.com/Azure/azure-cnab-quickstarts/issues/30)~~