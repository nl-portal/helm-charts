# NL Portal 4.0.0 migration

Upgrading from NL Portal 3.x and charts 3.x to the 4.0.0 charts. See the [release notes](release-notes.md) for everything that changed.

## Upgrade steps

Upgrade in this order: configuration panel, nl-portal-backend, nl-portal-frontend.

1. **Check for the Bitnami subcharts.** Before 4.0.0, nl-portal-backend installed Bitnami `postgresql` and `keycloak` unless `tags.postgresql` / `tags.keycloak` were `false`. Run `kubectl get statefulsets -n <namespace>`.
   - If they are running and `settings.database.url` or `settings.keycloak.url` point at them, move that data to a database and Keycloak you run yourself first. The upgrade deletes those StatefulSets.
   - Their PVCs stay behind after the upgrade. Delete them once you no longer need them.
2. **Upgrade the configuration panel to 3.0.0** (nl-portal-configpanel-backend and nl-portal-configpanel-frontend charts 4.0.0).
   - Panel 3.0.0 serves NL Portal 3.x and 4.0 at the same time, so the running 3.x portal keeps working.
   - Its database migration copies the theme and document whitelist keys to their 4.0.0 names. Upgrading the portal before the panel loses those settings.
   - Enter the Open Product settings again in the panel.
   - Keep your application name. The panel stores configuration per application name, and its examples changed from `nl-portal-backend-libraries` to `nl-portal-app`. Leave `settings.app.clientApplicationName` (nl-portal-configpanel-frontend) and `settings.app.features.configurationPanel.applicationName` (nl-portal-backend) at the value you use today. Switching either to the new example name points it at an empty configuration.
   - Settings saved in the panel override the portal's environment variables. If you set the portal interface (`settings.frontend`) or Verificatie (`settings.services.verificatie`) in the nl-portal-backend chart, saving those sections in the panel replaces them.
