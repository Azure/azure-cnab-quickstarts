This bundle bootstraps all of [Dapr](https://dapr.io/) Operator components into a Kubernetes cluster.

The bundle is based on the official Helm chart for Dapr (more information about the Helm chart can be found on the [GitHub page](https://github.com/dapr/dapr/tree/master/charts/dapr)).

To install on AKS, keep all parameters as defaults.

To install on Kubernetes cluster running on ARM based devices (e.g. Raspberry Pi), set the `global_tag` parameter for the bundle to `0.3.0-arm`.