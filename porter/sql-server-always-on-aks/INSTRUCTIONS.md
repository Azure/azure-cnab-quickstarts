This Bundle installs a SQL Server always on availability group on a new AKS Cluster, on install it will:

* Create a new AKS Cluster
* Deploy the SQL Server Operator
* Create Secrets for SQL Server sa password and master password
* Deploy SQL Server Containers, persistent volumes, persistent volume claims and load balancers
* Create services to connect to primary and secondary replicas

It creates an AKS Cluster with 4 nodes with agent VM Size of Standard_DS2_v2, the Cluster is created without enabling RBAC.

Full details can be found [here](https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-kubernetes-deploy?view=sqlallproducts-allversions)