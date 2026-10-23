# NL Portal 2.1.0 release notes

- Moved `NLPORTAL_CONFIG_ZAKENAPI_PROPERTIES_SECRET` and `NLPORTAL_CONFIG_CATALOGIAPI_PROPERTIES_SECRET` secrets from ConfigMap into Secret
- Infer Keycloak instance's `HTTP_RELATIVE_PATH` setting based on the Keycloak version, but allow users to overwrite it via new `settings.keycloak.httpRelativePath` setting
- Added startup probe
