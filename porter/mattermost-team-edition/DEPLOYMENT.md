## Deploy from Azure


You will need to create a service principal in order to use the 'Deploy from Azure' buttons.


For detailed instructions on deploying from Azure, including how to setup the service principal, see [Consuming: Deploy from Azure](../../docs/consuming.md#deploy-from-azure)

### Simple deployment


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-cnab-quickstarts%2Fmattermost-instructions%2Fporter%2Fmattermost-team-edition%2Fazuredeploy-simple.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>

### Advanced deployment


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-cnab-quickstarts%2Fmattermost-instructions%2Fporter%2Fmattermost-team-edition%2Fazuredeploy-advanced.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>


## Deploy from Cloud Shell


For detailed instructions on deploying from Cloud Shell, including how to setup the Cloud Shell environment, see [Consuming: Deploy from Cloud Shell](../../docs/consuming.md#deploy-from-cloud-shell)


```porter install --tag cnabquickstarts.azurecr.io/porter/mattermost-team-edition:0.1.0-pull-21-merge.1-103 -d azure```


## Parameters and Credentials

 | Name | Description | Default | Required | 
 | --- | --- | --- | --- | 
 | externalDB_enabled | Enables use of an preconfigured external database server |  | No
externalDB_externalConnectionString | See the section about external databases. |  | No
externalDB_externalDriverType | External driver type (postgres or mysql) |  | No
extraEnvVars | Extra environments variables to be used in the deployments |  | No
extraInitContainers | Additional init containers |  | No
extraPodAnnotations | Extra pod annotations to be used in the deployments |  | No
helm_chart_version | Version of the mattermost/mattermost-team-edition Helm chart to use for deployment |  | No
image_imagePullPolicy | Container image pull policy |  | No
image_repository | Container image repository |  | No
image_tag | Container image tag |  | No
ingress_annotations | Annotations for the ingress |  | No
ingress_enabled | If true, an ingress is created |  | No
ingress_hosts | A list of ingress hosts |  | No
ingress_path | Path of the web server |  | No
ingress_tls | A list of ingress tls items |  | No
initContainerImage_imagePullPolicy | Container image pull policy |  | No
initContainerImage_repository | Init container image repository |  | No
initContainerImage_tag | Init container image tag |  | No
installation_name | Installation name for Helm deployment |  | No
kubeconfig |  |  | Yes
mysql_enabled | Enables deployment of a mysql server |  | No
mysql_mysqlDatabase | Database name (Required) |  | No
mysql_mysqlPassword | User Password for Mysql (Required) |  | Yes
mysql_mysqlRootPassword | Root Password for Mysql (Optional) |  | No
mysql_mysqlUser | Username for Mysql (Required) |  | Yes
namespace | Kubernetes namespace for installation |  | No
porter-debug | Print debug information from Porter when executing the bundle |  | No
revisionHistoryLimit | How many old ReplicaSets for Mattermost Deployment you want to retain |  | No | 
