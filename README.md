# gitops-demo-deploy-config [Helm](https://helm.sh) Charts

This repository contains [Helm](https://helm.sh) charts for various projects and follows the monorepo pattern.
The charts have been published to this repo and can be added to a local repo 

* [S2I Build Application](helm-charts/app-build/)
    - used to build both the System and Inventory apps by using different ```values.yaml``` files
    - For example:
    - To Build [System App](https://github.com/ozyohthree/gitops-demo-system)
```sh


```


* [Application 2](charts/app2/)

## Installing Charts from this Repository

Add the Repository to Helm:

    helm repo add my-helm-charts https://tech.paulcz.net/my-helm-charts

Install Application 1:

    helm install my-helm-charts/app1

Install Application 2:

    helm install my-helm-charts/app2


# To enable deployment from a cicd namespace

- Run the ```update-permissions.sh``` script to give the dev namespace default serviceaccount permission to pull images from the cicd namespace


