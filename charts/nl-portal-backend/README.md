# nl-portal-backend

![Version: 0.1.8](https://img.shields.io/badge/Version-0.1.8-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

Nl Portal backend Helm chart to be used in Kubernetes clusters.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://registry-1.docker.io/bitnamicharts | keycloak | ~15.1.2 |
| oci://registry-1.docker.io/bitnamicharts | postgresql | ~12.5.6 |

## Values

| Key | Type | Default | Description                                              |
|-----|------|---------|----------------------------------------------------------|
| affinity | object | `{}` |                                                          |
| autoscaling.enabled | bool | `false` |                                                          |
| autoscaling.maxReplicas | int | `100` |                                                          |
| autoscaling.minReplicas | int | `1` |                                                          |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |                                                          |
| existingSecret | string | `nil` |                                                          |
| extraEnvVars | list | `[]` | Array with extra environment variables to add            |
| extraVolumeMounts | list | `[]` | Optionally specify extra list of additional volumeMounts |
| extraVolumes | list | `[]` | Optionally specify extra list of additional volumes      |
| fullnameOverride | string | `""` |                                                          |
| image.pullPolicy | string | `"IfNotPresent"` |                                                          |
| image.repository | string | `"nginx"` |                                                          |
| image.tag | string | `""` |                                                          |
| imagePullSecrets | list | `[]` |                                                          |
| ingress.annotations | object | `{}` |                                                          |
| ingress.className | string | `""` |                                                          |
| ingress.enabled | bool | `false` |                                                          |
| ingress.hosts[0].host | string | `"chart-example.local"` |                                                          |
| ingress.hosts[0].paths[0].path | string | `"/"` |                                                          |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |                                                          |
| ingress.tls | list | `[]` |                                                          |
| livenessProbe.enabled | bool | `true` |                                                          |
| livenessProbe.failureThreshold | int | `6` |                                                          |
| livenessProbe.initialDelaySeconds | int | `40` |                                                          |
| livenessProbe.periodSeconds | int | `10` |                                                          |
| livenessProbe.successThreshold | int | `1` |                                                          |
| livenessProbe.timeoutSeconds | int | `1` |                                                          |
| nameOverride | string | `""` |                                                          |
| nodeSelector | object | `{}` |                                                          |
| podAnnotations | object | `{}` |                                                          |
| podLabels | object | `{}` |                                                          |
| podSecurityContext | object | `{}` |                                                          |
| readinessProbe.enabled | bool | `true` |                                                          |
| readinessProbe.failureThreshold | int | `6` |                                                          |
| readinessProbe.initialDelaySeconds | int | `20` |                                                          |
| readinessProbe.periodSeconds | int | `10` |                                                          |
| readinessProbe.successThreshold | int | `1` |                                                          |
| readinessProbe.timeoutSeconds | int | `1` |                                                          |
| replicaCount | int | `1` |                                                          |
| resources | object | `{}` |                                                          |
| securityContext | object | `{}` |                                                          |
| service.port | int | `80` |                                                          |
| service.targetPort | int | `8080` |                                                          |
| service.type | string | `"ClusterIP"` |                                                          |
| serviceAccount.annotations | object | `{}` |                                                          |
| serviceAccount.create | bool | `true` |                                                          |
| serviceAccount.name | string | `""` |                                                          |
| settings.database.driver | string | `nil` | Driver Class name of the database                        |
| settings.database.name | string | `nil` | Database name                                            |
| settings.database.password | string | `""` | Database password                                        |
| settings.database.url | string | `nil` | Database hostname                                        |
| settings.database.username | string | `nil` | Username for the database                                |
| settings.nlPortal.zgw.catalogiapi.clientId | string | `nil` |                                                          |
| settings.nlPortal.zgw.catalogiapi.documentTypeUrl | string | `nil` |                                                          |
| settings.nlPortal.zgw.catalogiapi.rsin | string | `""` |                                                          |
| settings.nlPortal.zgw.catalogiapi.secret | string | `nil` |                                                          |
| settings.nlPortal.zgw.catalogiapi.url | string | `nil` |                                                          |
| settings.nlPortal.zgw.documentenapi.clientId | string | `nil` |                                                          |
| settings.nlPortal.zgw.documentenapi.secret | string | `nil` |                                                          |
| settings.nlPortal.zgw.documentenapi.url | string | `nil` |                                                          |
| settings.nlPortal.zgw.klantenapi.clientId | string | `nil` |                                                          |
| settings.nlPortal.zgw.klantenapi.rsin | string | `""` |                                                          |
| settings.nlPortal.zgw.klantenapi.secret | string | `nil` |                                                          |
| settings.nlPortal.zgw.klantenapi.url | string | `nil` |                                                          |
| settings.nlPortal.zgw.objectenapi.token | string | `nil` |                                                          |
| settings.nlPortal.zgw.objectenapi.url | string | `nil` |                                                          |
| settings.nlPortal.zgw.taak.taakobject.typeUrl | string | `""` |                                                          |
| settings.nlPortal.zgw.zakenapi.clientId | string | `nil` |                                                          |
| settings.nlPortal.zgw.zakenapi.secret | string | `nil` |                                                          |
| settings.nlPortal.zgw.zakenapi.url | string | `nil` |                                                          |
| settings.spring.profiles.default | string | `"dev"` |                                                          |
| settings.spring.security.oauth2.issuerUri | string | `"http://localhost:8082/auth/realms/master"` |                                                          |
| tolerations | list | `[]` |                                                          |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.12.0](https://github.com/norwoodj/helm-docs/releases/v1.12.0)
