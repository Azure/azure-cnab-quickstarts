## Deploy from Azure


You will need to create a service principal in order to use the 'Deploy from Azure' buttons.


For detailed instructions on deploying from Azure, including how to setup the service principal, see [Consuming: Deploy from Azure](../../docs/consuming.md#deploy-from-azure)

### Simple deployment


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FJamesDawson%2Fazure-cnab-quickstarts%2Fporter-ansible%2Fporter%2Fansible%2Fazuredeploy-simple.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>

### Advanced deployment


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FJamesDawson%2Fazure-cnab-quickstarts%2Fporter-ansible%2Fporter%2Fansible%2Fazuredeploy-advanced.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>


## Deploy from Cloud Shell


For detailed instructions on deploying from Cloud Shell, including how to setup the Cloud Shell environment, see [Consuming: Deploy from Cloud Shell](../../docs/consuming.md#deploy-from-cloud-shell)


```porter install --tag readsourceacr.azurecr.io/porter/ansible/bundle:0.2.0-pull-1-merge.1-176 -d azure```


## Parameters and Credentials

 | Name | Description | Default | Required | 
 | --- | --- | --- | --- | 
 | azure_client_id |  |  | Yes
azure_secret |  |  | Yes
azure_subscription_id |  |  | Yes
azure_tenant |  |  | Yes
environment_name |  |  | Yes
porter-debug | Print debug information from Porter when executing the bundle |  | No
ssh_private_key |  |  | Yes
ssh_public_key |  |  | No | 
