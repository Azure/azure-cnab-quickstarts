## Deploy from Azure

For detailed instructions on deploying from Azure, including how to setup the service principal, see [Consuming: Deploy from Azure](../../docs/consuming.md#deploy-from-azure)

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-cnab-quickstarts%2Fporter-ansible%2Fporter%2Fansible%2Fazuredeploy.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>


## Deploy from Cloud Shell

For detailed instructions on deploying from Cloud Shell, including how to setup the Cloud Shell environment, see [Consuming: Deploy from Cloud Shell](../../docs/consuming.md#deploy-from-cloud-shell)

```porter install --tag cnabquickstarts.azurecr.io/porter/ansible/bundle:latest --param environment_name=example -d azure```


## Deploy from your local machine

The provided PowerShell script [test.ps1](./test.ps1) can be used to build & test the bundle provided you have the following pre-requisites:

* PowerShell/PowerShell Core
* Docker (running Linux containers)
* Service principal details set in the following environment variables:
    * AZURE_CLIENT_ID
    * AZURE_SECRET
    * AZURE_SUBSCRIPTION_ID
    * AZURE_TENANT

```./test.ps1 -action install -environmentName example```


## Parameters and Credentials

 | Name | Description | Default | Required | 
 | --- | --- | --- | --- | 
 | azure_client_id | AAD Client ID for Azure account authentication - used by Ansible to provision Azure resources |  | Yes
azure_client_secret | AAD Client Secret for Azure account authentication |  | Yes 
azure_subscription_id | Azure Subscription Id used to set the subscription |  | Yes
azure_tenant | Azure AAD Tenant Id for Azure account authentication |  | Yes
environment_name | The Ansible environment/inventory containing the required configuration |  | Yes
ssh_private_key | The PEM-formatted SSH private key that has access to the VM(s) admin account |  | Yes
ssh_public_key | The PEM-formatted SSH public key that has access to the VM(s) admin account (i.e. the matching counterpart to the above private key) |  | Yes
porter-debug | Print debug information from Porter when executing the bundle |  | No
