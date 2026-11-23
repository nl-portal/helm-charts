# nl-portal-configpanel-backend

![Version: 4.0.0](https://img.shields.io/badge/Version-4.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 3.0.0](https://img.shields.io/badge/AppVersion-3.0.0-informational?style=flat-square)

NL-Portal Configuration Panel Helm chart to be used in Kubernetes clusters.

## Release notes

See [release notes](../release-notes/) for changes and migration steps per chart version.

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
| existingSecret | string | `nil` | Name of an existing Secret holding all secret configuration variables. If set, no Secret will be created by the chart and secretEnvVars is ignored. See `nl-portal-configpanel-backend/templates/secret.yaml` for required keys. |
| extraEnvVars | list | `[]` | Array with extra environment variables to add e.g: extraEnvVars:   - name: FOO     value: "bar" |
| extraVolumeMounts | list | `[]` | Optionally specify extra list of additional volumeMounts e.g: extraVolumeMounts:  - name: verify-certs    mountPath: /etc/ssl/certs/extra-certs/ |
| extraVolumes | list | `[]` | Optionally specify extra list of additional volumes e.g: extraVolumes:   - name: verify-certs     configMap:       name: verify-certs |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/nl-portal/configuration-panel-backend"` |  |
| image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0] | string | `"nl-portal-config-panel.example.com"` |  |
| ingress.tls | list | `[]` |  |
| livenessProbe | object | `{"failureThreshold":6,"httpGet":{"path":"/management/health/liveness","port":"http"},"initialDelaySeconds":5,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":1}` | Liveness probe for container health checking |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| readinessProbe | object | `{"failureThreshold":6,"httpGet":{"path":"/management/health/readiness","port":"http"},"initialDelaySeconds":5,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":1}` | Readiness probe for container health checking |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| secretEnvVars | list | `[]` | Optionally specify environment variables sourced from various Secrets Use for partial secret injection (individual keys from different secrets). Only used when existingSecret is null. Setting secretEnvVars disables the chart-managed Secret. e.g: secretEnvVars:   - name: DATABASE_PASSWORD     valueFrom:       secretKeyRef:         name: my-existing-secret         key: password |
| securityContext | object | `{}` |  |
| service.port | int | `80` |  |
| service.targetPort | int | `8080` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| settings | object | `{"app":{"cacheTTL":30000,"encryption":{"enabled":true,"key":""},"logLevel":"INFO","notify":{"client":{"clientId":"","clientSecret":"","scope":"","tokenUri":""},"connectTimeout":"","readTimeout":""},"notifyEnabled":false,"notifyList":"","security":{"allowedKeyPrefixes":null,"cors":{"allowedHeaders":"Authorization, Content-Type, Accept","allowedMethods":"GET, POST, PUT, DELETE","allowedOrigins":"*"}},"serverPrefix":"/configuration","serverToken":""},"auth":{"authorities":"","authoritiesClaimExpression":"","jwksURI":""},"database":{"password":"","url":"","username":""}}` | Application Settings |
| settings.app.cacheTTL | int | `30000` | Used to set the duration at which the configuration cache is evicted in milliseconds. |
| settings.app.encryption.enabled | bool | `true` | Encrypt configuration values in the database and when served to NL Portal. |
| settings.app.encryption.key | string | `""` | Required when encryption is enabled: Base64-encoded 32-byte key (`openssl rand -base64 32`). NL Portal needs the same key. If using existingSecret, set via key: CONFIG_ENCRYPTION_KEY |
| settings.app.logLevel | string | `"INFO"` | logLevel can be one of: TRACE, DEBUG, INFO, WARN, ERROR |
| settings.app.notify.client | object | `{"clientId":"","clientSecret":"","scope":"","tokenUri":""}` | OAuth2 client-credentials client the panel uses to get a token for NL Portal's actuator. Required when notifyEnabled. |
| settings.app.notify.client.clientSecret | string | `""` | If using existingSecret, set via key: CONFIG_NOTIFY_CLIENT_SECRET |
| settings.app.notify.client.scope | string | `""` | Optional: comma-separated scopes to request. Empty: no scope parameter. |
| settings.app.notify.client.tokenUri | string | `""` | Token endpoint of the identity provider, e.g. https://keycloak.example.com/realms/gzac/protocol/openid-connect/token |
| settings.app.notify.connectTimeout | string | `""` | Optional: connect timeout for the token request and the NL Portal calls. Empty: application default 5s. |
| settings.app.notify.readTimeout | string | `""` | Optional: read timeout for the token request and the NL Portal calls. Empty: application default 10s. |
| settings.app.notifyEnabled | bool | `false` | Whether to notify NL Portal instances when configuration is changed. |
| settings.app.notifyList | string | `""` | A comma separated list of NL Portal base URLs that should receive a Spring Actuator Restart request if Notify is enabled. |
| settings.app.security.allowedKeyPrefixes | string | `nil` | Optional: comma-separated property key prefixes the panel reads, writes, deletes and serves. null: application default nl-portal.config.,nl-portal.frontend. An empty value is refused. |
| settings.app.serverPrefix | string | `"/configuration"` | Used to customise the base path of the spring configuration server. Application base URL is used as the configuration server if not set. |
| settings.app.serverToken | string | `""` | The token that should be used to authenticate configuration queries. Every NL Portal needs to have this value set for their Spring Cloud Configuration Client. |
| settings.auth.authorities | string | `""` | Optional: comma-separated authorities allowed to use the panel. Empty: application default ROLE_CONFIG_PANEL_ADMIN. |
| settings.auth.authoritiesClaimExpression | string | `""` | Optional: SpEL claim expression for the user's roles. Empty: application default ['realm_access']['roles']. |
| settings.auth.jwksURI | string | `""` | Required: JSON Web Key Set (JWKS) URI for validating tokens |
| settings.database.password | string | `""` | If using extraSecretEnvVars, set via name: DATABASE_PASSWORD |
| settings.database.url | string | `""` | Required: JDBC-style URL to a Postgres database, e.g. jdbc:postgresql://localhost:5432/nl-portal |
| settings.database.username | string | `""` | If using extraSecretEnvVars, set via name: DATABASE_USERNAME |
| startupProbe | object | `{"failureThreshold":90,"httpGet":{"path":"/management/health","port":"http"},"periodSeconds":10}` | Startup probe for container initialization checking |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
