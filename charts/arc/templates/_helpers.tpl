{{/*
Expand the name of the chart.
*/}}
{{- define "arc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "arc.fullname" -}}
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

{{- define "arcWs.fullname" -}}
{{ include "arc.fullname" . }}-{{ .Values.arcWs.applicationSuffix }}
{{- end }}

{{- define "arcWeb.fullname" -}}
{{ include "arc.fullname" . }}-{{ .Values.arcWeb.applicationSuffix }}
{{- end }}

{{- define "arcDb.fullname" -}}
{{ include "arc.fullname" . }}-{{ .Values.arcDb.applicationSuffix }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "arc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "arcWeb.labels" -}}
helm.sh/chart: {{ include "arc.chart" . }}
{{ include "arcWeb.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "arcWeb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "arc.name" . }}-{{ .Values.arcWeb.applicationSuffix }}
app.kubernetes.io/instance: {{ .Release.Name }}-{{ .Values.arcWeb.applicationSuffix }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "arcWs.labels" -}}
helm.sh/chart: {{ include "arc.chart" . }}
{{ include "arcWs.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "arcWs.selectorLabels" -}}
app.kubernetes.io/name: {{ include "arc.name" . }}-{{ .Values.arcWs.applicationSuffix }}
app.kubernetes.io/instance: {{ .Release.Name }}-{{ .Values.arcWs.applicationSuffix }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "arc.labels" -}}
helm.sh/chart: {{ include "arc.chart" . }}
{{ include "arc.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "arc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "arc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
