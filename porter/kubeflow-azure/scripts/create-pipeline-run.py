import kfp
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('pipeline_name')
parser.add_argument('experiment_name')
parser.add_argument('run_name')
parser.add_argument('tenant_id')
parser.add_argument('service_principal_id')
parser.add_argument('service_principal_password')
parser.add_argument('subscription_id')
parser.add_argument('resource_group')
parser.add_argument('ml_workspace')

args = parser.parse_args()
pipeline_name = args.pipeline_name
experiment_name = args.experiment_name
run_name = args.run_name
tenant_id = args.tenant_id
service_principal_id = args.service_principal_id
service_principal_password = args.service_principal_password
subscription_id = args.subscription_id
resource_group = args.resource_group
ml_workspace = args.ml_workspace

client = kfp.Client()

try:
  experiment = client.create_experiment(
    name = experiment_name
  )
except:
  print("Experiment already exists")

pipelines = client.list_pipelines().pipelines

for pipeline in pipelines:
    if pipeline.name == pipeline_name:
        run_result = client.run_pipeline(
            experiment.id, 
            run_name,
            pipeline_id = pipeline.id,
            params = {
              "tenant_id": tenant_id,
              "service_principal_id": service_principal_id,
              "service_principal_password": service_principal_password,
              "subscription_id": subscription_id,
              "resource_group": resource_group,
              "workspace": ml_workspace
            }
        )

        print(run_result)
        break

