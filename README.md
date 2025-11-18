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

#### 2.1.0

- Moved `NLPORTAL_CONFIG_ZAKENAPI_PROPERTIES_SECRET` and `NLPORTAL_CONFIG_CATALOGIAPI_PROPERTIES_SECRET` secrets from ConfigMap into Secret
- Infer Keycloak instance's `HTTP_RELATIVE_PATH` setting based on the Keycloak version, but allow users to overwrite it via new `settings.keycloak.httpRelativePath` setting
- Added startup probe
