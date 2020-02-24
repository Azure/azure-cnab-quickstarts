This bundle demonstrates wrapping an existing automated process inside a CNAB bundle.

Specifically, it uses [Ansible](https://docs.ansible.com/ansible/latest/index.html) to orchestrate the install/uninstall actions for a rudimentary deployment of [Elasticsearch](https://www.elastic.co/elasticsearch) on a VM ScaleSet.

## Generate a new SSH keypair
In order to allow Ansible to configure the provision VMs, you will need to generate a new SSH keypair before running the bundle.

```
ssh-keygen -f id_porter_ansible
```

This will create 2 files:
```
id_porter_ansible
id_porter_ansible.pub
```

Unless testing locally (detailed below), you will need to pass the contents of the `id_porter_ansible` file as a Base64 encoded string:
```
MAC/Linux: cat ./id_porter_ansible | base64 -
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

### Install testing with the provided example defaults
```
./test.ps1
```

>NOTE: By default, this will use the example SSH keys included in the repo.

### Script Parameters
| Name | Description | Default | Required | 
| --- | --- | --- | --- |
environmentName | Specifies which Ansible inventory to use as configuration | example | yes
credentialFile | A previously generated Porter credential file to use | porter-example-creds.yml | yes
sshPrivateKey | The path to the SSH private key file that has access to the provisioned servers.  Alternatively you can pass the contents of the keyfile as a base64-encoding string | playbook/environments/example_sshkey_id | yes
action | The Porter action to perform on the bundle | install | |
skipBuild | A switch to optionally skip building the bundle | False | No
