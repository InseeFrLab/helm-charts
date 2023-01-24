{{/*
Expand the name of the chart.
*/}}
{{- define "fauxpilot.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Expand the name of triton.
*/}}
{{- define "fauxpilot.nameTriton" -}}
{{ include "fauxpilot.name" . }}-triton
{{- end }}

{{/*
Expand the name of proxy.
*/}}
{{- define "fauxpilot.nameProxy" -}}
{{ include "fauxpilot.name" . }}-proxy
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "fauxpilot.fullname" -}}
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
Create triton name
*/}}
{{- define "fauxpilot.fullnameTriton" -}}
{{ include "fauxpilot.fullname" . }}-triton
{{- end }}

{{/*
Create proxy name
*/}}
{{- define "fauxpilot.fullnameProxy" -}}
{{ include "fauxpilot.fullname" . }}-proxy
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "fauxpilot.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "fauxpilot.labels" -}}
helm.sh/chart: {{ include "fauxpilot.chart" . }}
{{ include "fauxpilot.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
common Selector labels
*/}}
{{- define "fauxpilot.selectorLabels" -}}
app.kubernetes.io/name: {{ include "fauxpilot.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}


{{/*
Selector labels for triton
*/}}
{{- define "fauxpilot.selectorLabelsTriton" -}}
app.kubernetes.io/name: {{ include "fauxpilot.nameTriton" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Selector labels for triton
*/}}
{{- define "fauxpilot.selectorLabelsProxy" -}}
app.kubernetes.io/name: {{ include "fauxpilot.nameProxy" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "fauxpilot.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "fauxpilot.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
