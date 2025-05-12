# nl-portal-frontend

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.3.0](https://img.shields.io/badge/AppVersion-1.3.0-informational?style=flat-square)

Nl Portal frontend Helm chart to be used in Kubernetes clusters.

## Values

| Key                                        | Type   | Default                    | Description |
| ------------------------------------------ | ------ | -------------------------- | ----------- |
| affinity                                   | object | `{}`                       |             |
| autoscaling.enabled                        | bool   | `false`                    |             |
| autoscaling.maxReplicas                    | int    | `100`                      |             |
| autoscaling.minReplicas                    | int    | `1`                        |             |
| autoscaling.targetCPUUtilizationPercentage | int    | `80`                       |             |
| existingSecret                             | string | `nil`                      |             |
| fullnameOverride                           | string | `""`                       |             |
| image.pullPolicy                           | string | `"IfNotPresent"`           |             |
| image.repository                           | string | `"nginx"`                  |             |
| image.tag                                  | string | `""`                       |             |
| imagePullSecrets                           | list   | `[]`                       |             |
| ingress.annotations                        | object | `{}`                       |             |
| ingress.className                          | string | `""`                       |             |
| ingress.enabled                            | bool   | `false`                    |             |
| ingress.hosts[0].host                      | string | `"chart-example.local"`    |             |
| ingress.hosts[0].paths[0].path             | string | `"/"`                      |             |
| ingress.hosts[0].paths[0].pathType         | string | `"ImplementationSpecific"` |             |
| ingress.tls                                | list   | `[]`                       |             |
| livenessProbe.failureThreshold             | int    | `6`                        |             |
| livenessProbe.httpGet.path                 | string | `"/"`                      |             |
| livenessProbe.httpGet.port                 | int    | `8081`                     |             |
| livenessProbe.initialDelaySeconds          | int    | `40`                       |             |
| livenessProbe.periodSeconds                | int    | `10`                       |             |
| livenessProbe.successThreshold             | int    | `1`                        |             |
| livenessProbe.timeoutSeconds               | int    | `1`                        |             |
| nameOverride                               | string | `""`                       |             |
| nodeSelector                               | object | `{}`                       |             |
| podAnnotations                             | object | `{}`                       |             |
| podLabels                                  | object | `{}`                       |             |
| podSecurityContext                         | object | `{}`                       |             |
| readinessProbe.failureThreshold            | int    | `6`                        |             |
| readinessProbe.httpGet.path                | string | `"/"`                      |             |
| readinessProbe.httpGet.port                | int    | `8081`                     |             |
| readinessProbe.initialDelaySeconds         | int    | `20`                       |             |
| readinessProbe.periodSeconds               | int    | `10`                       |             |
| readinessProbe.successThreshold            | int    | `1`                        |             |
| readinessProbe.timeoutSeconds              | int    | `1`                        |             |
| replicaCount                               | int    | `1`                        |             |
| resources                                  | object | `{}`                       |             |
| securityContext                            | object | `{}`                       |             |
| service.port                               | int    | `80`                       |             |
| service.targetPort                         | int    | `8080`                     |             |
| service.type                               | string | `"ClusterIP"`              |             |
| serviceAccount.annotations                 | object | `{}`                       |             |
| serviceAccount.create                      | bool   | `true`                     |             |
| serviceAccount.name                        | string | `""`                       |             |
| settings.graphqlUri                        | string | `nil`                      |             |
| settings.keycloak.clientId                 | string | `nil`                      |             |
| settings.keycloak.realm                    | string | `nil`                      |             |
| settings.keycloak.url                      | string | `nil`                      |             |
| settings.restUri                           | string | `nil`                      |             |
| tolerations                                | list   | `[]`                       |             |

---

Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
