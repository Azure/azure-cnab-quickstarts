# Installs Dapr on a Kubernetes cluster, using the official Dapr Helm chart

This bundle bootstraps all of [Dapr](https://dapr.io/) Operator components into a Kubernetes cluster.

The bundle is based on the official Helm chart for Dapr (more information about the Helm chart can be found on the [GitHub page](https://github.com/dapr/dapr/tree/master/charts/dapr)).

To install on AKS, keep all parameters as defaults.

To install on Kubernetes cluster running on ARM based devices (e.g. Raspberry Pi), set the `global_tag` parameter for the bundle to `0.3.0-arm`. If you are installing on a Raspberry Pi cluster, you may also find the [Pi K3s bundle](https://github.com/Azure/azure-cnab-quickstarts/tree/master/porter/pi-k-three-s) useful for setting up Kubernetes on the devices.

## Deploy from Azure


You will need to create a service principal in order to use the 'Deploy from Azure' buttons.


For detailed instructions on deploying from Azure, including how to setup the service principal, see [Consuming: Deploy from Azure](../../docs/consuming.md#deploy-from-azure)

### Simple deployment


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-cnab-quickstarts%2Fdapr-update%2Fporter%2Fdapr%2Fazuredeploy-simple.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>

### Advanced deployment


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-cnab-quickstarts%2Fdapr-update%2Fporter%2Fdapr%2Fazuredeploy-advanced.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>


## Deploy from Cloud Shell


For detailed instructions on deploying from Cloud Shell, including how to setup the Cloud Shell environment, see [Consuming: Deploy from Cloud Shell](../../docs/consuming.md#deploy-from-cloud-shell)


```porter install --tag cnabquickstarts.azurecr.io/porter/dapr/bundle:0.1.0-pull-48-merge.1-186 -d azure```


## Parameters and Credentials

 | Name | Description | Default | Required | 
 | --- | --- | --- | --- | 
 | global_imagePullPolicy | Container image pull policy |  | No
global_repository | Container image repository |  | No
global_tag | Container image tag |  | No
helm_chart_version | Version of the dapr/dapr Helm chart to use for deployment |  | No
installation_name | Installation name for Helm deployment |  | No
kubeconfig |  |  | Yes
namespace | Kubernetes namespace for installation |  | No
porter-debug | Print debug information from Porter when executing the bundle |  | No | 


## Known issues

- ~~[won't uninstall](https://github.com/Azure/azure-cnab-quickstarts/issues/42)~~