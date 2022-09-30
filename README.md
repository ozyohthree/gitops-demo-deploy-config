# gh-pages

- For publishing Helm charts

##  chart releaser
```sh
$ helm package helm-charts/{app-build,app-deploy} --destination .deploy
$ cr upload -o ozyohthree -r gitops-demo-deploy-config -p .deploy -t $CH_TOKEN

$ git checkout gh-pages
$ cr index -i ./index.yaml -p .deploy -o ozyohthree -r gitops-demo-deploy-config -t $CH_TOKEN
```
