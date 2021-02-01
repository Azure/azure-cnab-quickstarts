import kfp
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('pipeline_package_path')
parser.add_argument('pipeline_name')

args = parser.parse_args()
pipeline_package_path = args.pipeline_package_path
pipeline_name = args.pipeline_name

client = kfp.Client()

try:
  upload_result = client.upload_pipeline(pipeline_package_path, pipeline_name=pipeline_name)
  print(upload_result)
except:
  print("Pipeline already exists")
