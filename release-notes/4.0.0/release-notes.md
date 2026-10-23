# NL Portal 4.0.0 release notes

Charts: nl-portal-backend 4.0.0, nl-portal-frontend 4.0.0, nl-portal-configpanel-backend 4.0.0, nl-portal-configpanel-frontend 4.0.0.

nl-portal-backend and nl-portal-frontend carry `appVersion: 4.0.0`. The configpanel charts carry `appVersion: 3.0.0`.

## Breaking changes

- Images: the default `image.repository` is now `ghcr.io/nl-portal/nl-portal-backend` and `ghcr.io/nl-portal/nl-portal-frontend`. NL Portal 4.0.0 dropped the `-app` infix from its image names, so update `image.repository` if you override it. The old `nl-portal-app-backend` and `nl-portal-app-frontend` images have been archived. While `image.repository` still ends in either name, `helm install` / `helm upgrade` print a warning with the chart notes. Templating does not fail, so mirrors and own builds under the old name keep working.
- **Bring your own Keycloak and database.** nl-portal-backend no longer ships the Bitnami `postgresql` and `keycloak` subcharts. Before 4.0.0 they were installed with every release unless `tags` turned them off. Back up their data before upgrading: the upgrade removes those StatefulSets, and their PVCs remain.
- nl-portal-frontend renders only the OIDC settings and `backendUrl`. `settings.features`, `settings.themeClass`, `settings.overview`, `settings.account` and `settings.brpUrls` moved to `settings.frontend` in nl-portal-backend. Templating fails while any of them is set.
- nl-portal-backend removed values:
  - `settings.theme`: use `settings.frontend.theme`.
  - `settings.services.zakenapi.properties.zaakDocumentenConfig`: use the `settings.services.documentenapis.properties` whitelists.
  - `settings.services.payment.ogone`: the module was removed from NL Portal.
  - `settings.services.product.verbruiksObjectModificationEnabled`: removed together with the `updateProductVerbruiksObject` mutation.
  - `settings.services.taak.properties.typeUrl` and `typeUrlV2`: use `objectTypeUrl`.
  - The five `ssl.enabled` values under `documentenapis`, `haalcentraal2`, `haalcentraalHr`, `dmn` and `payment.direct`. They never reached NL Portal.

  Templating fails while any of these is set. The message lists every removed value it found, each with its replacement.
- nl-portal-backend module validation:
  - Adds: `besluitenapi` requires `documentenapis` and `zakenapi`.
  - Drops: `payment.direct` requires `objectenapi`. In 4.0.0 only the webhook needs it.
  - Drops: the `payment.ogone` rule.

## Fixes

- nl-portal-backend: `settings.app.security.endpoints.unsecured` renders only when set, so NL Portal's default `/api/public/**` survives. The 4.0.0 frontend loads its features from `/api/public/frontend` without a token. If you set the value, include `/api/public/**` yourself.
- nl-portal-backend: unset values no longer override NL Portal's defaults. These render only when set:
  - `settings.services.haalcentraal2.properties.brpFields`. Before, the empty value replaced NL Portal's default field set with an empty list.
  - `settings.app.security.cors`, rendered only when `path` is set. Before, the empty values replaced NL Portal's default (`/**` with `*` for headers, origins and methods) with a mapping that matched nothing.
  - `settings.services.documentenapis.properties.configurations.openzaak` and `dummydoc`, each rendered only when its `url` is set. Before, a configuration with an empty `url` matched every document URL.
  - `settings.services.haalcentraalHr.properties.ssl.*`. Before, the empty values gave HR an empty client certificate.
  - `settings.services.payment.direct.properties.webhookUrl`, `customTemplateUrl` and `configurations.belastingzaken.{language,currency}`. Before, these sent empty values to the PSP instead of NL Portal's defaults (`nl_NL`, `EUR`).
  - `settings.services.openklant2.properties.digitalAdressenReferentie`.
- nl-portal-backend: taak now reaches NL Portal through `settings.services.taak.properties.objectTypeUrl`.
- nl-portal-backend: `NLPORTAL_CONFIG_HAALCENTRAALHR_ENABLED` is rendered next to `NLPORTAL_CONFIG_HAALCENTRAAL_HR_ENABLED`, from the same value. NL Portal 4.0.0 reads it for the gemachtigde query and the frontend module list.

## New features

- nl-portal-backend:
  - `settings.frontend.{toggles,properties,theme,modulesWhitelist}`, served to the frontend by `GET /api/public/frontend`.
  - `settings.app.support.pingEndpoint.enabled` enables `GET /api/public/ping`.
  - `settings.services.verificatie`. `properties.url` is required when it is enabled.
  - `settings.services.openklant2.properties.klantContactCodeRegister.{zaak,product}`.
  - `settings.services.haalcentraal2.properties.allowedCitiesForBewoning`.
  - `settings.services.payment.direct.properties.configurations.belastingzaken.{creditcardEnabled,allowedNumberOfPayments}`.
  - `settings.services.documentenapis.properties.{vertrouwelijkheidsaanduidingWhitelist,statusWhitelist}`.

  New optional values render only when set, so NL Portal's defaults apply otherwise.

## Configuration panel 3.0.0

- Both images run as non-root: the backend as uid 1001, the frontend as uid 101.
- The frontend writes `config.js` on start, so it does not support `readOnlyRootFilesystem`.
- Port 8000 (debug) is gone. Use `JAVA_TOOL_OPTIONS` to debug.
- Open Product settings must be entered again in the panel.
- Panel 3.0.0 serves NL Portal 3.x and 4.0 at the same time, so upgrade the panel first. Delete the old keys listed in the panel's notice once every portal runs 4.0.
- The panel's examples use the application name `nl-portal-app` (was `nl-portal-backend-libraries`). The chart defaults stay empty. Configuration is stored per application name, so keep the name you use today. See the [migration](migration.md).
- Settings saved in the panel override the portal's environment variables, including the new portal interface and Verificatie sections.

## Migration

See [migration.md](migration.md).
