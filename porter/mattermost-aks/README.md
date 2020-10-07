# Mattermost on AKS

This bundle installs [Mattermost](https://mattermost.com/) on an [Azure Kubernetes Service](https://azure.microsoft.com/en-gb/services/kubernetes-service/) (AKS) cluster.

The bundle does the following:
- Deploys AKS cluster
- Installs [NGINX ingress controller](https://kubernetes.github.io/ingress-nginx/) and configures to use public DNS name
- Installs [cert-manager](https://github.com/jetstack/cert-manager) and configures to use [Let's Encrypt](https://letsencrypt.org/) to issue free SSL certificates
- Installs Mattermost (Enterprise or Team edition)

The Mattermost installation step uses the official Helm charts for Mattermost Enterprise/Team Edition (more information about the Helm charts can be found on the [GitHub page](https://github.com/mattermost/mattermost-helm/tree/master/charts)).

Once installed, the output will show the FQDN where you can access the Mattermost application.

## Deploy from Azure


You will need to create a service principal in order to use the 'Deploy from Azure' buttons.


For detailed instructions on deploying from Azure, including how to setup the service principal, see [Consuming: Deploy from Azure](../../docs/consuming.md#deploy-from-azure)

### Simple deployment


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-cnab-quickstarts%2Ffeature%2Fmattermost-aks%2Fporter%2Fmattermost-aks%2Fazuredeploy-simple.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>

### Advanced deployment


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-cnab-quickstarts%2Ffeature%2Fmattermost-aks%2Fporter%2Fmattermost-aks%2Fazuredeploy-advanced.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>


## Deploy from Cloud Shell


For detailed instructions on deploying from Cloud Shell, including how to setup the Cloud Shell environment, see [Consuming: Deploy from Cloud Shell](../../docs/consuming.md#deploy-from-cloud-shell)


```porter install --tag cnabquickstarts.azurecr.io/porter/mattermost-aks/bundle:0.1.0-pull-91-merge.1-285 -d azure```


## Parameters and Credentials

 | Name | Description | Default | Required | 
 | --- | --- | --- | --- | 
 | azure_client_id | AAD Client ID for Azure account authentication - used for Az CLI |  | Yes
azure_client_secret | AAD Client Secret for Azure account authentication - used for Az CLI |  | Yes
azure_location | The Azure location to create the resources in |  | Yes
azure_subscription_id | Azure Subscription Id used to set the subscription where the account has access to multiple subscriptions |  | Yes
azure_tenant_id | Azure AAD Tenant Id for Azure account authentication  - used for Az CLI |  | Yes
cluster_name | The name to use for the AKS Cluster |  | Yes
dns_name | The DNS name to to associate with public IP address for the FQDN |  | Yes
kubernetes_version | The Kubernetes version to use |  | No
letsencrypt_email | Valid email address to use for Let's Encrypt certificate |  | Yes
letsencrypt_environment | The environment to use for Let's Encrypt certificates |  | No
mattermost_edition | The edition of Mattermost to deploy (enterprise or team) |  | No
mattermost_license | License key for Mattermost Enterprise Edition |  | No
mysql_mysqlPassword | User Password for Mysql (Required) |  | Yes
mysql_mysqlRootPassword | Root Password for Mysql (Required) |  | Yes
mysql_mysqlUser | Username for Mysql (Required) |  | Yes
node_count | The VM size to use for the cluster |  | No
node_vm_size | The VM size to use for the cluster |  | No
porter-debug | Print debug information from Porter when executing the bundle |  | No
porter-fqdn-output | Wires up the fqdn output for use as a parameter. Porter internal parameter that should not be set manually. |  | No
resource_group | The name of the resource group to create the AKS Cluster in |  | Yes | 
