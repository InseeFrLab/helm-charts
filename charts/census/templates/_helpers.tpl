{{/*
Expand the name of the chart.
*/}}
{{- define "census.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "census.fullname" -}}
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
{{- define "census.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "census.labels" -}}
helm.sh/chart: {{ include "census.chart" . }}
{{ include "census.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "census.selectorLabels" -}}
app.kubernetes.io/name: {{ include "census.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "census.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "census.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
{{/*
Expand the name of the chart.
*/}}

{{/* Pour maweb */}}


{{- define "census-maweb.name" -}}
{{- printf "%s-%s" (include "census.name" .) .Values.maweb.name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "census-maweb.fullname" -}}
{{- printf "%s-%s" (include "census.fullname" .) .Values.maweb.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "census-maweb.chart" -}}
{{- printf "census-maweb" -}}
{{- end }}

{{- define "census-maweb.labels" -}}
helm.sh/chart: {{ include "census-maweb.chart" . }}
{{ include "census-maweb.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}


{{- define "census-maweb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "census-maweb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "census-maweb.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "census-maweb.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
