{{/*
Expand the name of the chart.
*/}}
{{- define "hx-monitor.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Define the namespace.
*/}}
{{- define "hx-monitor.namespace" -}}
{{- if .Values.namespaceOverride -}}
{{ .Values.namespaceOverride }}
{{- else -}}
{{ .Release.Namespace }}
{{- end -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "hx-monitor.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "hx-monitor.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "hx-monitor.labels" -}}
helm.sh/chart: {{ include "hx-monitor.chart" . }}
{{ include "hx-monitor.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "hx-monitor.selectorLabels" -}}
app.kubernetes.io/name: {{ include "hx-monitor.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "hx-monitor.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "hx-monitor.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Returns the appropriate URL based on whether Ngrok is enabled or not.
*/}}
{{- define "hx-monitor.ngrokOrIngressUrl" -}}
{{- if .Values.components.monitor.config.ngrok.enable -}}
""
{{- else -}}
"http{{ if .Values.ingress.tls }}s{{ end }}://{{ .Values.ingress.host }}"
{{- end -}}
{{- end -}}

{{/*
Assembles the name of the TWILIO credentials secret
*/}}
{{- define "hx-monitor.twilioCredentialsSecretName" -}}
{{- if .Values.components.monitor.config.twilio.secret.create -}}
{{ include "hx-monitor.fullname" . }}-twilio
{{- else -}}
{{- .Values.components.monitor.config.twilio.secret.name -}}
{{- end -}}
{{- end -}}

{{/*
Assembles an URL based on the ingress specification in values.yaml.
Uses http if TLS is not enabled, otherwise uses https.
*/}}
{{- define "hx-monitor.ingressUrl" -}}
"http{{ if .Values.ingress.tls.enabled }}s{{ end }}://{{ .Values.ingress.host }}"
{{- end -}}