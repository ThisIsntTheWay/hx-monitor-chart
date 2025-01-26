# hx-monitor

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

HX-Monitor Helm Chart

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Pods affinities |
| components | object | Component specification, see below for defaults | HX-Monitor core components |
| components.frontend.config.airspacesJsonUrl | string | `""` | Uses SHV hosted JSON if left empty |
| components.monitor.config.env | object | `{"TWILIO_CALL_LENGTH":36,"TWILIO_PARTIAL_TRANSCRIPTIONS":0,"USE_TWILIO_TRANSCRIPTION":1,"USE_WHISPER_TRANSCRIPTION":0,"WHISPER_DO_MODEL_DOWNLOAD":1,"WHISPER_MODEL":"tiny.en","WHISPER_MODELS_PATH":"./models_whisper"}` | Only envs as specified below will be templated |
| components.monitor.config.ngrok | object | `{"enable":false,"secret":{"authToken":"","create":true,"name":""}}` | ngrok config |
| components.monitor.config.ngrok.secret.authToken | string | `""` | ngrok auth token, used if 'create: true' |
| components.monitor.config.ngrok.secret.create | bool | `true` | Create secret. Set to 'false' if you bring your own secret    Must have key "NGROK_AUTH" |
| components.monitor.config.ngrok.secret.name | string | `""` | Name of your own custom secret |
| components.monitor.config.twilio | object | `{"secret":{"accountSid":"","apiKey":"","apiSecret":"","authToken":"","callFrom":"","create":true,"name":""}}` | Twilio credentials |
| components.monitor.config.twilio.secret.accountSid | string | `""` | Twilio account SID |
| components.monitor.config.twilio.secret.apiKey | string | `""` | Twilio API key  |
| components.monitor.config.twilio.secret.apiSecret | string | `""` | Twilio API secret  |
| components.monitor.config.twilio.secret.authToken | string | `""` | Twilio auth token |
| components.monitor.config.twilio.secret.callFrom | string | `""` | Twilio call from number |
| components.monitor.config.twilio.secret.create | bool | `true` | Create secret. Set to 'false' if you bring your own secret    See secret_twilio.yaml template for required keys |
| components.monitor.config.twilio.secret.name | string | `""` | Name of your own custom secret |
| components.monitor.config.whisper | object | `{"pvc":{"create":true,"name":"","size":"1Gi","storageClass":""}}` | Whisper config |
| components.monitor.config.whisper.pvc | object | `{"create":true,"name":"","size":"1Gi","storageClass":""}` | PVC used for whisper models |
| components.monitor.config.whisper.pvc.create | bool | `true` | Create PVC. Set to 'false' if you bring your own |
| components.monitor.config.whisper.pvc.name | string | `""` | Name of your own custom PVC |
| components.monitor.config.whisper.pvc.storageClass | string | `""` | The following fields are only used if 'create: true' |
| fullnameOverride | string | `""` |  |
| image | object | `{"pullPolicy":"IfNotPresent"}` | Global image definitions |
| imagePullSecrets | list | `[]` |  |
| ingress | object | `{"annotations":{},"className":"","host":"chart-example.local","tls":{"enabled":true,"secretName":""}}` | Ingress configuration, opiniated |
| ingress.host | string | `"chart-example.local"` | Host used for the ingress object (also TLS) |
| ingress.tls.enabled | bool | `true` | Enable TLS |
| ingress.tls.secretName | string | `""` | Certificate secret |
| mongoDb | object | `{"authDatabase":"hx","database":"hx","host":"","port":27017,"secretName":"","seedDatabase":false,"username":""}` | MongoDB config |
| mongoDb.authDatabase | string | `"hx"` | If defined uses custom auth database |
| mongoDb.database | string | `"hx"` | HX monitor database name |
| mongoDb.host | string | `""` | MongoDB host |
| mongoDb.port | int | `27017` | MongoDB port |
| mongoDb.secretName | string | `""` | Name of MongoDB secret containing the password    It needs the key "mongodb-passwords" |
| mongoDb.seedDatabase | bool | `false` | Seed database with initial data (Destructive!) |
| mongoDb.username | string | `""` | MongoDB username |
| nameOverride | string | `""` |  |
| namespaceOverride | string | `""` |  |
| nodeSelector | object | `{}` | Pods node selector |
| podAnnotations | object | `{}` | Global pod configs |
| podEnv | list | `[]` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| resources | object | `{}` | Pods resource constraints |
| securityContext | object | `{}` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` | Pods tolerations |

