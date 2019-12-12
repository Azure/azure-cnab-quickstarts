# Installs an OAuth2 Proxy into an AKS cluster, configured with Azure Active Directory

This quickstart will configure a reverse OAuth2 Proxy in Kubernetes, which allows you to protect applications in the cluster using Azure Active Directory as the identity provider for authentication and authorization.

The quickstart first creates an Azure Active Directory application which is then used to configure the proxy. 

Pre-requisites:
- Kubernetes cluster
- NGINX ingress controller
- DNS configured for ingress controller
- TLS certificate for domain

Note:
The service principal used for this quickstart must have permissions to create AD applications in the target AD tenant.

## Deploy from Azure


You will need to create a service principal in order to use the 'Deploy from Azure' buttons.


For detailed instructions on deploying from Azure, including how to setup the service principal, see [Consuming: Deploy from Azure](../../docs/consuming.md#deploy-from-azure)

### Simple deployment


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-cnab-quickstarts%2Fmaster%2Fporter%2Faks-aad-oauth-proxy%2Fazuredeploy-simple.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>

### Advanced deployment


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-cnab-quickstarts%2Fmaster%2Fporter%2Faks-aad-oauth-proxy%2Fazuredeploy-advanced.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>


## Deploy from Cloud Shell


For detailed instructions on deploying from Cloud Shell, including how to setup the Cloud Shell environment, see [Consuming: Deploy from Cloud Shell](../../docs/consuming.md#deploy-from-cloud-shell)


```porter install --tag cnabquickstarts.azurecr.io/porter/aks-aad-oauth-proxy/bundle:latest -d azure```


## Parameters and Credentials

 | Name | Description | Default | Required | 
 | --- | --- | --- | --- | 
 | aad_application_name | Name for the Azure AD application that will be created |  | Yes
aad_application_secret | Secret (password) for the Azure AD application that will be created |  | Yes
azure_client_id | AAD Client ID for Azure account authentication - used for Az CLI |  | Yes
azure_client_secret | AAD Client Secret for Azure account authentication - used for Az CLI |  | Yes
azure_subscription_id | Azure Subscription Id used to set the subscription where the account has access to multiple subscriptions |  | Yes
azure_tenant_id | Azure AAD Tenant Id for Azure account authentication  - used for Az CLI |  | Yes
fqdn | Fully qualified domain name |  | Yes
ingress_class | The type of ingress controller to use for the proxy ingress |  | No
kubeconfig |  |  | Yes
namespace | Kubernetes namespace for installation |  | No
porter-debug | Print debug information from Porter when executing the bundle |  | No
tls_secret_name | Name for TLS secret for oauth2-proxy ingress |  | No | 
