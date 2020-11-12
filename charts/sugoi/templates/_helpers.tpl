{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "sugoi.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "sugoi.ui.name" -}}
{{- printf "%s-%s" (include "sugoi.name" .) .Values.ui.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{- define "sugoi.api.name" -}}
{{- printf "%s-%s" (include "sugoi.name" .) .Values.api.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "sugoi.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "sugoi.ui.fullname" -}}
{{- printf "%s-%s" (include "sugoi.fullname" .) .Values.ui.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{- define "sugoi.api.fullname" -}}
{{- printf "%s-%s" (include "sugoi.fullname" .) .Values.api.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "sugoi.chart" -}}
{{- printf "sugoi" -}}
{{- end -}}

{{- define "sugoi.api.chart" -}}
{{- printf "sugoi-api" -}}
{{- end -}}

{{- define "sugoi.ui.chart" -}}
{{- printf "sugoi-ui" -}}
{{- end -}}


{{/*Common labels*/}}

{{- define "sugoi.labels" -}}
helm.sh/chart: {{ include "sugoi.chart" . }}
{{ include "sugoi.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "sugoi.api.labels" -}}
helm.sh/chart: {{ include "sugoi.api.chart" . }}
{{ include "sugoi.api.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "sugoi.ui.labels" -}}
helm.sh/chart: {{ include "sugoi.ui.chart" . }}
{{ include "sugoi.ui.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*Selector labels*/}}
{{- define "sugoi.selectorLabels" -}}
app.kubernetes.io/name: {{ include "sugoi.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}


{{- define "sugoi.api.selectorLabels" -}}
app.kubernetes.io/name: {{ include "sugoi.api.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "sugoi.ui.selectorLabels" -}}
app.kubernetes.io/name: {{ include "sugoi.ui.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*Create the name of the service account to use*/}}

{{- define "sugoi.api.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "sugoi.api.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{- define "sugoi.ui.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "sugoi.ui.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}
