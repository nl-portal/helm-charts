# NL Portal 3.0.0 release notes

## Breaking changes

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

## New features

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

## Migration

See [migration.md](migration.md).
