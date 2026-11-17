# NL Portal 3.1.2 release notes

Chart: nl-portal-backend 3.2.1.

## Changes

- nl-portal-backend: `appVersion: 3.1.2`.
- NL Portal 3.1.2 fixes [GHSA-6rxj-f2rp-7mp3](https://github.com/nl-portal/nl-portal/security/advisories/GHSA-6rxj-f2rp-7mp3): the return URL of a payment is only used when it has the same origin as the URL in the payment profile. With `payment.direct` or `payment.ogone` enabled, set an absolute URL in the payment profile: without it, users do not return to the portal after paying.

## Migration

See [migration.md](migration.md).
