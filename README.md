
- [Current Helm Charts Version info](https://ozyohthree.github.io/gitops-demo-deploy-config/index.yaml)

## Add repo
```sh
# Add repo
$ helm repo add gitops-demo-deploy-config https://ozyohthree.github.io/gitops-demo-deploy-config/
```

##  chart releaser
```sh
$ helm package helm-charts/{app-build,app-deploy} --destination .deploy
$ cr upload -o ozyohthree -r gitops-demo-deploy-config -p .deploy -t $CH_TOKEN

$ git checkout gh-pages
$ cr index -i ./index.yaml -p .deploy -o ozyohthree -r gitops-demo-deploy-config -t $CH_TOKEN
```
