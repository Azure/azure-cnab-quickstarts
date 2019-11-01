# Mattermost Team Edition on Kubernetes

## Simple deployment

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-cnab-quickstarts%2Fmaster%2Fporter%2Fmattermost-team-edition%2Fazuredeploy-simple.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>

## Advanced deployment

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-cnab-quickstarts%2Fmaster%2Fporter%2Fmattermost-team-edition%2Fazuredeploy-advanced.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>

TODO: Write instructions

## Parameters and Credentials

 | Name | Description | 
 | --- | --- | 
 | externalDB_enabled | Enables use of an preconfigured external database server
externalDB_externalConnectionString | See the section about external databases.
externalDB_externalDriverType | External driver type (postgres or mysql)
extraEnvVars | Extra environments variables to be used in the deployments
extraInitContainers | Additional init containers
extraPodAnnotations | Extra pod annotations to be used in the deployments
helm_chart_version | Version of the mattermost/mattermost-team-edition Helm chart to use for deployment
image_imagePullPolicy | Container image pull policy
image_repository | Container image repository
image_tag | Container image tag
ingress_annotations | Annotations for the ingress
ingress_enabled | If true, an ingress is created
ingress_hosts | A list of ingress hosts
ingress_path | Path of the web server
ingress_tls | A list of ingress tls items
initContainerImage_imagePullPolicy | Container image pull policy
initContainerImage_repository | Init container image repository
initContainerImage_tag | Init container image tag
installation_name | Installation name for Helm deployment
kubeconfig | 
mysql_enabled | Enables deployment of a mysql server
mysql_mysqlDatabase | Database name (Required)
mysql_mysqlPassword | User Password for Mysql (Required)
mysql_mysqlRootPassword | Root Password for Mysql (Optional)
mysql_mysqlUser | Username for Mysql (Required)
namespace | Kubernetes namespace for installation
porter-debug | Print debug information from Porter when executing the bundle
revisionHistoryLimit | How many old ReplicaSets for Mattermost Deployment you want to retain | 
