# NL Portal 3.1.0 migration

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
