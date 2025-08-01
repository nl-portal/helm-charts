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
| existingSecret | string | `nil` | Name of an existing Secret holding secret configuration variables. See `nl-portal-backend/templates/secret.yaml` as to what keys to set. |
| extraEnvVars | list | `[]` | Optionally specify extra list of additional volumes |
| extraVolumeMounts | list | `[]` | Optionally specify extra list of additional volumeMounts e.g: extraVolumeMounts:  - name: verify-certs    mountPath: /etc/ssl/certs/extra-certs/ |
| extraVolumes | list | `[]` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"nginx"` |  |
| image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
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
| settings | object | `{"app":{"features":{"configurationPanel":{"enabled":true,"token":null,"uri":""}},"logLevel":"INFO","security":{"cors":{"config":{"allowedHeaders":"","allowedMethods":"","allowedOrigins":""},"path":""},"endpoints":{"unsecured":""}}},"database":{"password":"","url":null,"username":"nlportal"},"keycloak":{"audience":"gzac-portal-token-exchange","clientID":null,"realm":null,"token_exchange_secret":null,"url":null,"version":null},"services":{"authentication":{"machtingsdienst":{"resourceUrl":""}},"berichten":{"enabled":false,"properties":{"berichtObjectTypeUrl":""}},"besluitenapi":{"enabled":false,"properties":{"clientId":"","secret":"","url":""}},"catalogiapi":{"enabled":false,"properties":{"clientId":"","secret":"","url":""}},"dmn":{"enabled":false,"properties":{"url":""}},"documentenapis":{"enabled":false,"properties":{"configurations":{"dummydoc":{"clientId":"","secret":"","url":""},"openzaak":{"clientId":"","documentTypeUrl":"","rsin":"","secret":"","url":""}},"defaultDocumentApi":""}},"haalcentraal2":{"enabled":false,"properties":{"bewoningApiUrl":"","brpApiUrl":""}},"haalcentraal_brp":{"enabled":false,"properties":{"apiKey":"","ssl":{"enabled":false,"key":{"certChain":"","key":"","keyPassword":""},"trustedCertificate":""},"url":""}},"haalcentraal_hr":{"enabled":false,"properties":{"apiKey":"","ssl":{"enabled":false,"key":{"certChain":"","key":"","keyPassword":""},"trustedCertificate":""},"url":""}},"objectenapi":{"enabled":false,"properties":{"token":"","url":""}},"openklant":{"enabled":false,"properties":{"clientId":"","secret":"","url":""}},"openklant2":{"enabled":false,"properties":{"klantinteractiesApiUrl":"","token":""}},"payment":{"direct":{"enabled":false,"properties":{"configurations":{"belastingzaken":{"apiKey":"","apiSecret":"","language":"","pspId":"","returnUrl":"","webhookApiKey":"","webhookApiSecret":""}},"shaOutParameters":"","url":""}},"ogone":{"enabled":false,"properties":{"configurations":{"belastingzaken":{"failureUrl":"","pspId":"","shaInKey":"","shaOutKey":"","successUrl":"","title":""}},"shaOutParameters":"","url":""}}},"prefill":{"enabled":false,"properties":{"typeUrl":""}},"product":{"enabled":false,"properties":{"productDetailsTypeUrl":"","productInstantieTypeUrl":"","productTypeUrl":"","productVerbruiksObjectTypeUrl":""}},"taak":{"enabled":false,"properties":{"typeUrl":"","typeUrlV2":""}},"virusscan":{"clamav":{"enabled":false,"properties":{"hostname":""}}},"zakenapi":{"enabled":false,"properties":{"clientId":"","secret":"","url":"","zaakdocumentenConfig":{"statusWhitelist":"","vertrouwelijkheidsaanduidingWhitelist":""}}}}}` | Application Settings |
| settings.app.features.configurationPanel.token | string | `nil` | If using existingSecret, set via key: CONFIGURATION_PANEL_TOKEN |
| settings.app.logLevel | string | `"INFO"` | TODO: what log levels are there? |
| settings.app.security | object | `{"cors":{"config":{"allowedHeaders":"","allowedMethods":"","allowedOrigins":""},"path":""},"endpoints":{"unsecured":""}}` | CORS configuration |
| settings.database.password | string | `""` | If using existingSecret, set via key: DATABASE_PASSWORD |
| settings.database.url | string | `nil` | Required: JDBC-style URL to a Postgres database, e.g. jdbc:postgresql://localhost:5432/nl-portal |
| settings.keycloak.audience | string | `"gzac-portal-token-exchange"` | Required: TODO: explain |
| settings.keycloak.clientID | string | `nil` | Required: Client ID for NL Portal backend |
| settings.keycloak.realm | string | `nil` | Required: Keycloak Realm that holds the NL Portal users |
| settings.keycloak.token_exchange_secret | string | `nil` | If using existingSecret, set via key: KEYCLOAK_TOKEN_EXCHANGE_SECRET |
| settings.keycloak.url | string | `nil` | Required: URL of Keycloak, without any route parameters (e.g. without /auth) |
| settings.keycloak.version | string | `nil` | N.B. this is not necessarily the same as the Keycloak Helm chart version. |
| settings.services.besluitenapi.properties.secret | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_BESLUITENAPI_PROPERTIES_SECRET |
| settings.services.catalogiapi.properties.secret | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_CATALOGIAPI_PROPERTIES_SECRET |
| settings.services.documentenapis.properties.configurations.dummydoc.secret | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_DOCUMENTENAPIS_PROPERTIES_CONFIGURATIONS_DUMMYDOC_SECRET |
| settings.services.documentenapis.properties.configurations.openzaak.secret | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_DOCUMENTENAPIS_PROPERTIES_CONFIGURATIONS_OPENZAAK_SECRET |
| settings.services.haalcentraal_brp.properties.apiKey | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_HAALCENTRAAL_BRP_PROPERTIES_APIKEY |
| settings.services.haalcentraal_brp.properties.ssl.key.key | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_HAALCENTRAAL_BRP_PROPERTIES_SSL_KEY_KEY |
| settings.services.haalcentraal_brp.properties.ssl.key.keyPassword | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_HAALCENTRAAL_BRP_PROPERTIES_SSL_KEY_KEYPASSWORD |
| settings.services.haalcentraal_brp.properties.ssl.trustedCertificate | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_HAALCENTRAAL_BRP_PROPERTIES_SSL_TRUSTEDCERTIFICATE |
| settings.services.haalcentraal_hr.properties.apiKey | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_HAALCENTRAAL_HR_PROPERTIES_APIKEY |
| settings.services.haalcentraal_hr.properties.ssl.key.key | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_HAALCENTRAAL_HR_PROPERTIES_SSL_KEY_KEY |
| settings.services.haalcentraal_hr.properties.ssl.key.keyPassword | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_HAALCENTRAAL_HR_PROPERTIES_SSL_KEY_KEYPASSWORD |
| settings.services.haalcentraal_hr.properties.ssl.trustedCertificate | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_HAALCENTRAAL_HR_PROPERTIES_SSL_TRUSTEDCERTIFICATE |
| settings.services.objectenapi.properties.token | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_OBJECTENAPI_PROPERTIES_TOKEN |
| settings.services.openklant.properties.secret | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_OPENKLANT_PROPERTIES_SECRET |
| settings.services.openklant2.properties.token | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_OPENKLANT2_PROPERTIES_TOKEN |
| settings.services.payment.direct.properties.configurations.belastingzaken.apiKey | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_PAYMENT_DIRECT_PROPERTIES_CONFIGURATIONS_BELASTINGZAKEN_APIKEY |
| settings.services.payment.direct.properties.configurations.belastingzaken.apiSecret | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_PAYMENT_DIRECT_PROPERTIES_CONFIGURATIONS_BELASTINGZAKEN_APISECRET |
| settings.services.payment.direct.properties.configurations.belastingzaken.webhookApiKey | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_PAYMENT_DIRECT_PROPERTIES_CONFIGURATIONS_BELASTINGZAKEN_WEBHOOKAPIKEY |
| settings.services.payment.direct.properties.configurations.belastingzaken.webhookApiSecret | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_PAYMENT_DIRECT_PROPERTIES_CONFIGURATIONS_BELASTINGZAKEN_WEBHOOKAPISECRET |
| settings.services.payment.direct.properties.shaOutParameters | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_PAYMENT_DIRECT_PROPERTIES_SHAOUTPARAMETERS |
| settings.services.payment.ogone.properties.configurations.belastingzaken.shaInKey | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_PAYMENT_OGONE_PROPERTIES_CONFIGURATIONS_BELASTINGZAKEN_SHAINKEY |
| settings.services.payment.ogone.properties.configurations.belastingzaken.shaOutKey | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_PAYMENT_OGONE_PROPERTIES_CONFIGURATIONS_BELASTINGZAKEN_SHAOUTKEY |
| settings.services.payment.ogone.properties.shaOutParameters | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_PAYMENT_OGONE_PROPERTIES_SHAOUTPARAMETERS |
| settings.services.zakenapi.properties.secret | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_ZAKENAPI_PROPERTIES_SECRET |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
