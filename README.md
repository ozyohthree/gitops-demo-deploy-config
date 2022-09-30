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
# Install System App repo to the test namespace (default) or override namespace
# Build
$ helm install system-app-build helm-charts/app-build
# Deploy
$ helm install system-app helm-charts/app-deploy
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

# Build System App repo to the test name (default) or override namespace value as follows
$ helm install system-app-build gitops-demo-deploy-config/build 
# Deploy
$ helm install system-app gitops-demo-deploy-config/deploy
```

3. Install using the tars 
```sh
# Build
$ helm install system-app-build https://github.com/ozyohthree/gitops-demo-deploy-config/releases/download/build-0.1.0/build-0.1.0.tgz

# Deploy
$ helm install system-app https://github.com/ozyohthree/gitops-demo-deploy-config/releases/download/deploy-0.1.0/deploy-0.1.0.tgz 
```

### Overriding namespace
```sh
# If you overide namespace for the build, then you have to overide the image location for the deploy or update service account permissions as below
# For example if using namespace DEV
# Build
$ helm install system-app-build helm-charts/app-build --set metadata.namespace=DEV -n DEV
# Deploy
$ helm install system-app helm-charts/app-deploy --set metadata.namespace=DEV --set image.repository=image-registry.openshift-image-registry.svc:5000/DEV/gitops-demo-system

```


# To enable deployment for images in a different namespace registry for example 'cicd'

- Run the ```update-permissions.sh``` script to give the dev namespace default serviceaccount permission to pull images from the cicd namespace


