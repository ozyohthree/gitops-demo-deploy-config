# gitops-demo-deploy-config [Helm](https://helm.sh) Charts

This repository contains 2 [Helm](https://helm.sh) charts used for building and deploying the below mentioned Applications.
1. [Build Application](helm-charts/app-build/)
2. [Deploy Application](helm-charts/app-deploy/)

These charts are for Building (using S2I) and Deploying the following Java Openliberty Applications;
1. [System App](https://github.com/ozyohthree/gitops-demo-system)
2. [Inventory App](https://github.com/ozyohthree/gitops-inventory-system) 

The repo also Hosts the Charts as a Helm Repo published to the [Github pages](https://ozyohthree.github.io/gitops-demo-deploy-config/). 

There are 3 Ways to use the Charts;

1. Clone the repo then then run helm install 
```sh
# Install System App repo to the test namespace (default) or override namespace value as follows
helm install system-app helm-charts/app-deploy --set metadata.namespace=test-helm-repo
```

2. Add repo to your repositories then install chart as follows;
```sh
# Add repo
$ helm repo add gitops-demo-deploy-config https://ozyohthree.github.io/gitops-demo-deploy-config/
# Helm search will list them
$ helm search repo
NAME                                            CHART VERSION   APP VERSION     DESCRIPTION      
gitops-demo-deploy-config/build                 0.1.0           1.16.0          A Helm chart for Kubernetes                       
gitops-demo-deploy-config/deploy                0.1.0           1.16.0          A Helm chart for Kubernetes 

# Install System App repo to the test name (default) or override namespace value as follows
$ helm install system-app gitops-demo-deploy-config/deploy --set metadata.namespace=test-helm-repo
```

3. Install using the tars 
```sh
$ helm install system-app https://github.com/ozyohthree/gitops-demo-deploy-config/releases/download/deploy-0.1.0/deploy-0.1.0.tgz --set metadata.namespace=test-helm-repo --set im
age.repository=quay.io/ohthree/gitops-demo-system
```

# To enable deployment from builds done in namespace called cicd

- Run the ```update-permissions.sh``` script to give the dev namespace default serviceaccount permission to pull images from the cicd namespace


