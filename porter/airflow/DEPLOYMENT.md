## Deploy from Azure


You will need to create a service principal in order to use the 'Deploy from Azure' buttons.


For detailed instructions on deploying from Azure, including how to setup the service principal, see [Consuming: Deploy from Azure](../../docs/consuming.md#deploy-from-azure)

### Simple deployment


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-cnab-quickstarts%2Fmaster%2Fporter%2Fairflow%2Fazuredeploy-simple.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>

### Advanced deployment


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-cnab-quickstarts%2Fmaster%2Fporter%2Fairflow%2Fazuredeploy-advanced.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>


## Deploy from Cloud Shell


For detailed instructions on deploying from Cloud Shell, including how to setup the Cloud Shell environment, see [Consuming: Deploy from Cloud Shell](../../docs/consuming.md#deploy-from-cloud-shell)


```porter install --tag cnabquickstarts.azurecr.io/porter/airflow/bundle:latest -d azure```


## Parameters and Credentials

 | Name | Description | Default | Required | 
 | --- | --- | --- | --- | 
 | affinity | Affinity labels for pod assignment |  | No
airflow_config | custom airflow configuration env variables |  | No
airflow_executor | the executor to run |  | No
airflow_extraConfigmapMounts | Additional configMap volume mounts on the airflow pods. |  | No
airflow_extraContainers | additional containers to run in the scheduler, worker & web pods |  | No
airflow_extraEnv | specify additional environment variables to mount |  | No
airflow_extraInitContainers | additional Init Containers to run in the scheduler pods |  | No
airflow_extraVolumeMounts | additional volumeMounts to the main container in scheduler, worker & web pods |  | No
airflow_extraVolumes | additional volumes for the scheduler, worker & web pods |  | No
airflow_fernetKey | Fernet key |  | No
airflow_image_pullPolicy | Image pull policy |  | No
airflow_image_pullSecret | Image pull secret |  | No
airflow_image_repository | Airflow docker image |  | No
airflow_image_tag | Airflow docker tag |  | No
airflow_initRetryLoop | max number of retries during container init |  | No
airflow_initdb | run airflow initdb when starting the scheduler |  | No
airflow_name |  |  | No
airflow_podAnnotations | annotations for scheduler, worker and web pods |  | No
airflow_podDisruptionBudget | control pod disruption budget |  | No
airflow_schedulerNumRuns | -1 to loop indefinitively, 1 to restart after each exec |  | No
airflow_service_annotations | service annotations for Airflow UI |  | No
airflow_service_externalPort | external port for Airflow UI |  | No
airflow_service_nodePort_http | when using service.type == NodePort, an optional NodePort to request |  | No
airflow_service_type | service type for Airflow UI |  | No
airflow_webReplicas | how many replicas for web server |  | No
dags_doNotPickle | should the scheduler disable DAG pickling |  | No
dags_git_ref | branch name, tag or sha1 to reset to |  | No
dags_git_secret | name of a secret containing an ssh deploy key |  | No
dags_git_url | url to clone the git repository |  | No
dags_initContainer_enabled | Fetch the source code when the pods starts |  | No
dags_initContainer_image_repository | Init container Docker image. |  | No
dags_initContainer_image_tag | Init container Docker image tag. |  | No
dags_initContainer_installRequirements | auto install requirements.txt deps |  | No
dags_path | mount path for persistent volume |  | No
flower_resources | custom resource configuration for flower pod |  | No
flower_service_annotations | service annotations for Flower UI |  | No
flower_service_externalPort | external port for Flower UI |  | No
flower_service_type | service type for Flower UI |  | No
ingress_enabled | enable ingress |  | No
ingress_flower_annotations | annotations for the flower ui ingress |  | No
ingress_flower_host | hostname for the flower ui |  | No
ingress_flower_livenessPath | path to the liveness probe |  | No
ingress_flower_path | path of the flower ui |  | No
ingress_flower_tls_enabled | enables TLS termination at the ingress |  | No
ingress_flower_tls_secretName | name of the secret containing the TLS certificate & key |  | No
ingress_web_annotations | annotations for the web ui ingress |  | No
ingress_web_host | hostname for the webserver ui |  | No
ingress_web_livenessPath | path to the web liveness probe |  | No
ingress_web_path | path of the webserver ui |  | No
ingress_web_tls_enabled | enables TLS termination at the ingress |  | No
ingress_web_tls_secretName | name of the secret containing the TLS certificate & key |  | No
kubeconfig |  |  | Yes
logsPersistence_accessMode | PVC access mode |  | No
logsPersistence_enabled | enable persistent storage for logs |  | No
logsPersistence_existingClaim | if using an existing claim, specify the name here |  | No
logsPersistence_size | Persistant storage size request |  | No
logsPersistence_storageClass | Persistent Volume Storage Class |  | No
logsPersistence_subPath | (optional) relative path on the volume to use for logs |  | No
logs_path | mount path for logs persistent volume |  | No
namespace |  |  | No
nodeSelector | Node labels for pod assignment |  | No
persistence_accessMode | PVC access mode |  | No
persistence_enabled | enable persistence storage for DAGs |  | No
persistence_existingClaim | if using an existing claim, specify the name here |  | No
persistence_size | Persistant storage size request |  | No
persistence_storageClass | Persistent Volume Storage Class |  | No
persistence_subPath | (optional) relative path on the volume to use for DAGs |  | No
porter-debug | Print debug information from Porter when executing the bundle |  | No
postgresql_enabled | create a postgres server |  | No
postgresql_existingSecret | The name of an existing secret with a key named postgresql.existingSecretKey to use as the password |  | No
postgresql_existingSecretKey | The name of the key containing the password in the secret named postgresql.existingSecret |  | No
postgresql_persistance_accessMode | Access mode |  | No
postgresql_persistance_storageClass | Persistant class |  | No
postgresql_persistence_enabled | Enable Postgres PVC |  | No
postgresql_postgresDatabase | PostgreSQL Database name |  | No
postgresql_postgresHost | PostgreSQL Hostname |  | No
postgresql_postgresPassword | PostgreSQL Password |  | No
postgresql_postgresUser | PostgreSQL User |  | No
postgresql_uri | full URL to custom postgres setup |  | No
prometheusRule_additionalLabels | add additional labels to the prometheus rule |  | No
prometheusRule_enabled | enable prometheus rule |  | No
prometheusRule_groups | define alerting rules |  | No
rbac_create | create RBAC resources |  | No
redis_cluster_enabled | enable master-slave cluster |  | No
redis_enabled | Create a Redis cluster |  | No
redis_existingSecret | The name of an existing secret with a key named redis.existingSecretKey to use as the password |  | No
redis_existingSecretKey | The name of the key containing the password in the secret named redis.existingSecret |  | No
redis_master_persistence_enabled | Enable Redis PVC |  | No
redis_password | Redis password |  | No
redis_redisHost | Redis Hostname |  | No
scheduler_resources | custom resource configuration for scheduler pod |  | No
serviceAccount_create | create a service account |  | No
serviceAccount_name | the service account name |  | No
serviceMonitor_enabled | enable service monitor |  | No
serviceMonitor_interval | Interval at which metrics should be scraped |  | No
serviceMonitor_path | The path at which the metrics should be scraped |  | No
serviceMonitor_selector | label Selector for Prometheus to find ServiceMonitors |  | No
tolerations | Toleration labels for pod assignment |  | No
web_initialDelaySeconds | initial delay on livenessprobe before checking if webserver is available |  | No
web_initialStartupDelay | amount of time webserver pod should sleep before initializing webserver |  | No
web_livenessProbe_failureThreshold | Minimum consecutive successes for the probe to be considered failed |  | No
web_livenessProbe_periodSeconds | interval between probes |  | No
web_livenessProbe_successThreshold | Minimum consecutive successes for the probe to be considered successful |  | No
web_livenessProbe_timeoutSeconds | time allowed for a result to return |  | No
web_readinessProbe_failureThreshold | Minimum consecutive successes for the probe to be considered failed |  | No
web_readinessProbe_periodSeconds | interval between probes |  | No
web_readinessProbe_successThreshold | Minimum consecutive successes for the probe to be considered successful |  | No
web_readinessProbe_timeoutSeconds | time allowed for a result to return |  | No
web_resources | custom resource configuration for web pod |  | No
web_secrets | secrets to mount as volumes on webserver nodes |  | No
web_secretsDir | directory in which to mount secrets on webserver nodes |  | No
workers_celery_instances | number of parallel celery tasks per worker |  | No
workers_enabled | enable workers |  | No
workers_podAnnotations | annotations for the worker pods |  | No
workers_replicas | number of workers pods to launch |  | No
workers_resources | custom resource configuration for worker pod |  | No
workers_secrets | secrets to mount as volumes on worker nodes |  | No
workers_secretsDir | directory in which to mount secrets on worker nodes |  | No | 
