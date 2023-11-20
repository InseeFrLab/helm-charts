# Helm chart for ShinyProxy

This helm chart allow to deploy a customised shinyproxy app.
Security

With or without oidc, if using oidc pay attention to deploy yourself a secret that contains:

```
apiVersion: v1
kind: Secret
metadata:
  name: oidc-secret
stringData:
  client-id: someValue
  client-secret: someValue
```

## App configuration

You can customized the application.yml file in the apps helm values.

If you want to add some env variable you cas use container-env if you want to protect secret you can deploy yourself a secret like this, let say you have 2 applications:

```
apiVersion: v1
kind: Secret
metadata:
  name: apps-secret
stringData:
  app1:|
    VAR_EXAMPLE_1=value1
    VAR_EXAMPLE_2=value2
  app2:|
    VAR_EXAMPLE_1=otherValue1
    VAR_EXAMPLE_3=value3
```

This file will be injected in /opt/shinyproxy/conf/app1 and app2, then your application.yml configuration can specify ```container-env-file: /opt/shinyproxy/app1```

container-env and container-env-file can be mixed.