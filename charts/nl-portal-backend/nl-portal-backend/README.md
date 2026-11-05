# nl-portal-backend

![Version: 4.0.0](https://img.shields.io/badge/Version-4.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 4.0.0](https://img.shields.io/badge/AppVersion-4.0.0-informational?style=flat-square)

Nl Portal backend Helm chart to be used in Kubernetes clusters.

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
| existingSecret | string | `nil` | Name of an existing Secret holding secret configuration variables. See `nl-portal-backend/templates/secret.yaml` as to what keys to set. |
| extraEnvVars | list | `[]` | Optionally specify extra list of additional volumes |
| extraVolumeMounts | list | `[]` | Optionally specify extra list of additional volumeMounts e.g: extraVolumeMounts:  - name: verify-certs    mountPath: /etc/ssl/certs/extra-certs/ |
| extraVolumes | list | `[]` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/nl-portal/nl-portal-backend"` |  |
| image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0] | string | `"your-nl-portal.example.com"` |  |
| ingress.tls | list | `[]` |  |
| livenessProbe.failureThreshold | int | `6` |  |
| livenessProbe.httpGet.path | string | `"/actuator/health/liveness"` |  |
| livenessProbe.httpGet.port | string | `"http"` |  |
| livenessProbe.initialDelaySeconds | int | `10` |  |
| livenessProbe.periodSeconds | int | `10` |  |
| livenessProbe.successThreshold | int | `1` |  |
| livenessProbe.timeoutSeconds | int | `1` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| readinessProbe.failureThreshold | int | `6` |  |
| readinessProbe.httpGet.path | string | `"/actuator/health/readiness"` |  |
| readinessProbe.httpGet.port | string | `"http"` |  |
| readinessProbe.initialDelaySeconds | int | `10` |  |
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
| settings | object | `{"app":{"features":{"configurationPanel":{"applicationName":"","enabled":false,"token":null,"uri":""}},"logLevel":"INFO","security":{"cors":{"config":{"allowedHeaders":"","allowedMethods":"","allowedOrigins":""},"path":""},"endpoints":{"unsecured":""}},"support":{"pingEndpoint":{"enabled":false}}},"database":{"password":"","url":null,"username":"nlportal"},"frontend":{"modulesWhitelist":"","properties":{"custom":null,"messageCountPollingInterval":null,"myAddressChangeUrl":null,"myAddressResearchMoreInfoUrl":null,"myAddressResearchUrl":null,"myBrpChangeUrl":null,"myBrpConfidentiallyChangeUrl":null,"myGenderChangeUrl":null,"myNameChangeUrl":null,"overviewCurrentCasesPreviewLength":null,"overviewCurrentTasksPreviewLength":null,"overviewMaintenanceAlertTextEn":null,"overviewMaintenanceAlertTextNl":null,"overviewMaintenanceAlertTitleEn":null,"overviewMaintenanceAlertTitleNl":null,"themeClass":null},"theme":{"logo":"","style":""},"toggles":{"casesContactMomentsEnabled":null,"casesPartialSearchEnabled":null,"casesResultExplanationEnabled":null,"custom":null,"messageCountEnabled":null,"myInhabitantCountEnabled":null,"openProductEnabled":null,"overviewIntroEnabled":null,"overviewMaintenanceAlertEnabled":null}},"keycloak":{"acceptedAudiences":null,"audience":null,"clientID":null,"clientSecret":null,"httpRelativePath":null,"realm":null,"tokenExchangeVersion":"v1","url":null,"version":null},"services":{"authentication":{"machtingsdienst":{"allMachtigingUuid":"","resourceUrl":""}},"berichten":{"enabled":false,"properties":{"berichtObjectTypeUrl":""}},"besluitenapi":{"enabled":false,"properties":{"clientId":"","secret":"","url":""}},"catalogiapi":{"enabled":false,"properties":{"clientId":"","secret":"","url":""}},"dmn":{"enabled":false,"properties":{"clientId":"","password":"","secret":"","url":"","username":""}},"documentenapis":{"enabled":false,"properties":{"allowedMimeTypes":"","configurations":{"dummydoc":{"clientId":"","documentTypeUrl":"","rsin":"","secret":"","url":""},"openzaak":{"clientId":"","documentTypeUrl":"","rsin":"","secret":"","url":""}},"defaultDocumentApi":"","statusWhitelist":"","vertrouwelijkheidsaanduidingWhitelist":""}},"haalcentraal2":{"enabled":false,"properties":{"allowedCitiesForBewoning":"","apiKey":"","bewoningApiUrl":"","brpApiUrl":"","brpFields":""}},"haalcentraalHr":{"enabled":false,"properties":{"apiKey":"","ssl":{"key":{"certChain":"","key":"","keyPassword":""},"trustedCertificate":""},"url":""}},"objectenapi":{"enabled":false,"properties":{"token":"","url":""}},"openklant2":{"enabled":false,"properties":{"contactgegevensApiUrl":"","digitalAdressenReferentie":"","klantContactCodeRegister":{"product":"","zaak":""},"klantinteractiesApiUrl":"","token":""}},"openproduct":{"enabled":false,"properties":{"dmn":{"clientId":"","password":"","secret":"","username":""},"productApiUrl":"","productTypeApiUrl":"","token":""}},"payment":{"direct":{"enabled":false,"properties":{"configurations":{"belastingzaken":{"allowedNumberOfPayments":null,"apiKey":"","apiSecret":"","creditcardEnabled":null,"currency":"","language":"","pspId":"","returnUrl":"","webhookApiKey":"","webhookApiSecret":""}},"customTemplateUrl":"","shaOutParameters":"","showResultPage":false,"url":"","webhookHeaders":"","webhookUrl":""}}},"prefill":{"enabled":false,"properties":{"prefillShaVersion":"","typeUrl":""}},"product":{"enabled":false,"properties":{"productDetailsTypeUrl":"","productInstantieTypeUrl":"","productTypeUrl":"","productVerbruiksObjectTypeUrl":""}},"taak":{"enabled":false,"properties":{"objectTypeUrl":""}},"verificatie":{"enabled":false,"properties":{"apiKey":"","clientId":"","secret":"","templateIdEmail":"","templateIdPhoneNumber":"","typesNeedVerification":"","url":""}},"virusscan":{"clamav":{"enabled":false,"properties":{"hostname":"","port":3310}}},"zakenapi":{"enabled":false,"properties":{"clientId":"","secret":"","url":"","useNnpKvkQueryIdentificators":false,"zaakTypesIdsExcluded":""}}}}` | Application Settings |
| settings.app.features.configurationPanel.token | string | `nil` | If using existingSecret, set via key: CONFIGURATION_PANEL_TOKEN |
| settings.app.logLevel | string | `"INFO"` | TODO: what log levels are there? |
| settings.app.security | object | `{"cors":{"config":{"allowedHeaders":"","allowedMethods":"","allowedOrigins":""},"path":""},"endpoints":{"unsecured":""}}` | CORS configuration |
| settings.app.security.cors.path | string | `""` | Optional: leave empty for NL Portal's default (path /**, headers, origins and methods *). Setting it replaces that default, so set allowedHeaders, allowedOrigins and allowedMethods too. |
| settings.app.security.endpoints.unsecured | string | `""` | Optional: comma separated list of paths that need no authentication. Leave empty to keep NL Portal's default `/api/public/**`, which the frontend needs for `/api/public/frontend`. Setting it replaces the default, so include `/api/public/**` yourself. |
| settings.app.support.pingEndpoint.enabled | bool | `false` | Enables `GET /api/public/ping`, a plain-text endpoint for monitoring tools. |
| settings.database.password | string | `""` | If using existingSecret, set via key: DATABASE_PASSWORD |
| settings.database.url | string | `nil` | Required: JDBC-style URL to a Postgres database, e.g. jdbc:postgresql://localhost:5432/nl-portal |
| settings.frontend | object | `{"modulesWhitelist":"","properties":{"custom":null,"messageCountPollingInterval":null,"myAddressChangeUrl":null,"myAddressResearchMoreInfoUrl":null,"myAddressResearchUrl":null,"myBrpChangeUrl":null,"myBrpConfidentiallyChangeUrl":null,"myGenderChangeUrl":null,"myNameChangeUrl":null,"overviewCurrentCasesPreviewLength":null,"overviewCurrentTasksPreviewLength":null,"overviewMaintenanceAlertTextEn":null,"overviewMaintenanceAlertTextNl":null,"overviewMaintenanceAlertTitleEn":null,"overviewMaintenanceAlertTitleNl":null,"themeClass":null},"theme":{"logo":"","style":""},"toggles":{"casesContactMomentsEnabled":null,"casesPartialSearchEnabled":null,"casesResultExplanationEnabled":null,"custom":null,"messageCountEnabled":null,"myInhabitantCountEnabled":null,"openProductEnabled":null,"overviewIntroEnabled":null,"overviewMaintenanceAlertEnabled":null}}` | Frontend features, served to the frontend by `GET /api/public/frontend`. NL Portal 4.0.0 moved these from the frontend chart to the backend. Unset (null) values are not rendered and count as off in NL Portal. |
| settings.frontend.modulesWhitelist | string | `""` | Optional: comma separated list of modules whose enabled state is exposed to the frontend. Leave empty for NL Portal's default: zakenapi, product, haalcentraalhr, haalcentraal2, taak, openproduct. |
| settings.frontend.properties.custom | string | `nil` | JSON string with custom properties for implementation-specific components |
| settings.frontend.properties.messageCountPollingInterval | string | `nil` | Polling interval for the message count in milliseconds |
| settings.frontend.properties.themeClass | string | `nil` | CSS theme class name set on the html element (e.g. "gemeente-x") |
| settings.frontend.theme.logo | string | `""` | Logo URL or data URI |
| settings.frontend.theme.style | string | `""` | CSS with design tokens |
| settings.frontend.toggles.custom | string | `nil` | JSON string with custom toggles for implementation-specific components |
| settings.keycloak.acceptedAudiences | string | `nil` | Optional: comma separated list of audiences the backend accepts on incoming tokens. Leaving this empty means the backend accepts any token signed by the realm, whichever client it was issued for. Only set it when both the frontend client and the m2m client carry an audience mapper naming the m2m client, otherwise every request fails with a 401. |
| settings.keycloak.audience | string | `nil` | Audience used for Keycloak token exchange, naming the target client. Required when `tokenExchangeVersion` is `v1`, and templating fails without it. Optional for `v2`, where the m2m client supplies the claims itself; the value is only passed on when set, and it must then be an audience the m2m client can already produce. A leftover v1 value is rejected by Keycloak with `Requested audience not available`, so clear it when switching to `v2`. |
| settings.keycloak.clientID | string | `nil` | Required: Client ID for NL Portal backend |
| settings.keycloak.clientSecret | string | `nil` | If using existingSecret, set via key: KEYCLOAK_CLIENT_SECRET |
| settings.keycloak.httpRelativePath | string | `nil` | Else, you should configure this value if your Keycloak instance has a non-default `KC_HTTP_RELATIVE_PATH`. |
| settings.keycloak.realm | string | `nil` | Required: Keycloak Realm that holds the NL Portal users |
| settings.keycloak.tokenExchangeVersion | string | `"v1"` | Token exchange variant used by the backend: `v1` or `v2`. `v1` is the Keycloak legacy token exchange and is the default. `v2` is the Keycloak Standard Token Exchange, and requires Keycloak 26.2 or newer and NL Portal 3.1.0 or newer. |
| settings.keycloak.url | string | `nil` | Required: URL of Keycloak, without any route parameters (e.g. without /auth) |
| settings.keycloak.version | string | `nil` | N.B. this is not necessarily the same as the Keycloak Helm chart version. |
| settings.services.besluitenapi.properties.secret | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_BESLUITENAPI_PROPERTIES_SECRET |
| settings.services.catalogiapi.properties.secret | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_CATALOGIAPI_PROPERTIES_SECRET |
| settings.services.dmn.properties.password | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_DMN_PROPERTIES_PASSWORD |
| settings.services.dmn.properties.secret | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_DMN_PROPERTIES_SECRET |
| settings.services.documentenapis.properties.allowedMimeTypes | string | `""` | Comma-separated list of allowed MIME types for document upload |
| settings.services.documentenapis.properties.configurations.dummydoc | object | `{"clientId":"","documentTypeUrl":"","rsin":"","secret":"","url":""}` | Optional: only rendered when url is set |
| settings.services.documentenapis.properties.configurations.dummydoc.documentTypeUrl | string | `""` | Required when url is set. |
| settings.services.documentenapis.properties.configurations.dummydoc.rsin | string | `""` | Required when url is set. |
| settings.services.documentenapis.properties.configurations.dummydoc.secret | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_DOCUMENTENAPIS_PROPERTIES_CONFIGURATIONS_DUMMYDOC_SECRET |
| settings.services.documentenapis.properties.configurations.openzaak | object | `{"clientId":"","documentTypeUrl":"","rsin":"","secret":"","url":""}` | Optional: only rendered when url is set |
| settings.services.documentenapis.properties.configurations.openzaak.documentTypeUrl | string | `""` | Required when url is set. |
| settings.services.documentenapis.properties.configurations.openzaak.rsin | string | `""` | Required when url is set. |
| settings.services.documentenapis.properties.configurations.openzaak.secret | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_DOCUMENTENAPIS_PROPERTIES_CONFIGURATIONS_OPENZAAK_SECRET |
| settings.services.documentenapis.properties.statusWhitelist | string | `""` | Optional: comma separated document statuses to show. Leave empty for NL Portal's default: DEFINITIEF, GEARCHIVEERD. |
| settings.services.documentenapis.properties.vertrouwelijkheidsaanduidingWhitelist | string | `""` | Optional: comma separated vertrouwelijkheidsaanduidingen of documents to show. Leave empty for NL Portal's default: OPENBAAR, BEPERKT_OPENBAAR, INTERN, ZAAKVERTROUWELIJK. |
| settings.services.haalcentraal2.properties.allowedCitiesForBewoning | string | `""` | Optional: comma separated list of cities for which bewoning is shown |
| settings.services.haalcentraal2.properties.apiKey | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_HAALCENTRAAL2_PROPERTIES_APIKEY |
| settings.services.haalcentraal2.properties.brpFields | string | `""` | Optional: comma separated BRP fields to request. Leave empty for NL Portal's default field set. |
| settings.services.haalcentraalHr.properties.apiKey | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_HAALCENTRAAL_HR_PROPERTIES_APIKEY |
| settings.services.haalcentraalHr.properties.ssl | object | `{"key":{"certChain":"","key":"","keyPassword":""},"trustedCertificate":""}` | Optional: client certificate for HR. Set key.certChain and key.key together. |
| settings.services.haalcentraalHr.properties.ssl.key.key | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_HAALCENTRAAL_HR_PROPERTIES_SSL_KEY_KEY |
| settings.services.haalcentraalHr.properties.ssl.key.keyPassword | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_HAALCENTRAAL_HR_PROPERTIES_SSL_KEY_KEYPASSWORD |
| settings.services.haalcentraalHr.properties.ssl.trustedCertificate | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_HAALCENTRAAL_HR_PROPERTIES_SSL_TRUSTEDCERTIFICATE |
| settings.services.objectenapi.properties.token | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_OBJECTENAPI_PROPERTIES_TOKEN |
| settings.services.openklant2.properties.digitalAdressenReferentie | string | `""` | Optional: only show digitale adressen with this referentie |
| settings.services.openklant2.properties.klantContactCodeRegister.product | string | `""` | Optional: only show klantcontacten linked to objects in this register for producten (e.g. "openproduct") |
| settings.services.openklant2.properties.klantContactCodeRegister.zaak | string | `""` | Optional: only show klantcontacten linked to objects in this register for zaken (e.g. "openzaak") |
| settings.services.openklant2.properties.token | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_OPENKLANT2_PROPERTIES_TOKEN |
| settings.services.openproduct.properties.dmn.password | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_OPENPRODUCT_PROPERTIES_DMN_PASSWORD |
| settings.services.openproduct.properties.dmn.secret | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_OPENPRODUCT_PROPERTIES_DMN_SECRET |
| settings.services.openproduct.properties.token | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_OPENPRODUCT_PROPERTIES_TOKEN |
| settings.services.payment.direct.properties.configurations.belastingzaken.allowedNumberOfPayments | string | `nil` | Optional: number of payments allowed per payment request. NL Portal default: 1 |
| settings.services.payment.direct.properties.configurations.belastingzaken.apiKey | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_PAYMENT_DIRECT_PROPERTIES_CONFIGURATIONS_BELASTINGZAKEN_APIKEY |
| settings.services.payment.direct.properties.configurations.belastingzaken.apiSecret | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_PAYMENT_DIRECT_PROPERTIES_CONFIGURATIONS_BELASTINGZAKEN_APISECRET |
| settings.services.payment.direct.properties.configurations.belastingzaken.creditcardEnabled | string | `nil` | Optional: allow creditcard payments. NL Portal default: false |
| settings.services.payment.direct.properties.configurations.belastingzaken.currency | string | `""` | Optional: NL Portal default EUR |
| settings.services.payment.direct.properties.configurations.belastingzaken.language | string | `""` | Optional: NL Portal default nl_NL |
| settings.services.payment.direct.properties.configurations.belastingzaken.webhookApiKey | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_PAYMENT_DIRECT_PROPERTIES_CONFIGURATIONS_BELASTINGZAKEN_WEBHOOKAPIKEY |
| settings.services.payment.direct.properties.configurations.belastingzaken.webhookApiSecret | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_PAYMENT_DIRECT_PROPERTIES_CONFIGURATIONS_BELASTINGZAKEN_WEBHOOKAPISECRET |
| settings.services.payment.direct.properties.customTemplateUrl | string | `""` | Optional |
| settings.services.payment.direct.properties.shaOutParameters | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_PAYMENT_DIRECT_PROPERTIES_SHAOUTPARAMETERS |
| settings.services.payment.direct.properties.webhookUrl | string | `""` | Optional |
| settings.services.taak.properties.objectTypeUrl | string | `""` | URL of the objecttype that holds the taken in the Objecten API |
| settings.services.verificatie.properties.apiKey | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_VERIFICATIE_PROPERTIES_APIKEY |
| settings.services.verificatie.properties.secret | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_VERIFICATIE_PROPERTIES_SECRET |
| settings.services.verificatie.properties.typesNeedVerification | string | `""` | Optional: comma separated list of TELEFOONNUMMER, EMAIL, OVERIG |
| settings.services.verificatie.properties.url | string | `""` | Required when enabled: URL of the verification service |
| settings.services.zakenapi.properties.secret | string | `""` | If using existingSecret, set via key: NLPORTAL_CONFIG_ZAKENAPI_PROPERTIES_SECRET |
| settings.services.zakenapi.properties.zaakTypesIdsExcluded | string | `""` | Comma-separated list of zaaktype UUIDs to exclude |
| startupProbe.failureThreshold | int | `90` |  |
| startupProbe.httpGet.path | string | `"/actuator/health"` |  |
| startupProbe.httpGet.port | string | `"http"` |  |
| startupProbe.periodSeconds | int | `10` |  |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
