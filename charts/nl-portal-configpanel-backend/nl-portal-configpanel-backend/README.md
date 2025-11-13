# nl-portal-configpanel-backend

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.0.0](https://img.shields.io/badge/AppVersion-2.0.0-informational?style=flat-square)

NL-Portal Configuration Panel Helm chart to be used in Kubernetes clusters.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| extraEnvVars | list | `[]` | Array with extra environment variables to add e.g: extraEnvVars:   - name: FOO     value: "bar" |
| extraVolumeMounts | list | `[]` | Optionally specify extra list of additional volumeMounts e.g: extraVolumeMounts:  - name: verify-certs    mountPath: /etc/ssl/certs/extra-certs/ |
| extraVolumes | list | `[]` | Optionally specify extra list of additional volumes e.g: extraVolumes:   - name: verify-certs     configMap:       name: verify-certs |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/nl-portal/configuration-panel-backend"` |  |
| image.tag | string | `"latest"` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0] | string | `"nl-portal-config-panel.example.com"` |  |
| ingress.tls | list | `[]` |  |
| livenessProbe | object | `{"enabled":true,"failureThreshold":6,"httpGet":{"path":"/management/health","port":"http"},"initialDelaySeconds":5,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":1}` | Liveness probe for container health checking |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| readinessProbe | object | `{"enabled":true,"failureThreshold":6,"httpGet":{"path":"/management/health","port":"http"},"initialDelaySeconds":5,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":1}` | Readiness probe for container health checking |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| secretEnvVars | list | `[]` | Optionally specify environment variables sourced from various Secrets Setting these implies that no Secret will be created by the chart e.g: secretEnvVars:   - name: DATABASE_PASSWORD     secretKeyRef:       name: my-existing-secret       key: password |
| securityContext | object | `{}` |  |
| service.port | int | `80` |  |
| service.targetPort | int | `8080` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| settings | object | `{"app":{"cacheTTL":30000,"logLevel":"INFO","notifyEnabled":false,"notifyList":"","security":{"cors":{"allowedHeaders":"Authorization, Content-Type, Accept","allowedMethods":"GET, POST, PUT, DELETE","allowedOrigins":"*"}},"serverPrefix":"/configuration","serverToken":""},"auth":{"jwksURI":""},"database":{"password":"","url":"","username":""}}` | Application Settings |
| settings.app.cacheTTL | int | `30000` | Used to set the duration at which the configuration cache is evicted in milliseconds. |
| settings.app.logLevel | string | `"INFO"` | logLevel can be one of: TRACE, DEBUG, INFO, WARN, ERROR |
| settings.app.notifyEnabled | bool | `false` | Whether to notify NL Portal instances when configuration is changed. |
| settings.app.notifyList | string | `""` | A comma separated list of NL Portal base URLs that should receive a Spring Actuator Restart request if Notify is enabled.  |
| settings.app.serverPrefix | string | `"/configuration"` | Used to customise the base path of the configuration server. Application base URL is used as the configuration server if not set. |
| settings.app.serverToken | string | `""` | The token that should be used to authenticate configuration queries. Every NL Portal needs to have this value set for their Spring Cloud Configuration Client. |
| settings.auth.jwksURI | string | `""` | Required: JSON Web Key Set (JWKS) URI for validating tokens |
| settings.database.password | string | `""` | If using extraSecretEnvVars, set via name: DATABASE_PASSWORD |
| settings.database.url | string | `""` | Required: JDBC-style URL to a Postgres database, e.g. jdbc:postgresql://localhost:5432/nl-portal |
| settings.database.username | string | `""` | If using extraSecretEnvVars, set via name: DATABASE_USERNAME |
| startupProbe | object | `{"failureThreshold":90,"httpGet":{"path":"/management/health","port":"http"},"periodSeconds":10}` | Startup probe for container initialization checking |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
