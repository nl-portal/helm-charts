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

## Release notes

Release notes and migration instructions per NL Portal version live in [`release-notes/`](release-notes).
Versions are NL Portal versions, not chart versions. See [Versioning](#versioning).

| NL Portal | Release notes | Migration |
| --- | --- | --- |
| 4.0.0 | [release notes](release-notes/4.0.0/release-notes.md) | [migration](release-notes/4.0.0/migration.md) |
| 3.1.0 | [release notes](release-notes/3.1.0/release-notes.md) | [migration](release-notes/3.1.0/migration.md) |
| 3.0.5 | [release notes](release-notes/3.0.5/release-notes.md) | — |
| 3.0.0 | [release notes](release-notes/3.0.0/release-notes.md) | [migration](release-notes/3.0.0/migration.md) |
| 2.1.0 | [release notes](release-notes/2.1.0/release-notes.md) | — |
