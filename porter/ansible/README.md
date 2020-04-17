# Porter configuration using Ansible

This bundle demonstrates wrapping an existing automated process inside a CNAB bundle.

Specifically, it uses [Ansible](https://docs.ansible.com/ansible/latest/index.html) to orchestrate the install/uninstall actions for a rudimentary deployment of [Elasticsearch](https://www.elastic.co/elasticsearch) on an Azure VM ScaleSet.

## Generate a new SSH keypair
In order to allow Ansible to configure the provisioned VMs, you will need to generate a new SSH keypair before running the bundle.

#### MAC/Linux/CloudShell/WSL:
```
ssh-keygen -f id_porter_ansible
```

This will create 2 files:
```
id_porter_ansible
id_porter_ansible.pub
```

Alternative, whilst experimenting, you can use the example SSH key pair included in this repo:
* [example_sshkey_id](./playbook/environments/example_sshkey_id)
* [example_sshkey_id.pub](./playbook/environments/example_sshkey_id.pub)

Unless testing locally (detailed below), when specifying the bundle parameters/credentials you will need to:

1. Base64-encode the contents of the `id_porter_ansible` file and use the resulting string for the `ssh_private_key_base64` credential
1. Copy the contents of the `id_porter_ansible.pub` file and use it for the `ssh_public_key` parameter

#### Base64 Encoding on MAC/Linux/CloudShell:
```
$ cat ./id_porter_ansible | base64 -
```

#### Base64 Encoding with PowerShell:
```
PS > [Convert]::ToBase64String([System.Text.Encoding]::Utf8.GetBytes($(Get-Content -Raw ./id_porter_ansible)))
```

## Testing locally

The provided PowerShell script `test.ps1` can be used to easily build & test the bundle provided you have the following pre-requisites:

* Porter [installed locally](https://porter.sh/install/)
* PowerShell/PowerShell Core
* Docker (running Linux containers)
* Generate a credential for this bundle (e.g. run `porter credential generate`):
    * azure_client_id
    * azure_client_secret
    * azure_subscription_id
    * azure_tenant_id
    * ssh_private_key_base64 (see note above re: base46 encoding the SSH private key file)

### Build & install test with the provided example defaults
```
./test.ps1 -credentialName <credential-name>
```

>NOTE: By default, this will use the example SSH keys included in the repo.

### Script Parameters
| Name | Description | Default |
| --- | --- | --- |
environmentName | Specifies which Ansible inventory to use as configuration | example
credentialName | A previously generated Porter credential to use |  |
sshPrivateKey | Path to the SSH private key file that has access to the provisioned servers.  Alternatively you can pass the contents of the keyfile as a base64-encoding string | playbook/environments/example_sshkey_id
sshPublicKey | Path to the SSH public key file that has access to the provisioned servers.  Alternatively you can pass the contents of the keyfile as a string | playbook/environments/example_sshkey_id.pub
action | The Porter action to perform on the bundle | install |
skipBuild | A switch to optionally skip building the bundle | False


## Deploy from Azure


You will need to create a service principal in order to use the 'Deploy from Azure' buttons.


For detailed instructions on deploying from Azure, including how to setup the service principal, see [Consuming: Deploy from Azure](../../docs/consuming.md#deploy-from-azure)

### Simple deployment


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-cnab-quickstarts%2Fporter-ansible%2Fporter%2Fansible%2Fazuredeploy-simple.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>

### Advanced deployment


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-cnab-quickstarts%2Fporter-ansible%2Fporter%2Fansible%2Fazuredeploy-advanced.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>


## Deploy from Cloud Shell


For detailed instructions on deploying from Cloud Shell, including how to setup the Cloud Shell environment, see [Consuming: Deploy from Cloud Shell](../../docs/consuming.md#deploy-from-cloud-shell)


```porter install --tag cnabquickstarts.azurecr.io/porter/ansible/bundle:0.2.0-pull-85-merge.1-256 -d azure```


## Parameters and Credentials

 | Name | Description | Default | Required | 
 | --- | --- | --- | --- | 
 | azure_client_id | AAD Client Id for Azure account authentication - used by Ansible |  | Yes
azure_client_secret | AAD Client Secret for Azure account authentication - used by Ansible |  | Yes
azure_subscription_id | Azure Subscription Id used to set the subscription where the account has access to multiple subscriptions |  | Yes
azure_tenant_id | Azure AAD Tenant Id for Azure account authentication - used by Ansible |  | Yes
environment_name | Specifies which Ansible inventory/environment to get configuration from |  | Yes
porter-debug | Print debug information from Porter when executing the bundle |  | No
ssh_private_key_base64 | The SSH private key used by Ansible to connect to the provisioned VMs |  | Yes
ssh_public_key | The SSH public key to be granted admin access to the provisioned VMs |  | Yes | 
