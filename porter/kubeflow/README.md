# KubeFlow on Kubernetes

This bundle installs the [KubeFlow](https://www.kubeflow.org/) application into a Kubernetes cluster.

The installation is based on the [KubeFlow on Azure](https://www.kubeflow.org/docs/azure/deploy/install-kubeflow/) installation instructions from the KubeFlow documentation.

## Deploy from Azure


You will need to create a service principal in order to use the 'Deploy from Azure' buttons.


For detailed instructions on deploying from Azure, including how to setup the service principal, see [Consuming: Deploy from Azure](../../docs/consuming.md#deploy-from-azure)

### Simple deployment


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-cnab-quickstarts%2Fmaster%2Fporter%2Fkubeflow%2Fazuredeploy-simple.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>

### Advanced deployment


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-cnab-quickstarts%2Fmaster%2Fporter%2Fkubeflow%2Fazuredeploy-advanced.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>


## Deploy from Cloud Shell


For detailed instructions on deploying from Cloud Shell, including how to setup the Cloud Shell environment, see [Consuming: Deploy from Cloud Shell](../../docs/consuming.md#deploy-from-cloud-shell)


```porter install --tag cnabquickstarts.azurecr.io/porter/kubeflow/bundle:latest -d azure```


## Parameters and Credentials

 | Name | Description | Default | Required | 
 | --- | --- | --- | --- | 
 | kubeconfig |  |  | Yes
kubeflow_name | The name of the KubeFlow deployment |  | No
kustomize_manifest | The URL to the Kustomize manifest to use as the configuration file |  | No
porter-debug | Print debug information from Porter when executing the bundle |  | No | 


## Known issues

- [Kubeflow installation fails](https://github.com/Azure/azure-cnab-quickstarts/issues/50)