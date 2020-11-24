# Helm charts

Various (infrastructure focused) charts used at Insee (https://insee.fr).  
See the other repository ([Helm charts datascience](https://github.com/inseefrlab/helm-charts-datascience)) for datascience focused charts.

To use the repo on helm (version 3+) :

```
helm repo add inseefrlab https://inseefrlab.github.io/helm-charts
```

The repo is also browsable directly https://inseefrlab.github.io/helm-charts/index.yaml

`kube-oidc-proxy` is a copy (may be out of date) of https://github.com/jetstack/kube-oidc-proxy/tree/master/deploy/charts/kube-oidc-proxy with the sole purpose of exposing it on the internet (see https://github.com/jetstack/kube-oidc-proxy/issues/123)

`provisioner` is a copy (may be out of date) of https://github.com/kubernetes-sigs/sig-storage-local-static-provisioner with the sole purpose of exposing it on the internet (see https://github.com/kubernetes-sigs/sig-storage-local-static-provisioner/issues/199)

`docker-registry` is a copy (may be out of date) of https://github.com/helm/charts/tree/master/stable/docker-registry with the sole purpose of ensuring it stays online now that it has been deprecated from the stable repository (see https://github.com/helm/charts#%EF%B8%8F-deprecation-and-archive-notice)
