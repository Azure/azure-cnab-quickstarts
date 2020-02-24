This bundle demonstrates wrapping an existing automated process inside a CNAB bundle.

Specifically, it uses [Ansible](https://docs.ansible.com/ansible/latest/index.html) to orchestrate the install/uninstall actions for a rudimentary deployment of [Elasticsearch](https://www.elastic.co/elasticsearch) on a VM ScaleSet.

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
sshPrivateKey | Path to the SSH private key file that has access to the provisioned servers.  Alternatively you can pass the contents of the keyfile as a base64-encoding string | playbook/environments/example_sshkey_id
sshPublicKey | Path to the SSH public key file that has access to the provisioned servers.  Alternatively you can pass the contents of the keyfile as a string | playbook/environments/example_sshkey_id.pub
action | The Porter action to perform on the bundle | install |  |
skipBuild | A switch to optionally skip building the bundle | False
