# Porter configuration using Ansible

This bundle demonstrates wrapping an existing automated process inside a CNAB bundle.

Specifically, it uses [Ansible](https://docs.ansible.com/ansible/latest/index.html) to orchestrate the install/uninstall actions for a rudimentary deployment of [Elasticsearch](https://www.elastic.co/elasticsearch) on a VM ScaleSet.

## Generate a new SSH keypair
In order to allow Ansible to configure the provisioned VMs, you will need to generate a new SSH keypair before running the bundle.

MAC/Linux/WSL:
```
ssh-keygen -f id_porter_ansible
```

This will create 2 files:
```
id_porter_ansible
id_porter_ansible.pub
```

Unless testing locally (detailed below), you will need to pass the contents of the `id_porter_ansible` file as a Base64 encoded string:

MAC/Linux:
```
cat ./id_porter_ansible | base64 -
```

Powershell:
```
Powershell: [Convert]::ToBase64String([System.Text.Encoding]::Utf8.GetBytes($(Get-Content -Raw ./id_porter_ansible)))
```

## Testing locally

The provided PowerShell script `test.ps1` can be used to easily build & test the bundle provided you have the following pre-requisites:

    * PowerShell/PowerShell Core
    * Docker (running Linux containers)
    * Service principal details set in the following environment variables:
        * AZURE_CLIENT_ID
        * AZURE_SECRET
        * AZURE_SUBSCRIPTION_ID
        * AZURE_TENANT

### Build & install test with the provided example defaults
```
./test.ps1
```

>NOTE: By default, this will use the example SSH keys included in the repo.

### Script Parameters
| Name | Description | Default |
| --- | --- | --- |
environmentName | Specifies which Ansible inventory to use as configuration | example
credentialFile | A previously generated Porter credential file to use | porter-example-creds.yml
sshPrivateKey | The path to the SSH private key file that has access to the provisioned servers.  Alternatively you can pass the contents of the keyfile as a base64-encoding string | playbook/environments/example_sshkey_id
action | The Porter action to perform on the bundle | install | |
skipBuild | A switch to optionally skip building the bundle | False


## Deploy from Azure


You will need to create a service principal in order to use the 'Deploy from Azure' buttons.


For detailed instructions on deploying from Azure, including how to setup the service principal, see [Consuming: Deploy from Azure](../../docs/consuming.md#deploy-from-azure)

### Simple deployment


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FJamesDawson%2Fazure-cnab-quickstarts%2Fporter-ansible%2Fporter%2Fansible%2Fazuredeploy-simple.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>

### Advanced deployment


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FJamesDawson%2Fazure-cnab-quickstarts%2Fporter-ansible%2Fporter%2Fansible%2Fazuredeploy-advanced.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>


## Deploy from Cloud Shell


For detailed instructions on deploying from Cloud Shell, including how to setup the Cloud Shell environment, see [Consuming: Deploy from Cloud Shell](../../docs/consuming.md#deploy-from-cloud-shell)


```porter install --tag readsourceacr.azurecr.io/porter/ansible/bundle:0.2.0-pull-1-merge.1-180 -d azure```


## Parameters and Credentials

 | Name | Description | Default | Required | 
 | --- | --- | --- | --- | 
 | azure_client_id |  |  | Yes
azure_client_secret |  |  | Yes
azure_subscription_id |  |  | Yes
azure_tenant_id |  |  | Yes
environment_name |  |  | Yes
porter-debug | Print debug information from Porter when executing the bundle |  | No
ssh_private_key_base64 |  |  | Yes
ssh_public_key |  |  | No | 
