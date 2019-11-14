This quickstart will configure a reverse OAuth2 Proxy in Kubernetes, which allows you to protect applications in the cluster using Azure Active Directory as the identity provider for authentication and authorization.

The quickstart first creates an Azure Active Directory application which is then used to configure the proxy. 

Pre-requisites:
- Kubernetes cluster
- NGINX ingress controller
- DNS configured for ingress controller
- TLS certificate for domain

Note:
The service principal used for this quickstart must have permissions to create AD applications in the target AD tenant.