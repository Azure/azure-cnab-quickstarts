## Deploy from Azure


You will need to create a service principal in order to use the 'Deploy from Azure' buttons.


For detailed instructions on deploying from Azure, including how to setup the service principal, see [Consuming: Deploy from Azure](../../docs/consuming.md#deploy-from-azure)

### Simple deployment


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-cnab-quickstarts%2Fmaster%2Fporter%2Fghost%2Fazuredeploy-simple.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>

### Advanced deployment


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-cnab-quickstarts%2Fmaster%2Fporter%2Fghost%2Fazuredeploy-advanced.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>


## Deploy from Cloud Shell


For detailed instructions on deploying from Cloud Shell, including how to setup the Cloud Shell environment, see [Consuming: Deploy from Cloud Shell](../../docs/consuming.md#deploy-from-cloud-shell)


```porter install --tag cnabquickstarts.azurecr.io/porter/ghost/bundle:latest -d azure```


## Parameters and Credentials

 | Name | Description | Default | Required | 
 | --- | --- | --- | --- | 
 | affinity | Map of node/pod affinities |  | No
allowEmptyPassword | Allow DB blank passwords |  | No
externalDatabase_database | Name of the existing database |  | No
externalDatabase_host | Host of the external database |  | No
externalDatabase_password | Password for the above username |  | No
externalDatabase_port | Port of the external database |  | No
externalDatabase_user | Existing username in the external db |  | No
fullnameOverride | String to fully override ghost.fullname template with a string |  | No
ghostBlogTitle | Ghost Blog name |  | No
ghostEmail | Admin email |  | No
ghostHost | Ghost host to create application URLs |  | No
ghostPassword | Application password |  | Yes
ghostPath | Ghost path to create application URLs |  | No
ghostPort | Ghost port to use in application URLs |  | No
ghostProtocol | Protocol (http or https) to use in the application URLs |  | No
ghostUsername | User of the application |  | No
global_imagePullSecrets | Global Docker registry secret names as an array |  | No
global_imageRegistry | Global Docker image registry |  | No
global_storageClass | Global storage class for dynamic provisioning |  | No
helm_chart_version | Version number for the Helm chart |  | No
image_pullPolicy | Image pull policy |  | No
image_pullSecrets | Specify docker-registry secret names as an array |  | No
image_registry | Ghost image registry |  | No
image_repository | Ghost Image name |  | No
image_tag | Ghost Image tag |  | No
ingress_annotations | Ingress annotations |  | No
ingress_certManager | Add annotations for cert-manager |  | No
ingress_enabled | Enable ingress controller resource |  | No
ingress_hosts_0_name | Hostname to your Ghost installation |  | No
ingress_hosts_0_path | Path within the url structure |  | No
ingress_hosts_0_tls | Utilize TLS backend in ingress |  | No
ingress_hosts_0_tlsHosts | Array of TLS hosts for ingress record (defaults to ingress.hosts[0].name if nil) |  | No
ingress_hosts_0_tlsSecret | TLS Secret (certificates) |  | No
ingress_secrets_0_certificate | TLS Secret Certificate |  | No
ingress_secrets_0_key | TLS Secret Key |  | No
ingress_secrets_0_name | TLS Secret Name |  | No
installation_name | Installation name for Helm deployment |  | No
kubeconfig |  |  | Yes
mariadb_db_name | MariaDB Database name to create |  | No
mariadb_db_password | MariaDB Password for user |  | Yes
mariadb_db_user | MariaDB Database user to create |  | No
mariadb_enabled | Whether or not to install MariaDB (disable if using external) |  | No
mariadb_rootUser_password | MariaDB admin password |  | Yes
nameOverride | String to partially override ghost.fullname template with a string (will prepend the release name) |  | No
namespace | Kubernetes namespace for installation |  | No
persistence_accessMode | PVC Access Mode for Ghost volume |  | No
persistence_enabled | Enable persistence using PVC |  | No
persistence_path | Path to mount the volume at, to use other images |  | No
persistence_size | PVC Storage Request for Ghost volume |  | No
persistence_storageClass | PVC Storage Class for Ghost volume |  | No
porter-debug | Print debug information from Porter when executing the bundle |  | No
resources | CPU/Memory resource requests/limits |  | No
securityContext_enabled | Enable security context |  | No
securityContext_fsGroup | Group ID for the container |  | No
securityContext_runAsUser | User ID for the container |  | No
service_annotations | Service annotations |  | No
service_externalTrafficPolicy | Enable client source IP preservation |  | No
service_loadBalancerIP | LoadBalancerIP for the Ghost service |  | No
service_nodePorts_http | Kubernetes http node port |  | No
service_port | Service HTTP port |  | No
service_type | Kubernetes Service type |  | No
smtpFromAddress | SMTP from address |  | No
smtpHost | SMTP host |  | No
smtpPassword | SMTP password |  | No
smtpPort | SMTP port |  | No
smtpService | SMTP service |  | No
smtpUser | SMTP user |  | No
volumePermissions_image_pullPolicy | Init container volume-permissions image pull policy |  | No
volumePermissions_image_registry | Init container volume-permissions image registry |  | No
volumePermissions_image_repository | Init container volume-permissions image name |  | No
volumePermissions_image_tag | Init container volume-permissions image tag |  | No | 
