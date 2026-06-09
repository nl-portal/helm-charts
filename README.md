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

## Changelogs

### NL Portal

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

**New features:**

Backend new env vars:
- `CONFIGURATION_PANEL_APPLICATION_NAME` — application name for config panel integration
- `NLPORTAL_CONFIG_CATALOGIAPI_PROPERTIES_DOCUMENTTYPEURL` — Catalogi API document type URL
- `NLPORTAL_CONFIG_CATALOGIAPI_PROPERTIES_RSIN` — Catalogi API RSIN
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

Frontend new env vars:
- `USE_THEME_API` — whether to fetch theme from backend API
- `OIDC_AUTO_IDLE_SESSION_LOGOUT` — enable automatic logout after idle timeout
- `OIDC_IDLE_TIMEOUT_MINUTES` — idle timeout in minutes before automatic logout
- `MESSAGE_COUNT_ENABLE` — enable message count polling

Other improvements:
- Frontend: `startupProbe`, `extraVolumes`/`extraVolumeMounts` support
- HPA now supports memory metric via `autoscaling.targetMemoryUtilizationPercentage`
- Backend probes now use proper `/actuator/health/*` endpoints instead of GraphQL

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
