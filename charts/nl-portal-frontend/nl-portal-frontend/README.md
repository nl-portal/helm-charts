# nl-portal-frontend

![Version: 2.0.0](https://img.shields.io/badge/Version-2.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.x.y](https://img.shields.io/badge/AppVersion-2.x.y-informational?style=flat-square)

Nl Portal frontend Helm chart to be used in Kubernetes clusters.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| existingSecret | string | `nil` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"nginx"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.host | string | `"chart-example.local"` |  |
| ingress.tls | list | `[]` |  |
| livenessProbe.failureThreshold | int | `6` |  |
| livenessProbe.httpGet.path | string | `"/"` |  |
| livenessProbe.httpGet.port | int | `8081` |  |
| livenessProbe.initialDelaySeconds | int | `40` |  |
| livenessProbe.periodSeconds | int | `10` |  |
| livenessProbe.successThreshold | int | `1` |  |
| livenessProbe.timeoutSeconds | int | `1` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| readinessProbe.failureThreshold | int | `6` |  |
| readinessProbe.httpGet.path | string | `"/"` |  |
| readinessProbe.httpGet.port | int | `8081` |  |
| readinessProbe.initialDelaySeconds | int | `20` |  |
| readinessProbe.periodSeconds | int | `10` |  |
| readinessProbe.successThreshold | int | `1` |  |
| readinessProbe.timeoutSeconds | int | `1` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.port | int | `80` |  |
| service.targetPort | int | `8081` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | If not set and create is true, a name is generated using the fullname template |
| settings | object | `{"app":{"backendUrl":"","features":{"account":{"showNotificationSubsection":true},"general":{"casesPartialSearch":true,"messageCountPollingInterval":10000,"showInhabitantAmount":true,"themeClass":null},"overview":{"currentCasesPreviewLength":1,"showCurrentCasesPreview":true,"showIntro":true,"showMaintenanceAlert":true}},"services":{"addressResearchMoreInfoUrl":null,"addressResearchUrl":null,"changeInUseOfSurnameUrl":null,"changeRegisteredGenderUrl":null,"openKlantVersion":null,"reportChangeOfAddressUrl":null,"requestConfidentialityOfDataUrl":null,"requestForChangeBrpInfoUrl":null}},"oidc":{"clientID":"gzac-portal","postLogoutRedirectUrl":null,"realm":"nlportal","redirectUrl":null,"url":null}}` | Application Settings |
| settings.app.backendUrl | string | `""` | Application's backend URL. Empty string means the same URL as the frontend, which is inferred from the Ingress configuration. |
| settings.app.features.account.showNotificationSubsection | bool | `true` | TODO: add explanation, confirm that `true` is an OK default |
| settings.app.features.general.casesPartialSearch | bool | `true` | TODO: add explanation |
| settings.app.features.general.messageCountPollingInterval | int | `10000` | TODO: add explanation. What unit is this in? |
| settings.app.features.general.showInhabitantAmount | bool | `true` | TODO: add explanation |
| settings.app.features.general.themeClass | string | `nil` | TODO: add explanation, confirm `null` is an OK default |
| settings.app.features.overview.currentCasesPreviewLength | int | `1` | TODO: add explanation, confirm that `1` is an OK default |
| settings.app.features.overview.showCurrentCasesPreview | bool | `true` | TODO: add explanation, confirm that `true` is an OK default |
| settings.app.features.overview.showIntro | bool | `true` | TODO: add explanation, confirm that `true` is an OK default |
| settings.app.features.overview.showMaintenanceAlert | bool | `true` | TODO: add explanation, confirm that `true` is an OK default |
| settings.app.services.addressResearchMoreInfoUrl | string | `nil` | TODO: add explanation |
| settings.app.services.addressResearchUrl | string | `nil` | TODO: add explanation |
| settings.app.services.changeInUseOfSurnameUrl | string | `nil` | TODO: add explanation |
| settings.app.services.changeRegisteredGenderUrl | string | `nil` | TODO: add explanation |
| settings.app.services.openKlantVersion | string | `nil` | TODO: add explanation |
| settings.app.services.reportChangeOfAddressUrl | string | `nil` | TODO: add explanation |
| settings.app.services.requestConfidentialityOfDataUrl | string | `nil` | TODO: add explanation |
| settings.app.services.requestForChangeBrpInfoUrl | string | `nil` | TODO: add explanation |
| settings.oidc.clientID | string | `"gzac-portal"` | OIDC Client ID for the frontend |
| settings.oidc.postLogoutRedirectUrl | string | `nil` | where ${frontend_url} is inferred from the Ingress configuration. |
| settings.oidc.realm | string | `"nlportal"` | OIDC Realm that contains users for NL Portal |
| settings.oidc.redirectUrl | string | `nil` | where ${frontend_url} is inferred from the Ingress configuration. |
| settings.oidc.url | string | `nil` | Note: For Keycloak versions <17, you must append /auth to this URL. |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
