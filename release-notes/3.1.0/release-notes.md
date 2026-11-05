# NL Portal 3.1.0 release notes

Charts: nl-portal-backend 3.2.0, nl-portal-frontend 3.1.0.

## New features

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

## Changes

- nl-portal-backend: `settings.keycloak.audience` is only required when `tokenExchangeVersion` is `v1`. With `v2` the value is optional, and it is only rendered when set.
- Both charts carry `appVersion: 3.1.0`.

## Migration

See [migration.md](migration.md).
