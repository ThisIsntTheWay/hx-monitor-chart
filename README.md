# HX monitor chart
```bash
helm template hx-monitor
```

> [!WARNING]
> By default, the chart uses the `latest` tag for container images.  
> Versions of this chart are not coupled with versions of `hx-monitor` components.  

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