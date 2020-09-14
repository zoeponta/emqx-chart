# EMQ X Helm chart

This is unofficial helm chart of EMQ-X mqtt broker.

## Requirements

- EMQ X v4.2-rc+
- Helm v3+

## Install

To install the chart with the release name `my-emqx`:

```console
helm repo add zoeponta https://zoeponta.github.io/charts/
helm install my-emqx zoeponta/emqx
```

## Uninstall

To uninstall the `my-emqx` deployment:

```console
helm uninstall my-emqx
```

## Configurations

The following table lists the configurable parameters of the drone charts and their default values.

| Parameter | Description | Default |
| --------- | ----------- | ------- |
| `replicaCount` | EMQ X instance count | 3 |
| `image.repository` | EMQ X image repository | emqx/emqx |
| `image.pullPolicy` | EMQ X image pull policy | IfNotPresent |
| `image.tag` | EMQ X image tag  | "" |
| `imagePullSecrets` | List of container registry secrets | [] |
| `nameOverride` | String to partially override redis.fullname template with a string (will prepend the release name) | "" |
| `fullnameOverride` | String to fully override redis.fullname template with a string | "" |
| `rbac.create` | Specifies whether RBAC resources should be created | true |
| `serviceAccount.create` | Specifies whether a ServiceAccount should be created | true |
| `serviceAccount.annotations` | Annotations for ServiceAccount | {} |
| `serviceAccount.name` | Name of the ServiceAccount to create | "" |
| `podAnnotations` | Annotations for pods | {} |
| `podSecurityContext` | Security context for pod | {} |
| `securityContext` | Security context for container | {} |
| `service.mqtt.type` | Service type for EMQ X broker | ClusterIP |
| `service.mqtt.loadBalancerIP` | Load Balancer IP | nil |
| `service.mqtt.ports.mqtt` | Port for MQTT | 1883 |
| `service.mqtt.ports.mqtts` | Port for MQTT over SSL | 8883 |
| `service.mqtt.ports.ws` | Port for WebSocket |  8083 |
| `service.mqtt.ports.wss` | Port for WebSocket over SSL | 8084 |
| `service.http.type` | Service type for HTTP server | ClusterIP |
| `service.http.ports.dashboard` | Port for dashboard | 18083 |
| `ingress.enabled` | Enable ingress | false |
| `ingress.annotations` | Annotations for Ingress | {} |
| `ingress.host` | Ingress host| board.example.local |
| `ingress.tls` | Ingress TLS configuration | nil |
| `resources` | EMQ X resource requests and limits | {} |
| `autoscaling.enabled` | Enable horizontal pod autoscaler | false |
| `autoscaling.minReplicas` | Minimum number of EMQ X instances | 1 |
| `autoscaling.maxReplicas` | Maximum number of EMQ X instances | 100 |
| `autoscaling.targetCPUUtilizationPercentage` | Target Utilization for CPU | nil |
| `autoscaling.targetMemoryUtilizationPercentage` | Target Utilization for Memory | nil |
| `nodeSelector` | Node labels for pod assignment | {} |
| `tolerations` | Toleration labels for pod assignment | [] |
| `affinity` | Affinity settings for pod assignment | {} |
| `persistence.enabled` | Enable persistent volume | true |
| `persistence.storageClass` | Name of the StorageClass to use per your volume provider | "" |
| `persistence.accessMode` | Access mode for the volume | ReadWriteOnce |
| `persistence.size` | Size of the volume | 100M |
| `persistence.annotations` | Annotations for persistent volume claim | {} |
| `metrics.enabled` | Enable to get metrics by using emqx_prometheus | false |
| `metrics.cloudmonitoring.enabled` | Enable to send metrics to Cloud Monitoring | false |
| `metrics.cloudmonitoring.image.repository` | prometheus-to-sd image repository | gcr.io/google-containers/prometheus-to-sd |
| `metrics.cloudmonitoring.image.tag` | prometheus-to-sd image tag  | v0.9.2 |
| `metrics.servicemonitor.enabled` | (TBD) Enable to use service monitor | false |
| `ssl.enabled` | Enable MQTT over SSL and Websocket over SSL | false |
| `ssl.secret` | Secret name of certificate | "" |
| `ssl.dir` | Directory for certificate| /opt/emqx/etc/certs |
| `loglevel` | Log level | debug |
| `extraEnvs` | Set extra EMQ X configurations | {} |


## TODO

- ACL / Auth
- Use ingress for websocket over SSL 
- Automaticaly reload certificate 
- Custom metrics
- Prometheus Operator (ServiceMonitor)
- 
