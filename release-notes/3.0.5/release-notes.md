# NL Portal 3.0.5 release notes

Chart: nl-portal-backend 3.1.0.

## New features

- nl-portal-backend: `settings.services.product.verbruiksObjectModificationEnabled` (default `false`) renders `NLPORTAL_CONFIG_PRODUCT_VERBRUIKSOBJECTMODIFICATIONENABLED`. NL Portal 3.0.5 disables the `updateProductVerbruiksObject` GraphQL mutation by default, and this value re-enables it.

## Changes

- The new value is an unsafe fallback for existing implementations, not a recommended configuration. It is deprecated on introduction and is removed in 4.0.0, together with the mutation. Migrate to the `openproduct` module and the `updateProduct` mutation instead.
