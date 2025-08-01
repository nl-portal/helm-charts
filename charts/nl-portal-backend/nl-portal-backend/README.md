# nl-portal-backend

![Version: 2.0.0](https://img.shields.io/badge/Version-2.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.x.y](https://img.shields.io/badge/AppVersion-2.x.y-informational?style=flat-square)

Nl Portal backend Helm chart to be used in Kubernetes clusters.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://registry-1.docker.io/bitnamicharts | keycloak | ~15.1.2 |
| oci://registry-1.docker.io/bitnamicharts | postgresql | ~12.5.6 |

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
| extraVolumeMounts | list | `[]` | Optionally specify extra list of additional volumeMounts e.g: extraVolumeMounts:  - name: verify-certs    mountPath: /etc/ssl/certs/extra-certs/ |
| extraVolumes | list | `[]` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"nginx"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.host | string | `"your-nl-portal.example.com"` |  |
| ingress.tls | list | `[]` |  |
| livenessProbe.enabled | bool | `true` |  |
| livenessProbe.failureThreshold | int | `6` |  |
| livenessProbe.initialDelaySeconds | int | `120` |  |
| livenessProbe.periodSeconds | int | `10` |  |
| livenessProbe.successThreshold | int | `1` |  |
| livenessProbe.timeoutSeconds | int | `1` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| readinessProbe.enabled | bool | `true` |  |
| readinessProbe.failureThreshold | int | `6` |  |
| readinessProbe.initialDelaySeconds | int | `120` |  |
| readinessProbe.periodSeconds | int | `10` |  |
| readinessProbe.successThreshold | int | `1` |  |
| readinessProbe.timeoutSeconds | int | `1` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.port | int | `80` |  |
| service.targetPort | int | `8080` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| settings.app.features.configurationPanel.enabled | bool | `true` |  |
| settings.app.features.configurationPanel.token | string | `nil` |  |
| settings.app.features.configurationPanel.uri | string | `""` |  |
| settings.app.logLevel | string | `"INFO"` |  |
| settings.app.security.cors.config.allowedHeaders | string | `""` |  |
| settings.app.security.cors.config.allowedMethods | string | `""` |  |
| settings.app.security.cors.config.allowedOrigins | string | `""` |  |
| settings.app.security.cors.path | string | `""` |  |
| settings.app.security.endpoints.unsecured | string | `""` |  |
| settings.database.password | string | `""` |  |
| settings.database.url | string | `nil` |  |
| settings.database.username | string | `"nlportal"` |  |
| settings.keycloak.audience | string | `"gzac-portal-token-exchange"` |  |
| settings.keycloak.clientID | string | `"gzac-portal-m2m"` |  |
| settings.keycloak.realm | string | `"nlportal"` |  |
| settings.keycloak.token_exchange_secret | string | `nil` |  |
| settings.keycloak.url | string | `nil` |  |
| settings.keycloak.version | string | `nil` |  |
| settings.services.authentication.machtingsdienst.resourceUrl | string | `""` |  |
| settings.services.berichten.enabled | bool | `false` |  |
| settings.services.berichten.properties.berichtObjectTypeUrl | string | `""` |  |
| settings.services.besluitenapi.enabled | bool | `false` |  |
| settings.services.besluitenapi.properties.clientId | string | `""` |  |
| settings.services.besluitenapi.properties.secret | string | `""` |  |
| settings.services.besluitenapi.properties.url | string | `""` |  |
| settings.services.catalogiapi.enabled | bool | `false` |  |
| settings.services.catalogiapi.properties.clientId | string | `""` |  |
| settings.services.catalogiapi.properties.secret | string | `""` |  |
| settings.services.catalogiapi.properties.url | string | `""` |  |
| settings.services.dmn.enabled | bool | `false` |  |
| settings.services.dmn.properties.url | string | `""` |  |
| settings.services.documentenapis.enabled | bool | `false` |  |
| settings.services.documentenapis.properties.configurations.dummydoc.clientId | string | `""` |  |
| settings.services.documentenapis.properties.configurations.dummydoc.secret | string | `""` |  |
| settings.services.documentenapis.properties.configurations.dummydoc.url | string | `""` |  |
| settings.services.documentenapis.properties.configurations.openzaak.clientId | string | `""` |  |
| settings.services.documentenapis.properties.configurations.openzaak.documentTypeUrl | string | `""` |  |
| settings.services.documentenapis.properties.configurations.openzaak.rsin | string | `""` |  |
| settings.services.documentenapis.properties.configurations.openzaak.secret | string | `""` |  |
| settings.services.documentenapis.properties.configurations.openzaak.url | string | `""` |  |
| settings.services.documentenapis.properties.defaultDocumentApi | string | `""` |  |
| settings.services.haalcentraal2.enabled | bool | `false` |  |
| settings.services.haalcentraal2.properties.bewoningApiUrl | string | `""` |  |
| settings.services.haalcentraal2.properties.brpApiUrl | string | `""` |  |
| settings.services.haalcentraal_brp.enabled | bool | `false` |  |
| settings.services.haalcentraal_brp.properties.apiKey | string | `""` |  |
| settings.services.haalcentraal_brp.properties.ssl.enabled | bool | `false` |  |
| settings.services.haalcentraal_brp.properties.ssl.key.certChain | string | `""` |  |
| settings.services.haalcentraal_brp.properties.ssl.key.key | string | `""` |  |
| settings.services.haalcentraal_brp.properties.ssl.key.keyPassword | string | `""` |  |
| settings.services.haalcentraal_brp.properties.ssl.trustedCertificate | string | `""` |  |
| settings.services.haalcentraal_brp.properties.url | string | `""` |  |
| settings.services.haalcentraal_hr.enabled | bool | `false` |  |
| settings.services.haalcentraal_hr.properties.apiKey | string | `""` |  |
| settings.services.haalcentraal_hr.properties.ssl.enabled | bool | `false` |  |
| settings.services.haalcentraal_hr.properties.ssl.key.certChain | string | `""` |  |
| settings.services.haalcentraal_hr.properties.ssl.key.key | string | `""` |  |
| settings.services.haalcentraal_hr.properties.ssl.key.keyPassword | string | `""` |  |
| settings.services.haalcentraal_hr.properties.ssl.trustedCertificate | string | `""` |  |
| settings.services.haalcentraal_hr.properties.url | string | `""` |  |
| settings.services.objectenapi.enabled | bool | `false` |  |
| settings.services.objectenapi.properties.token | string | `""` |  |
| settings.services.objectenapi.properties.url | string | `""` |  |
| settings.services.openklant.enabled | bool | `false` |  |
| settings.services.openklant.properties.clientId | string | `""` |  |
| settings.services.openklant.properties.secret | string | `""` |  |
| settings.services.openklant.properties.url | string | `""` |  |
| settings.services.openklant2.enabled | bool | `false` |  |
| settings.services.openklant2.properties.klantinteractiesApiUrl | string | `""` |  |
| settings.services.openklant2.properties.token | string | `""` |  |
| settings.services.payment.direct.enabled | bool | `false` |  |
| settings.services.payment.direct.properties.configurations.belastingzaken.apiKey | string | `""` |  |
| settings.services.payment.direct.properties.configurations.belastingzaken.apiSecret | string | `""` |  |
| settings.services.payment.direct.properties.configurations.belastingzaken.language | string | `""` |  |
| settings.services.payment.direct.properties.configurations.belastingzaken.pspId | string | `""` |  |
| settings.services.payment.direct.properties.configurations.belastingzaken.returnUrl | string | `""` |  |
| settings.services.payment.direct.properties.configurations.belastingzaken.webhookApiKey | string | `""` |  |
| settings.services.payment.direct.properties.configurations.belastingzaken.webhookApiSecret | string | `""` |  |
| settings.services.payment.direct.properties.shaOutParameters | string | `""` |  |
| settings.services.payment.direct.properties.url | string | `""` |  |
| settings.services.payment.ogone.enabled | bool | `false` |  |
| settings.services.payment.ogone.properties.configurations.belastingzaken.failureUrl | string | `""` |  |
| settings.services.payment.ogone.properties.configurations.belastingzaken.pspId | string | `""` |  |
| settings.services.payment.ogone.properties.configurations.belastingzaken.shaInKey | string | `""` |  |
| settings.services.payment.ogone.properties.configurations.belastingzaken.shaOutKey | string | `""` |  |
| settings.services.payment.ogone.properties.configurations.belastingzaken.successUrl | string | `""` |  |
| settings.services.payment.ogone.properties.configurations.belastingzaken.title | string | `""` |  |
| settings.services.payment.ogone.properties.shaOutParameters | string | `""` |  |
| settings.services.payment.ogone.properties.url | string | `""` |  |
| settings.services.prefill.enabled | bool | `false` |  |
| settings.services.prefill.properties.typeUrl | string | `""` |  |
| settings.services.product.enabled | bool | `false` |  |
| settings.services.product.properties.productDetailsTypeUrl | string | `""` |  |
| settings.services.product.properties.productInstantieTypeUrl | string | `""` |  |
| settings.services.product.properties.productTypeUrl | string | `""` |  |
| settings.services.product.properties.productVerbruiksObjectTypeUrl | string | `""` |  |
| settings.services.taak.enabled | bool | `false` |  |
| settings.services.taak.properties.typeUrl | string | `""` |  |
| settings.services.taak.properties.typeUrlV2 | string | `""` |  |
| settings.services.virusscan.clamav.enabled | bool | `false` |  |
| settings.services.virusscan.clamav.properties.hostname | string | `""` |  |
| settings.services.zakenapi.enabled | bool | `false` |  |
| settings.services.zakenapi.properties.clientId | string | `""` |  |
| settings.services.zakenapi.properties.secret | string | `""` |  |
| settings.services.zakenapi.properties.url | string | `""` |  |
| settings.services.zakenapi.properties.zaakdocumentenConfig.statusWhitelist | string | `""` |  |
| settings.services.zakenapi.properties.zaakdocumentenConfig.vertrouwelijkheidsaanduidingWhitelist | string | `""` |  |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
