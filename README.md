# NL Portal Helm charts

This repository contains the helm charts for the NL Portal application.

Find the helm configuration values here:

- [NL Portal Backend](https://github.com/nl-portal/helm-charts/tree/main/charts/nl-portal-backend/nl-portal-backend)
- [NL Portal Frontend](https://github.com/nl-portal/helm-charts/tree/main/charts/nl-portal-frontend/nl-portal-frontend)
- [NL Portal Config Panel Backend](https://github.com/nl-portal/helm-charts/tree/main/charts/nl-portal-configpanel-backend/nl-portal-configpanel-backend)
- [NL Portal Config Panel Frontend](https://github.com/nl-portal/helm-charts/tree/main/charts/nl-portal-configpanel-frontend/nl-portal-configpanel-frontend)

The generated list of published helm releases can be found [here](https://nl-portal.github.io/helm-charts/index.yaml).

## Add the repo and install a chart

```sh
# Add and update the repo
helm repo add nl-portal https://nl-portal.github.io/helm-charts
helm repo update

# List available charts
helm search repo nl-portal

# Install or upgrade a chart (example: backend)
helm upgrade --install nl-portal-backend nl-portal/nl-portal-backend \
  --namespace nl-portal --create-namespace \
  -f your-values.yaml

# Swap the chart name above for other charts, e.g.
# nl-portal/nl-portal-frontend
# nl-portal/nl-portal-configpanel-backend
# nl-portal/nl-portal-configpanel-frontend
```

## Versioning

Chart versions and NL Portal versions are tracked separately.

`appVersion` names the NL Portal version a chart ships with by default, and is what `image.tag` falls
back to when you do not set it. A single chart version is expected to work with every patch release on
that minor line: `image.tag: 3.1.2` against a chart whose `appVersion` is `3.1.0` is a supported
combination and needs no new chart. So `appVersion` trailing behind the newest patch is normal.

The chart gets a new `version` when the chart itself changes, so templates, values or defaults, and
when a new NL Portal release is not compatible with the current chart, for example because the app
starts requiring a configuration key the chart does not render. A new app minor normally falls in that
second category. The bump then carries the matching `appVersion`.

Pin the chart `version` in your deployment and pick the app patch with `image.tag`.

The config panel charts follow the same rule against their own application version, which is not the
NL Portal version.

## Changelogs

### NL Portal

#### 3.1.0

Charts: nl-portal-backend 3.2.0, nl-portal-frontend 3.1.0.

**New features:**

- nl-portal-backend: `settings.keycloak.tokenExchangeVersion` picks the token exchange variant, `v1` (default) or `v2`. It renders `KEYCLOAK_TOKEN_EXCHANGE_VERSION`. `v2` is the Keycloak Standard Token Exchange and needs Keycloak 26.2 or newer next to NL Portal 3.1.0 or newer.
- nl-portal-backend: `settings.keycloak.acceptedAudiences` renders `SPRING_SECURITY_OAUTH2_RESOURCESERVER_JWT_AUDIENCES`, which limits the backend to tokens issued for the given audiences. Empty by default, because it only works when the frontend client and the m2m client both carry an audience mapper naming the m2m client.
- nl-portal-backend: templating rejects `tokenExchangeVersion: v2` when the deployed NL Portal version is older than 3.1.0, so the mismatch surfaces at render time instead of at startup. The version comes from `image.tag`, falling back to the chart `appVersion`. A tag that is not a semantic version, such as `latest` or a digest, cannot be checked and is left alone.
- nl-portal-backend: templating validates module dependencies. Enabling a module without the modules it needs now fails with a message naming the missing values:

  | Enabled module | Also requires |
  | --- | --- |
  | `taak` | `objectenapi` |
  | `berichten` | `objectenapi`, `documentenapis` |
  | `zakenapi` | `objectenapi`, `catalogiapi`, `documentenapis`, `besluitenapi` |
  | `openproduct` | `objectenapi`, `catalogiapi`, `documentenapis`, `besluitenapi`, `zakenapi`, `taak` |
  | `product` | `objectenapi`, `catalogiapi`, `documentenapis`, `besluitenapi`, `zakenapi`, `taak` |
  | `payment.ogone`, `payment.direct` | `objectenapi` |

**Changes:**

- nl-portal-backend: `settings.keycloak.audience` is only required when `tokenExchangeVersion` is `v1`. With `v2` the value is optional, and it is only rendered when set.
- Both charts carry `appVersion: 3.1.0`.

**Migration:**

NL Portal 3.1.0 keeps a module with missing prerequisites inactive instead of failing to start. On 3.0.x the same configuration crashed the application, so the combinations the new validation rejects were already broken. Check the table above against your values before upgrading.

Staying on the legacy token exchange needs no change: `v1` remains the default and `audience` keeps its meaning.

```yaml
# Switching to the standard token exchange (v2)
# Before
settings:
  keycloak:
    audience: nl-portal-token-exchange

# After
settings:
  keycloak:
    tokenExchangeVersion: v2
    # Clear the v1 target client. Keycloak answers `Requested audience not available` when it is left in place.
    audience:
    # Optional, and only once both clients carry an audience mapper naming the m2m client.
    acceptedAudiences: nl-portal-m2m
```

The Keycloak realm needs matching changes. See the [NL Portal documentation](https://nl-portal.nl) for the client scope, the audience mappers and the migration order.

#### 3.0.5

Chart: nl-portal-backend 3.1.0.

**New features:**

- nl-portal-backend: `settings.services.product.verbruiksObjectModificationEnabled` (default `false`) renders `NLPORTAL_CONFIG_PRODUCT_VERBRUIKSOBJECTMODIFICATIONENABLED`. NL Portal 3.0.5 disables the `updateProductVerbruiksObject` GraphQL mutation by default, and this value re-enables it.

**Changes:**

- The new value is an unsafe fallback for existing implementations, not a recommended configuration. It is deprecated on introduction and is removed in 4.0.0, together with the mutation. Migrate to the `openproduct` module and the `updateProduct` mutation instead.

#### 3.0.0

**Breaking changes:**

- `ingress.host` renamed to `ingress.hosts` (now a list) in nl-portal-backend and nl-portal-frontend
- `settings.app.features.configurationPanel.enabled` now defaults to `false` — explicitly enable if using config panel
- nl-portal-configpanel-backend: `secretEnvVars` pattern now coexists with new `existingSecret` option; both disable chart-managed Secret
- nl-portal-configpanel-backend: fixed `settings.app.configServerToken` → use `settings.app.serverToken`
- nl-portal-configpanel-backend: Secret now uses `stringData` (was broken `data` without base64 encoding)
- nl-portal-configpanel chart version jumps from 1.x to 3.0.0 (aligns chart family with nl-portal major version)
- `image.tag` default on configpanel charts changed from `"latest"` to `""` (uses appVersion)
- HPA API updated from `autoscaling/v2beta1` to `autoscaling/v2`
- Minimum Kubernetes version: 1.23 (`kubeVersion: ">=1.23.0"`)
- nl-portal-backend: removed misspelled `vertouwelijkheidsaanduidingWhitelist` key — use `vertrouwelijkheidsaanduidingWhitelist`
- nl-portal-backend: `settings.keycloak.token_exchange_secret` renamed to `settings.keycloak.clientSecret`; rendered Secret key is now `KEYCLOAK_CLIENT_SECRET` (was `KEYCLOAK_TOKEN_EXCHANGE_SECRET`) — update `existingSecret` contents accordingly
- nl-portal-backend: ConfigMap env var `KEYCLOAK_AUDIENCE` renamed to `KEYCLOAK_TOKEN_EXCHANGE_AUDIENCE` (matches what nl-portal-app actually reads; old name was never used by the app)
- nl-portal-backend: `settings.services.openklant` block removed (OpenKlant v1 module no longer exists in 3.x) — use `settings.services.openklant2`
- nl-portal-backend: `settings.services.haalcentraal_brp` block removed (HaalCentraal BRP v1 module no longer exists in 3.x) — use `settings.services.haalcentraal2`
- nl-portal-backend: `settings.services.haalcentraal_hr` renamed to `settings.services.haalcentraalHr` (env var names `NLPORTAL_CONFIG_HAALCENTRAAL_HR_*` unchanged)
- nl-portal-backend: `settings.services.zakenapi.properties.zaakdocumentenConfig` renamed to `zaakDocumentenConfig` (matches backend property casing; env var names unchanged)

**New features:**

Backend new env vars:
- `CONFIGURATION_PANEL_APPLICATION_NAME` — application name for config panel integration
- `NLPORTAL_CONFIG_OPENKLANT2_PROPERTIES_CONTACTGEGEVENSAPIURL` — OpenKlant2 contact details API URL
- `NLPORTAL_CONFIG_OPENPRODUCT_ENABLED` — enable OpenProduct module
- `NLPORTAL_CONFIG_OPENPRODUCT_PROPERTIES_PRODUCTAPIURL` — OpenProduct product API URL
- `NLPORTAL_CONFIG_OPENPRODUCT_PROPERTIES_PRODUCTTYPEAPIURL` — OpenProduct product type API URL
- `NLPORTAL_CONFIG_OPENPRODUCT_PROPERTIES_TOKEN` — OpenProduct API token (secret)
- `NLPORTAL_CONFIG_OPENPRODUCT_PROPERTIES_DMN_CLIENTID` — OpenProduct DMN client ID
- `NLPORTAL_CONFIG_OPENPRODUCT_PROPERTIES_DMN_USERNAME` — OpenProduct DMN username
- `NLPORTAL_CONFIG_OPENPRODUCT_PROPERTIES_DMN_SECRET` — OpenProduct DMN secret (secret)
- `NLPORTAL_CONFIG_OPENPRODUCT_PROPERTIES_DMN_PASSWORD` — OpenProduct DMN password (secret)
- `NLPORTAL_CONFIG_THEME_LOGO` — theme logo URL
- `NLPORTAL_CONFIG_THEME_STYLE` — theme style configuration
- `OIDC_REALM` — realm name (derived from `settings.keycloak.realm`)
- `NLPORTAL_AUTHENTICATION_MACHTINGSDIENST_ALLMACHTIGINGUUID`
- `NLPORTAL_CONFIG_ZAKENAPI_PROPERTIES_ZAAKTYPESIDSEXCLUDED`, `..._USENNPKVKQUERYIDENTIFICATORS`
- `NLPORTAL_CONFIG_DOCUMENTENAPIS_PROPERTIES_ALLOWEDMIMETYPES`, `..._CONFIGURATIONS_OPENZAAK_SSL_ENABLED`
- `NLPORTAL_CONFIG_VIRUSSCAN_CLAMAV_PROPERTIES_PORT`
- `NLPORTAL_CONFIG_OPENKLANT2_PROPERTIES_DIGITALADRESSENREFERENTIE`
- `NLPORTAL_CONFIG_HAALCENTRAAL2_PROPERTIES_APIKEY` (secret), `..._SSL_ENABLED`, `..._BRPFIELDS`
- `NLPORTAL_CONFIG_PREFILL_PROPERTIES_PREFILLSHAVERSION`
- `NLPORTAL_CONFIG_DMN_PROPERTIES_CLIENTID`, `..._USERNAME`, `..._SSL_ENABLED`, `..._SECRET` (secret), `..._PASSWORD` (secret)
- `NLPORTAL_CONFIG_PAYMENT_OGONE_PROPERTIES_CONFIGURATIONS_BELASTINGZAKEN_LANGUAGE`, `..._CURRENCY`, `..._SHAVERSION`
- `NLPORTAL_CONFIG_PAYMENT_DIRECT_PROPERTIES_SSL_ENABLED`, `..._WEBHOOKHEADERS`, `..._WEBHOOKURL`, `..._CUSTOMTEMPLATEURL`, `..._SHOWRESULTPAGE`, `..._CONFIGURATIONS_BELASTINGZAKEN_CURRENCY`

Frontend new env vars:
- `USE_THEME_API` — whether to fetch theme from backend API
- `OIDC_AUTO_IDLE_SESSION_LOGOUT` — enable automatic logout after idle timeout
- `OIDC_IDLE_TIMEOUT_MINUTES` — idle timeout in minutes before automatic logout
- `MESSAGE_COUNT_ENABLE` — enable message count polling
- `OPEN_PRODUCTEN` — enable OpenProducten integration
- `SHOW_CASE_RESULT_EXPLANATION` — show explanation of case result
- `USE_LEGACY_OGONE_PAYMENT` — use legacy Ogone payment flow

Other improvements:
- Frontend: `startupProbe`, `extraVolumes`/`extraVolumeMounts` support
- HPA now supports memory metric via `autoscaling.targetMemoryUtilizationPercentage`
- nl-portal-backend and nl-portal-configpanel-backend probes use `/actuator/health/*` endpoints

**Migration:**

```yaml
# Ingress: host → hosts (backend and frontend)
# Before (2.x)
ingress:
  host: "portal.example.com"

# After (3.x)
ingress:
  hosts:
    - portal.example.com
```

```yaml
# Configpanel-backend: existingSecret option added
# Before (2.x) - only secretEnvVars for external secrets
secretEnvVars:
  - name: DATABASE_PASSWORD
    valueFrom:
      secretKeyRef:
        name: my-secret
        key: password

# After (3.x) - can also use existingSecret for whole secret
existingSecret: my-secret
# Or keep using secretEnvVars for partial secret injection
```

#### 2.1.0

- Moved `NLPORTAL_CONFIG_ZAKENAPI_PROPERTIES_SECRET` and `NLPORTAL_CONFIG_CATALOGIAPI_PROPERTIES_SECRET` secrets from ConfigMap into Secret
- Infer Keycloak instance's `HTTP_RELATIVE_PATH` setting based on the Keycloak version, but allow users to overwrite it via new `settings.keycloak.httpRelativePath` setting
- Added startup probe
