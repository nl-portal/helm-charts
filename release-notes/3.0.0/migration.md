# NL Portal 3.0.0 migration

```yaml
# Ingress: host → hosts (backend and frontend)
# Before (2.x)
ingress:
  host: "portal.example.com"

# After (3.x)
ingress:
  hosts:
    - portal.example.com
```

```yaml
# Configpanel-backend: existingSecret option added
# Before (2.x) - only secretEnvVars for external secrets
secretEnvVars:
  - name: DATABASE_PASSWORD
    valueFrom:
      secretKeyRef:
        name: my-secret
        key: password

# After (3.x) - can also use existingSecret for whole secret
existingSecret: my-secret
# Or keep using secretEnvVars for partial secret injection
```
