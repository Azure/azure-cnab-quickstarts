# Apache Airflow on Kubernetes

## Simple deployment

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-cnab-quickstarts%2Fairflow-2%2Fporter%2Fairflow%2Fazuredeploy-simple.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>

## Advanced deployment

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-cnab-quickstarts%2Fairflow-2%2Fporter%2Fairflow%2Fazuredeploy-advanced.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>

TODO: Write instructions

## Parameters and Credentials

 | Name | Description | 
 | --- | --- | 
 | affinity | Affinity labels for pod assignment
airflow_config | custom airflow configuration env variables
airflow_executor | the executor to run
airflow_extraConfigmapMounts | Additional configMap volume mounts on the airflow pods.
airflow_extraContainers | additional containers to run in the scheduler, worker & web pods
airflow_extraEnv | specify additional environment variables to mount
airflow_extraInitContainers | additional Init Containers to run in the scheduler pods
airflow_extraVolumeMounts | additional volumeMounts to the main container in scheduler, worker & web pods
airflow_extraVolumes | additional volumes for the scheduler, worker & web pods
airflow_fernetKey | Fernet key
airflow_image_pullPolicy | Image pull policy
airflow_image_pullSecret | Image pull secret
airflow_image_repository | Airflow docker image
airflow_image_tag | Airflow docker tag
airflow_initRetryLoop | max number of retries during container init
airflow_initdb | run airflow initdb when starting the scheduler
airflow_name | 
airflow_podAnnotations | annotations for scheduler, worker and web pods
airflow_podDisruptionBudget | control pod disruption budget
airflow_schedulerNumRuns | -1 to loop indefinitively, 1 to restart after each exec
airflow_service_annotations | service annotations for Airflow UI
airflow_service_externalPort | external port for Airflow UI
airflow_service_nodePort_http | when using service.type == NodePort, an optional NodePort to request
airflow_service_type | service type for Airflow UI
airflow_webReplicas | how many replicas for web server
dags_doNotPickle | should the scheduler disable DAG pickling
dags_git_ref | branch name, tag or sha1 to reset to
dags_git_secret | name of a secret containing an ssh deploy key
dags_git_url | url to clone the git repository
dags_initContainer_enabled | Fetch the source code when the pods starts
dags_initContainer_image_repository | Init container Docker image.
dags_initContainer_image_tag | Init container Docker image tag.
dags_initContainer_installRequirements | auto install requirements.txt deps
dags_path | mount path for persistent volume
flower_resources | custom resource configuration for flower pod
flower_service_annotations | service annotations for Flower UI
flower_service_externalPort | external port for Flower UI
flower_service_type | service type for Flower UI
ingress_enabled | enable ingress
ingress_flower_annotations | annotations for the flower ui ingress
ingress_flower_host | hostname for the flower ui
ingress_flower_livenessPath | path to the liveness probe
ingress_flower_path | path of the flower ui
ingress_flower_tls_enabled | enables TLS termination at the ingress
ingress_flower_tls_secretName | name of the secret containing the TLS certificate & key
ingress_web_annotations | annotations for the web ui ingress
ingress_web_host | hostname for the webserver ui
ingress_web_livenessPath | path to the web liveness probe
ingress_web_path | path of the webserver ui
ingress_web_tls_enabled | enables TLS termination at the ingress
ingress_web_tls_secretName | name of the secret containing the TLS certificate & key
kubeconfig | 
logsPersistence_accessMode | PVC access mode
logsPersistence_enabled | enable persistent storage for logs
logsPersistence_existingClaim | if using an existing claim, specify the name here
logsPersistence_size | Persistant storage size request
logsPersistence_storageClass | Persistent Volume Storage Class
logsPersistence_subPath | (optional) relative path on the volume to use for logs
logs_path | mount path for logs persistent volume
namespace | 
nodeSelector | Node labels for pod assignment
persistence_accessMode | PVC access mode
persistence_enabled | enable persistence storage for DAGs
persistence_existingClaim | if using an existing claim, specify the name here
persistence_size | Persistant storage size request
persistence_storageClass | Persistent Volume Storage Class
persistence_subPath | (optional) relative path on the volume to use for DAGs
porter-debug | Print debug information from Porter when executing the bundle
postgresql_enabled | create a postgres server
postgresql_existingSecret | The name of an existing secret with a key named postgresql.existingSecretKey to use as the password
postgresql_existingSecretKey | The name of the key containing the password in the secret named postgresql.existingSecret
postgresql_persistance_accessMode | Access mode
postgresql_persistance_storageClass | Persistant class
postgresql_persistence_enabled | Enable Postgres PVC
postgresql_postgresDatabase | PostgreSQL Database name
postgresql_postgresHost | PostgreSQL Hostname
postgresql_postgresPassword | PostgreSQL Password
postgresql_postgresUser | PostgreSQL User
postgresql_uri | full URL to custom postgres setup
prometheusRule_additionalLabels | add additional labels to the prometheus rule
prometheusRule_enabled | enable prometheus rule
prometheusRule_groups | define alerting rules
rbac_create | create RBAC resources
redis_cluster_enabled | enable master-slave cluster
redis_enabled | Create a Redis cluster
redis_existingSecret | The name of an existing secret with a key named redis.existingSecretKey to use as the password
redis_existingSecretKey | The name of the key containing the password in the secret named redis.existingSecret
redis_master_persistence_enabled | Enable Redis PVC
redis_password | Redis password
redis_redisHost | Redis Hostname
scheduler_resources | custom resource configuration for scheduler pod
serviceAccount_create | create a service account
serviceAccount_name | the service account name
serviceMonitor_enabled | enable service monitor
serviceMonitor_interval | Interval at which metrics should be scraped
serviceMonitor_path | The path at which the metrics should be scraped
serviceMonitor_selector | label Selector for Prometheus to find ServiceMonitors
tolerations | Toleration labels for pod assignment
web_initialDelaySeconds | initial delay on livenessprobe before checking if webserver is available
web_initialStartupDelay | amount of time webserver pod should sleep before initializing webserver
web_livenessProbe_failureThreshold | Minimum consecutive successes for the probe to be considered failed
web_livenessProbe_periodSeconds | interval between probes
web_livenessProbe_successThreshold | Minimum consecutive successes for the probe to be considered successful
web_livenessProbe_timeoutSeconds | time allowed for a result to return
web_readinessProbe_failureThreshold | Minimum consecutive successes for the probe to be considered failed
web_readinessProbe_periodSeconds | interval between probes
web_readinessProbe_successThreshold | Minimum consecutive successes for the probe to be considered successful
web_readinessProbe_timeoutSeconds | time allowed for a result to return
web_resources | custom resource configuration for web pod
web_secrets | secrets to mount as volumes on webserver nodes
web_secretsDir | directory in which to mount secrets on webserver nodes
workers_celery_instances | number of parallel celery tasks per worker
workers_enabled | enable workers
workers_podAnnotations | annotations for the worker pods
workers_replicas | number of workers pods to launch
workers_resources | custom resource configuration for worker pod
workers_secrets | secrets to mount as volumes on worker nodes
workers_secretsDir | directory in which to mount secrets on worker nodes | 