3. **Update the nl-portal-backend values.**
   - Set `image.repository` to `ghcr.io/nl-portal/nl-portal-backend`, or remove your override. The old `nl-portal-app-backend` image has been archived, and NL Portal 4.0.0 and newer are only published under the new name. The chart prints a warning after `helm upgrade` while the old name is set.
   - Move the frontend values from the nl-portal-frontend chart to `settings.frontend`. See [Frontend values](#frontend-values). The toggles default to off, so set every feature you want explicitly, including the ones you never set because the old chart had them on.
   - Replace the removed values. See [Backend values](#backend-values). Templating fails while any of them is set, and the message lists every one it found with its replacement, so one `helm template` run with your values shows everything that is left.
   - If you set `settings.app.security.endpoints.unsecured`, include `/api/public/**`. The 4.0.0 frontend loads its features from `/api/public/frontend` without a token.
   - Check CORS. Unset `settings.app.security.cors` values no longer render, so NL Portal's default applies: every origin, header and method on `/**`. Before 4.0.0 the empty values turned CORS off. To keep it restricted, set `path` and all three of `allowedHeaders`, `allowedOrigins` and `allowedMethods`. Setting `path` replaces the whole default, and the lists you leave out end up empty.
4. **Upgrade nl-portal-backend to 4.0.0.** Check that `/actuator/health/readiness` is UP and that `GET /api/public/frontend` returns 200 without a token.
5. **Update the nl-portal-frontend values.** Set `image.repository` to `ghcr.io/nl-portal/nl-portal-frontend`, or remove your override. As for the backend, the chart warns while the archived `nl-portal-app-frontend` name is set. Remove `settings.features`, `settings.themeClass`, `settings.overview`, `settings.account` and `settings.brpUrls`.
6. **Upgrade nl-portal-frontend to 4.0.0** right after the backend. The 4.0.0 frontend gets its features from the 4.0.0 backend. Log in and check that the features you enabled show.
7. **Clean up.** Once every portal on the panel runs 4.0, delete the old keys listed in the panel's notice. Delete the leftover Bitnami PVCs from step 1.

## Frontend values

Frontend values move from nl-portal-frontend to nl-portal-backend:

| nl-portal-frontend 3.x | nl-portal-backend 4.0.0 |
| --- | --- |
| `settings.features.messageCountEnable` | `settings.frontend.toggles.messageCountEnabled` |
| `settings.features.messageCountPollingInterval` | `settings.frontend.properties.messageCountPollingInterval` |
| `settings.features.casesPartialSearch` | `settings.frontend.toggles.casesPartialSearchEnabled` |
| `settings.features.showInhabitantAmount` | `settings.frontend.toggles.myInhabitantCountEnabled` |
| `settings.features.openProducten` | `settings.frontend.toggles.openProductEnabled` |
| `settings.features.showCaseResultExplanation` | `settings.frontend.toggles.casesResultExplanationEnabled` |
| `settings.features.useThemeApi` | none; the theme is always served by the backend |
| `settings.features.useLegacyOgonePayment` | none; Ogone was removed |
| `settings.features.openKlantVersion` | none |
| `settings.themeClass` | `settings.frontend.properties.themeClass` |
| `settings.overview.showIntro` | `settings.frontend.toggles.overviewIntroEnabled` |
| `settings.overview.showMaintenanceAlert` | `settings.frontend.toggles.overviewMaintenanceAlertEnabled` |
| `settings.overview.showCurrentCasesPreview` | none |
| `settings.overview.currentCasesPreviewLength` | `settings.frontend.properties.overviewCurrentCasesPreviewLength` |
| `settings.account.showNotificationSubsection` | none |
| `settings.brpUrls.addressResearchUrl` | `settings.frontend.properties.myAddressResearchUrl` |
| `settings.brpUrls.addressResearchMoreInfoUrl` | `settings.frontend.properties.myAddressResearchMoreInfoUrl` |
| `settings.brpUrls.reportChangeOfAddressUrl` | `settings.frontend.properties.myAddressChangeUrl` |
| `settings.brpUrls.changeInUseOfSurnameUrl` | `settings.frontend.properties.myNameChangeUrl` |
| `settings.brpUrls.changeRegisteredGenderUrl` | `settings.frontend.properties.myGenderChangeUrl` |
| `settings.brpUrls.requestForChangeBrpInfoUrl` | `settings.frontend.properties.myBrpChangeUrl` |
| `settings.brpUrls.requestConfidentialityOfDataUrl` | `settings.frontend.properties.myBrpConfidentiallyChangeUrl` |

New in 4.0.0, without a 3.x counterpart: `settings.frontend.toggles.casesContactMomentsEnabled`, `settings.frontend.toggles.custom`, `settings.frontend.properties.overviewCurrentTasksPreviewLength`, `settings.frontend.properties.overviewMaintenanceAlert{Title,Text}{Nl,En}` and `settings.frontend.properties.custom`.

The toggles default to off in NL Portal 4.0.0. The old frontend chart defaulted `messageCountEnable`, `casesPartialSearch`, `showInhabitantAmount`, `overview.showIntro` and `overview.showMaintenanceAlert` to `true`, so set the ones you want explicitly. It also set `messageCountPollingInterval: 10000` and `overview.currentCasesPreviewLength: 2`; carry those over if you relied on them.

```yaml
# Frontend features (keeping the old chart defaults)
# Before: nl-portal-frontend
settings:
  features:
    messageCountEnable: true
    messageCountPollingInterval: 10000
    casesPartialSearch: true
    showInhabitantAmount: true
  themeClass: gemeente-x
  overview:
    showIntro: true
    showMaintenanceAlert: true
    currentCasesPreviewLength: 2

# After: nl-portal-backend
settings:
  frontend:
    toggles:
      messageCountEnabled: true
      casesPartialSearchEnabled: true
      myInhabitantCountEnabled: true
      overviewIntroEnabled: true
      overviewMaintenanceAlertEnabled: true
    properties:
      messageCountPollingInterval: 10000
      themeClass: gemeente-x
      overviewCurrentCasesPreviewLength: 2
```

## Backend values

| Removed nl-portal-backend value | Replacement |
| --- | --- |
| `settings.theme` | `settings.frontend.theme` |
| `settings.services.zakenapi.properties.zaakDocumentenConfig` | `settings.services.documentenapis.properties.{vertrouwelijkheidsaanduidingWhitelist,statusWhitelist}` |
| `settings.services.taak.properties.typeUrl`, `typeUrlV2` | `settings.services.taak.properties.objectTypeUrl` |
| `settings.services.payment.ogone` | none; the module was removed. Use `settings.services.payment.direct` |
| `settings.services.product.verbruiksObjectModificationEnabled` | none; use the `openproduct` module |
| `ssl.enabled` under `documentenapis.properties.configurations.openzaak`, `haalcentraal2.properties`, `haalcentraalHr.properties`, `dmn.properties`, `payment.direct.properties` | none; remove it. It never reached NL Portal |

```yaml
# Theme (nl-portal-backend)
# Before
settings:
  theme:
    logo: https://example.com/logo.svg
    style: ":root { --primary: #01689b; }"

# After
settings:
  frontend:
    theme:
      logo: https://example.com/logo.svg
      style: ":root { --primary: #01689b; }"
```

```yaml
# Document whitelists (nl-portal-backend)
# Before
settings:
  services:
    zakenapi:
      properties:
        zaakDocumentenConfig:
          vertrouwelijkheidsaanduidingWhitelist: OPENBAAR,INTERN
          statusWhitelist: DEFINITIEF

# After. Leave both empty to keep NL Portal's defaults.
settings:
  services:
    documentenapis:
      properties:
        vertrouwelijkheidsaanduidingWhitelist: OPENBAAR,INTERN
        statusWhitelist: DEFINITIEF
```

```yaml
# Taak (nl-portal-backend)
# Before
settings:
  services:
    taak:
      properties:
        typeUrl: https://objecttypen.example.com/api/v2/objecttypes/<uuid>
        typeUrlV2: https://objecttypen.example.com/api/v2/objecttypes/<uuid>

# After
settings:
  services:
    taak:
      properties:
        objectTypeUrl: https://objecttypen.example.com/api/v2/objecttypes/<uuid>
```
