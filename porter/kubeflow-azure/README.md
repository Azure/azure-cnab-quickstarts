# KubeFlow end-to-end pipeline example on AKS

This quickstart is based on [End-to-End Pipeline Example on Azure](https://www.kubeflow.org/docs/azure/azureendtoend/) from the Kubeflow documentation.

The bundle creates the following Azure resources:
- Azure Kubernetes Service (AKS) cluster
- Azure Machine Learning Workspace
- Azure Container Registry (ACR) instance

The bundle also creates a service principal (in Azure Active Directory) that will be used by Kubeflow. Because of this, the service principal used as the credentials for the bundle must itself have permissions to create new service principals in the AAD tenant. See section below on how to set up this service principal.

After creating the Azure resources and service principal, the bundle will install Kubeflow onto the AKS cluster.

It then sets up and runs an example ML pipeline (for recognising images of tacos vs. burritos). The bundle builds container images from the Kubeflow examples repo and publishes them to the ACR instance that was deployed. Finally, the Kubeflow pipeline is compiled and uploaded to Kubeflow, and a new pipeline run is triggered, using parameters based on the resources and service principal that were created as part of the installation.

The Kubeflow dashboard is exposed via a public IP that will be displayed in the output of the bundle installation (NOTE: no authentication is applied to this endpoint for this quickstart).

You can browse to the dashboard using this IP address, where you should see that the 'tacosandburritos' pipeline has been uploaded, and a pipeline run 'tacosandburritos' has been triggered.

## Setting up the service principal

In order to create other service principals, the application associated with the service principal should be granted the Azure AD Graph Application.ReadWrite.All permission. First, use an existing service principal, or create a new one using the Azure CLI:

```
az ad sp create-for-rbac -n <name-of-service-principal>
```

You can do then grant permissions to this service principal to create other service principals. Do this via the Azure Portal (as a user with AAD admin privileges).

Go to Azure Active Directory > Applications, and find the application for your service principal. Then go to the API Permissions tab and select 'Add a permission'. Select the 'Azure Active Directory Graph' API, then 'Application permissions', and then select 'Application.ReadWrite.All'.

![Azure Active Directory Graph - Application.ReadWrite.All](images/aad-permissions.png)

Add the permission, then click the 'Grant admin consent for...' button.








## Deploy from Azure


You will need to create a service principal in order to use the 'Deploy from Azure' buttons.


For detailed instructions on deploying from Azure, including how to setup the service principal, see [Consuming: Deploy from Azure](../../docs/consuming.md#deploy-from-azure)

### Simple deployment


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-cnab-quickstarts%2Fkubeflow-azure%2Fporter%2Fkubeflow-azure%2Fazuredeploy-simple.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>

### Advanced deployment


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-cnab-quickstarts%2Fkubeflow-azure%2Fporter%2Fkubeflow-azure%2Fazuredeploy-advanced.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>


## Deploy from Cloud Shell


For detailed instructions on deploying from Cloud Shell, including how to setup the Cloud Shell environment, see [Consuming: Deploy from Cloud Shell](../../docs/consuming.md#deploy-from-cloud-shell)


```porter install --tag cnabquickstarts.azurecr.io/porter/kubeflow-azure/bundle:0.1.0-pull-31-merge.1-141 -d azure```


## Parameters and Credentials

 | Name | Description | Default | Required | 
 | --- | --- | --- | --- | 
 | acr_name | The name to use for the Azure Container Registry |  | Yes
azure_client_id | AAD Client ID for Azure account authentication - used for AKS Cluster SPN details and for authentication to azure to get KubeConfig |  | Yes
azure_client_secret | AAD Client Secret for Azure account authentication - used for AKS Cluster SPN details and for authentication to azure to get KubeConfig |  | Yes
azure_location | The Azure location to create the resources in |  | Yes
azure_subscription_id | Azure Subscription Id used to set the subscription where the account has access to multiple subscriptions |  | Yes
azure_tenant_id | Azure AAD Tenant Id for Azure account authentication - used to authenticate to Azure to get KubeConfig |  | Yes
cluster_name | The name to use for the AKS Cluster |  | Yes
kubeflow_name | The name of the KubeFlow deployment |  | No
kubernetes_version | The Kubernetes version to use |  | No
kustomize_manifest | The URL to the Kustomize manifest to use as the configuration file |  | No
ml_workspace_name | The name to use for the Azure ML workspace |  | Yes
node_count | The VM size to use for the cluster |  | No
node_vm_size | The VM size to use for the cluster |  | No
porter-debug | Print debug information from Porter when executing the bundle |  | No
resource_group | The name of the resource group to create the AKS Cluster in |  | Yes
service_principal_name | The name to use for the service principal created |  | Yes
vm_set_type | Agent pool VM set type |  | No | 
