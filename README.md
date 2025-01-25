# HX monitor chart
Work in progress

```bash
helm template hx-monitor
```

## Sample values
```yaml
ingress:
  host: hx-monitor.example
  tls:
    enabled: false

components:
  monitor:
    config:
      twilio:
        secret:
          accountSid: ""
          authToken: ""
          apiKey: "" 
          apiSecret: ""
          callFrom: ""

mongoDb:
  secretName: mongodb
  username: hx
  authDatabase: hx
  host: mongodb-headless.hx-monitor.svc.cluster.local
```

ToDo:
- Secrets
  - [x] MongoDB config
- Deployments, service
  - [x] Frontend
  - [x] API backend
- Ingress
  - [x] Frontend
  - [x] API backend
- Tests
  - [ ] Rewrite