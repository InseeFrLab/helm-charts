# Helm chart for ShinyProxy

This helm chart allow to deploy a customised shinyproxy app.
Security

If using oidc for authentication, you must first apply a secret that contains:

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: oidc-secret
stringData:
  client-id: someValue
  client-secret: someValue
```

## App configuration

You can customize the application.yml file in the apps' helm values.

If you want to add some env variable you can use container-env if you want to protect secret you can deploy yourself a secret like this, let say you have 2 applications:

```yaml
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

This file will be injected in `/opt/shinyproxy/conf/app1` and `/opt/shinyproxy/conf/app2`, then your application.yml configuration can specify ```container-env-file: /opt/shinyproxy/app1```

container-env and container-env-file can be mixed.

## Monitor shinyproxy activity using prometheus

As explained in the official [shinyproxy's docker image repository](https://shinyproxy.io/documentation/usage-statistics/#micrometer-prometheus), we can set up the Micrometer monitoring backend using Prometheus to fetch shinyproxy activity. By default, is it turned off.

If you want to enable metrics of sinyproxy, put `monitor.enabled` to `true`.

Then you'll want to chose an interval at which the shinyproxy logs to http://localhost:9090/actuator/prometheus in its pod.

Each metric produced by shinyproxy can have a set prefix.

Prometheus will discover the metrics if the service of shinyproxy uses [a specific `metadata.labels.release`](https://github.com/prometheus-operator/prometheus-operator/blob/main/Documentation/troubleshooting.md#using-textual-port-number-instead-of-port-name), this depends on your implementation of prometheus; by default it is empty.


Here is an example when monitoring is enabled on shinyproxy :

```yaml
monitor:
  enabled: true
  metadata:
    labels:
      release: "prometheus-stack"
  port: 9090
  interval: 10s
  micrometer:
    prefix: "shinyproxy"
```