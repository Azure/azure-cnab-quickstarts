# Wordpress on Kubernetes

This bundle installs the [Wordpress](https://wordpress.org/) application into a Kubernetes cluster.

The bundle is based on the official Helm chart for Wordpress (more information about the Helm chart can be found on the [GitHub page](https://github.com/helm/charts/tree/master/stable/wordpress)).

## Deploy from Azure


You will need to create a service principal in order to use the 'Deploy from Azure' buttons.


For detailed instructions on deploying from Azure, including how to setup the service principal, see [Consuming: Deploy from Azure](../../docs/consuming.md#deploy-from-azure)

### Simple deployment


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-cnab-quickstarts%2Fmaster%2Fporter%2Fwordpress%2Fazuredeploy-simple.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>

### Advanced deployment


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-cnab-quickstarts%2Fmaster%2Fporter%2Fwordpress%2Fazuredeploy-advanced.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>


## Deploy from Cloud Shell


For detailed instructions on deploying from Cloud Shell, including how to setup the Cloud Shell environment, see [Consuming: Deploy from Cloud Shell](../../docs/consuming.md#deploy-from-cloud-shell)


```porter install --tag cnabquickstarts.azurecr.io/porter/wordpress/bundle:latest -d azure```


## Parameters and Credentials

 | Name | Description | Default | Required | 
 | --- | --- | --- | --- | 
 | affinity | Map of node/pod affinities |  | No
allowEmptyPassword | Allow DB blank passwords |  | No
allowOverrideNone | Set Apache AllowOverride directive to None |  | No
customHTAccessCM | Configmap with custom wordpress-htaccess.conf directives |  | No
externalDatabase_database | Name of the existing database |  | No
externalDatabase_host | Host of the external database |  | No
externalDatabase_password | Password for the above username |  | No
externalDatabase_port | Database port number |  | No
externalDatabase_user | Existing username in the external db |  | No
extraEnv | Additional container environment variables |  | No
extraVolumeMounts | Additional volume mounts |  | No
extraVolumes | Additional volumes |  | No
fullnameOverride | String to fully override wordpress.fullname template with a string |  | No
global_imagePullSecrets | Global Docker registry secret names as an array |  | No
global_imageRegistry | Global Docker image registry |  | No
global_storageClass | Global storage class for dynamic provisioning |  | No
healthcheckHttps | Use https for liveliness and readiness |  | No
helm_chart_version | Version number for the Helm chart |  | No
image_pullPolicy | Image pull policy |  | No
image_pullSecrets | Specify docker-registry secret names as an array |  | No
image_registry | WordPress image registry |  | No
image_repository | WordPress image name |  | No
image_tag | WordPress image tag |  | No
ingress_annotations | Ingress annotations |  | No
ingress_certManager | Add annotations for cert-manager |  | No
ingress_enabled | Enable ingress controller resource |  | No
ingress_hostname | Default host for the ingress resource |  | No
ingress_hosts_0_name | Hostname to your Wordpress installation |  | No
ingress_hosts_0_path | Path within the url structure |  | No
ingress_secrets | TLS Secrets |  | No
ingress_tls_0_hosts_0 | TLS hosts |  | No
ingress_tls_0_secretName | TLS Secret (certificates) |  | No
installation_name | Installation name for Helm deployment |  | No
kubeconfig |  |  | Yes
livenessProbeHeaders | Headers to use for livenessProbe |  | No
livenessProbe_failureThreshold | Minimum consecutive failures for the probe |  | No
livenessProbe_initialDelaySeconds | Delay before liveness probe is initiated |  | No
livenessProbe_periodSeconds | How often to perform the probe |  | No
livenessProbe_successThreshold | Minimum consecutive successes for the probe |  | No
livenessProbe_timeoutSeconds | When the probe times out |  | No
mariadb_db_name | Database name to create |  | No
mariadb_db_password | Password for the database |  | No
mariadb_db_user | Database user to create |  | No
mariadb_enabled | Deploy MariaDB container(s) |  | No
mariadb_rootUser_password | MariaDB admin password |  | No
metrics_enabled | Start a side-car prometheus exporter |  | No
metrics_image_pullPolicy | Image pull policy |  | No
metrics_image_pullSecrets | Specify docker-registry secret names as an array |  | No
metrics_image_registry | Apache exporter image registry |  | No
metrics_image_repository | Apache exporter image name |  | No
metrics_image_tag | Apache exporter image tag |  | No
metrics_podAnnotations | Additional annotations for Metrics exporter pod |  | No
metrics_resources | Exporter resource requests/limit |  | No
metrics_serviceMonitor_additionalLabels | Used to pass Labels that are required by the Installed Prometheus Operator |  | No
metrics_serviceMonitor_enabled | Create ServiceMonitor Resource for scraping metrics using PrometheusOperator |  | No
metrics_serviceMonitor_honorLabels | honorLabels chooses the metric's labels on collisions with target labels. |  | No
metrics_serviceMonitor_interval | Specify the interval at which metrics should be scraped |  | No
metrics_serviceMonitor_namespace | Namespace where servicemonitor resource should be created |  | No
metrics_serviceMonitor_relabellings | Specify Metric Relabellings to add to the scrape endpoint |  | No
metrics_serviceMonitor_scrapeTimeout | Specify the timeout after which the scrape is ended |  | No
nameOverride | String to partially override wordpress.fullname template with a string (will prepend the release name) |  | No
namespace | Kubernetes namespace for installation |  | No
nodeSelector | Node labels for pod assignment |  | No
persistence_accessMode | PVC Access Mode |  | No
persistence_enabled | Enable persistence using PVC |  | No
persistence_existingClaim | Enable persistence using an existing PVC |  | No
persistence_size | PVC Storage Request |  | No
persistence_storageClass | PVC Storage Class |  | No
podAnnotations | Pod annotations |  | No
porter-debug | Print debug information from Porter when executing the bundle |  | No
readinessProbeHeaders | Headers to use for readinessProbe |  | No
readinessProbe_failureThreshold | Minimum consecutive failures for the probe |  | No
readinessProbe_initialDelaySeconds | Delay before readiness probe is initiated |  | No
readinessProbe_periodSeconds | How often to perform the probe |  | No
readinessProbe_successThreshold | Minimum consecutive successes for the probe |  | No
readinessProbe_timeoutSeconds | When the probe times out |  | No
replicaCount | Number of WordPress Pods to run |  | No
schedulerName | Name of the alternate scheduler |  | No
service_annotations | Service annotations |  | No
service_externalTrafficPolicy | Enable client source IP preservation |  | No
service_extraPorts | Extra ports to expose in the service (normally used with the sidecar value) |  | No
service_httpsPort | Service HTTPS port |  | No
service_httpsTargetPort | Service Target HTTPS port |  | No
service_metricsPort | Service Metrics port |  | No
service_nodePorts_http | Kubernetes http node port |  | No
service_nodePorts_https | Kubernetes https node port |  | No
service_nodePorts_metrics | Kubernetes metrics node port |  | No
service_port | Service HTTP port |  | No
service_type | Kubernetes Service type |  | No
sidecars | Attach additional containers to the pod |  | No
smtpHost | SMTP host |  | No
smtpPassword | SMTP password |  | No
smtpPort | SMTP port |  | No
smtpProtocol | SMTP protocol [tls, ssl, none] |  | No
smtpUser | SMTP user |  | No
smtpUsername | User name for SMTP emails |  | No
tolerations | List of node taints to tolerate |  | No
updateStrategy | Set up update strategy |  | No
wordpressBlogName | Blog name |  | No
wordpressEmail | Admin email |  | No
wordpressFirstName | First name |  | No
wordpressLastName | Last name |  | No
wordpressPassword | Application password |  | No
wordpressScheme | Scheme to generate application URLs [http, https] |  | No
wordpressSkipInstall | Skip wizard installation |  | No
wordpressTablePrefix | Table prefix |  | No
wordpressUsername | User of the application |  | No | 


## Known issues

- ~~[Test issue for demo](https://github.com/Azure/azure-cnab-quickstarts/issues/24)~~
- [fails with InvalidTemplate error](https://github.com/Azure/azure-cnab-quickstarts/issues/33)