# Consuming Quickstarts

Each bundle produced from this repository is published to a public Azure Container Registry (ACR) at cnabquickstarts.azurecr.io.

There are several ways to consume these bundles, using any CNAB-compliant tool (such as Duffle, Porter, or Docker App).

Here we list 2 different ways of installing bundles, using either Porter in Azure Cloud Shell or via the 'Deploy from Azure' button that is included on the readme page of each quickstart.

## Deploy from Cloud Shell

CNAB Quickstarts can be installed from Azure Cloud Shell.

To setup your Cloud Shell, run the following command:

```
curl https://raw.githubusercontent.com/deislabs/cnab-azure-driver/master/install-in-azure-cloudshell.sh |/bin/bash
source .bashrc
```

This will install Porter and the [CNAB Azure Driver](https://github.com/deislabs/cnab-azure-driver), which allows Cloud Shell to install bundles using Azure Container Instances as the driver.

Once setup is complete, you can install Quickstarts by using the following steps:

### 1. View bundle credentials/parameters

You can view details about the bundle, including any credentials and parameters required, by running the following command.

```
porter explain --tag cnabquickstarts.azurecr.io/porter/<quickstart-name>/bundle:<quickstart-version>
```

### 2. Set up credentials, if required

If the bundle requires credentials, you must generate a credentials file with the required values.

```
porter credentials generate --tag cnabquickstarts.azurecr.io/porter/<quickstart-name>/bundle:<quickstart-version>
```

This will output the path to the credentials file generated.

### 3. Run the install command

This command uses Porter with the CNAB Azure Driver. By default, the driver will use your Azure account for authentication, although this can be overridden to use a different Azure account. 

The account must, at a minimum, have permission to create resource groups and create Azure Container Instance (ACI) resources, plus permission for creating any resources defined in the specific bundle you are installing. 

More information about the requirements and configuration for the CNAB Azure Driver can be found over on the [GitHub repo](https://github.com/deislabs/cnab-azure-driver).
```
porter install --tag cnabquickstarts.azurecr.io/porter/<quickstart-name>:<quickstart-version> --cred <path-to-creds-file> -d azure --param <param1>=<param1value> --param <param2>=<param2value> ...
```


## Deploy from Azure

TODO: instructions

![Deploy from Azure buttons](../images/deploy-from-azure-buttons.png)

### Simple

![Deploy from Azure Simple Example](../images/deploy-from-azure-simple-example.png)

### Advanced

![Deploy from Azure Advanced Example](../images/deploy-from-azure-advanced-example.png)