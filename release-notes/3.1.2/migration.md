# NL Portal 3.1.2 migration

Only relevant with `settings.services.payment.direct.enabled` or `settings.services.payment.ogone.enabled`. Set the payment profile URLs to the portal's URL, with the origin exactly as the browser shows it: lowercase scheme and host, no default port (`:443` or `:80`). Values set through `extraEnvVars` work too.

```yaml
# Direct payment (nl-portal-backend)
# Before
settings:
  services:
    payment:
      direct:
        enabled: true
        properties:
          configurations:
            belastingzaken:
              pspId: TAX

# After
settings:
  services:
    payment:
      direct:
        enabled: true
        properties:
          configurations:
            belastingzaken:
              pspId: TAX
              returnUrl: https://portal.example.nl
```

```yaml
# Ogone payment (nl-portal-backend)
# Before
settings:
  services:
    payment:
      ogone:
        enabled: true
        properties:
          configurations:
            belastingzaken:
              pspId: TAX

# After
settings:
  services:
    payment:
      ogone:
        enabled: true
        properties:
          configurations:
            belastingzaken:
              pspId: TAX
              successUrl: https://portal.example.nl
              failureUrl: https://portal.example.nl
```
