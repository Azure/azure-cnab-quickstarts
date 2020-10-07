This bundle installs [Mattermost](https://mattermost.com/) on an [Azure Kubernetes Service](https://azure.microsoft.com/en-gb/services/kubernetes-service/) (AKS) cluster.

The bundle does the following:
- Deploys AKS cluster
- Installs [NGINX ingress controller](https://kubernetes.github.io/ingress-nginx/) and configures to use public DNS name
- Installs [cert-manager](https://github.com/jetstack/cert-manager) and configures to use [Let's Encrypt](https://letsencrypt.org/) to issue free SSL certificates
- Installs Mattermost (Enterprise or Team edition)

The Mattermost installation step uses the official Helm charts for Mattermost Enterprise/Team Edition (more information about the Helm charts can be found on the [GitHub page](https://github.com/mattermost/mattermost-helm/tree/master/charts)).

Once installed, the output will show the FQDN where you can access the Mattermost application.