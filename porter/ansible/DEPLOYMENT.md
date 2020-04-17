## Deploy from Azure


You will need to create a service principal in order to use the 'Deploy from Azure' buttons.


For detailed instructions on deploying from Azure, including how to setup the service principal, see [Consuming: Deploy from Azure](../../docs/consuming.md#deploy-from-azure)

### Simple deployment


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-cnab-quickstarts%2Fporter-ansible%2Fporter%2Fansible%2Fazuredeploy-simple.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>

### Advanced deployment


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-cnab-quickstarts%2Fporter-ansible%2Fporter%2Fansible%2Fazuredeploy-advanced.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>


## Deploy from Cloud Shell


For detailed instructions on deploying from Cloud Shell, including how to setup the Cloud Shell environment, see [Consuming: Deploy from Cloud Shell](../../docs/consuming.md#deploy-from-cloud-shell)


```porter install --tag cnabquickstarts.azurecr.io/porter/ansible/bundle:0.2.0-pull-85-merge.1-256 -d azure```


## Parameters and Credentials

 | Name | Description | Default | Required | 
 | --- | --- | --- | --- | 
 | azure_client_id | AAD Client Id for Azure account authentication - used by Ansible |  | Yes
azure_client_secret | AAD Client Secret for Azure account authentication - used by Ansible |  | Yes
azure_subscription_id | Azure Subscription Id used to set the subscription where the account has access to multiple subscriptions |  | Yes
azure_tenant_id | Azure AAD Tenant Id for Azure account authentication - used by Ansible |  | Yes
environment_name | Specifies which Ansible inventory/environment to get configuration from |  | Yes
porter-debug | Print debug information from Porter when executing the bundle |  | No
ssh_private_key_base64 | The SSH private key used by Ansible to connect to the provisioned VMs |  | Yes
ssh_public_key | The SSH public key to be granted admin access to the provisioned VMs |  | Yes | 
