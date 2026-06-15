# nl-portal-frontend

![Version: 3.0.0](https://img.shields.io/badge/Version-3.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 3.0.x](https://img.shields.io/badge/AppVersion-3.0.x-informational?style=flat-square)

Nl Portal frontend Helm chart to be used in Kubernetes clusters.

## Requirements

Kubernetes: `>=1.23.0`

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| existingSecret | string | `nil` |  |
| extraEnvVars | list | `[]` | Optionally specify extra list of additional volumes |
| extraVolumeMounts | list | `[]` | Optionally specify extra list of additional volumeMounts |
| extraVolumes | list | `[]` | Optionally specify extra list of additional volumes |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"nginx"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0] | string | `"chart-example.local"` |  |
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
| settings | object | `{"account":{"showNotificationSubsection":true},"backendUrl":"","brpUrls":{"addressResearchMoreInfoUrl":null,"addressResearchUrl":null,"changeInUseOfSurnameUrl":null,"changeRegisteredGenderUrl":null,"reportChangeOfAddressUrl":null,"requestConfidentialityOfDataUrl":null,"requestForChangeBrpInfoUrl":null},"features":{"casesPartialSearch":true,"messageCountEnable":true,"messageCountPollingInterval":10000,"openKlantVersion":null,"openProducten":false,"showCaseResultExplanation":false,"showInhabitantAmount":true,"useLegacyOgonePayment":false,"useThemeApi":false},"oidc":{"autoIdleSessionLogout":true,"clientID":null,"idleTimeoutMinutes":15,"postLogoutRedirectUrl":null,"realm":null,"redirectUrl":null,"url":null},"overview":{"currentCasesPreviewLength":2,"showCurrentCasesPreview":true,"showIntro":true,"showMaintenanceAlert":true},"themeClass":null}` | Application Settings |
| settings.account | object | `{"showNotificationSubsection":true}` | ------------------------------------------------------------------------- |
| settings.account.showNotificationSubsection | bool | `true` | Show notification settings subsection on account page |
| settings.backendUrl | string | `""` | Backend URL. Empty string = same URL as frontend (inferred from Ingress) |
| settings.brpUrls | object | `{"addressResearchMoreInfoUrl":null,"addressResearchUrl":null,"changeInUseOfSurnameUrl":null,"changeRegisteredGenderUrl":null,"reportChangeOfAddressUrl":null,"requestConfidentialityOfDataUrl":null,"requestForChangeBrpInfoUrl":null}` | ------------------------------------------------------------------------- |
| settings.brpUrls.addressResearchMoreInfoUrl | string | `nil` | External link for more info on address research |
| settings.brpUrls.addressResearchUrl | string | `nil` | External link for address research |
| settings.brpUrls.changeInUseOfSurnameUrl | string | `nil` | External link for changing use of surname |
| settings.brpUrls.changeRegisteredGenderUrl | string | `nil` | External link for changing registered gender |
| settings.brpUrls.reportChangeOfAddressUrl | string | `nil` | External link for reporting address change |
| settings.brpUrls.requestConfidentialityOfDataUrl | string | `nil` | External link for requesting data confidentiality |
| settings.brpUrls.requestForChangeBrpInfoUrl | string | `nil` | External link for requesting BRP info change |
| settings.features | object | `{"casesPartialSearch":true,"messageCountEnable":true,"messageCountPollingInterval":10000,"openKlantVersion":null,"openProducten":false,"showCaseResultExplanation":false,"showInhabitantAmount":true,"useLegacyOgonePayment":false,"useThemeApi":false}` | ------------------------------------------------------------------------- |
| settings.features.casesPartialSearch | bool | `true` | Enable partial/fuzzy search for cases |
| settings.features.messageCountEnable | bool | `true` | Enable message count polling |
| settings.features.messageCountPollingInterval | int | `10000` | Polling interval for message count updates in milliseconds |
| settings.features.openKlantVersion | string | `nil` | OpenKlant API version: "v1" or "v2" |
| settings.features.openProducten | bool | `false` | Enable OpenProducten integration |
| settings.features.showCaseResultExplanation | bool | `false` | Show explanation of case result |
| settings.features.showInhabitantAmount | bool | `true` | Show inhabitant amount on overview page |
| settings.features.useLegacyOgonePayment | bool | `false` | Use legacy Ogone payment flow |
| settings.features.useThemeApi | bool | `false` | Whether to fetch theme from backend API |
| settings.oidc | object | `{"autoIdleSessionLogout":true,"clientID":null,"idleTimeoutMinutes":15,"postLogoutRedirectUrl":null,"realm":null,"redirectUrl":null,"url":null}` | ------------------------------------------------------------------------- |
| settings.oidc.autoIdleSessionLogout | bool | `true` | Enable automatic logout after idle timeout |
| settings.oidc.clientID | string | `nil` | Required: OIDC Client ID for the frontend |
| settings.oidc.idleTimeoutMinutes | int | `15` | Idle timeout in minutes before automatic logout |
| settings.oidc.postLogoutRedirectUrl | string | `nil` | If not specified, defaults to ${frontend_url} |
| settings.oidc.realm | string | `nil` | Required: OIDC Realm that contains users for NL Portal |
| settings.oidc.redirectUrl | string | `nil` | If not specified, defaults to ${frontend_url}/keycloak/callback |
| settings.oidc.url | string | `nil` | Note: For Keycloak versions <17, you must append /auth to this URL. |
| settings.overview | object | `{"currentCasesPreviewLength":2,"showCurrentCasesPreview":true,"showIntro":true,"showMaintenanceAlert":true}` | ------------------------------------------------------------------------- |
| settings.overview.currentCasesPreviewLength | int | `2` | Number of cases to display in the current cases preview |
| settings.overview.showCurrentCasesPreview | bool | `true` | Show preview of current cases on overview page |
| settings.overview.showIntro | bool | `true` | Show intro section on overview page |
| settings.overview.showMaintenanceAlert | bool | `true` | Show maintenance alert banner on overview page |
| settings.themeClass | string | `nil` | CSS theme class name for custom styling (e.g. "gemeente-x") |
| startupProbe.failureThreshold | int | `30` |  |
| startupProbe.httpGet.path | string | `"/"` |  |
| startupProbe.httpGet.port | int | `8081` |  |
| startupProbe.periodSeconds | int | `10` |  |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
