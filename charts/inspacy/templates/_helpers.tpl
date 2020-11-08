{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "inspacy.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "inspacy.ui.name" -}}
{{- printf "%s-%s" (include "inspacy.name" .) .Values.ui.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{- define "inspacy.api.name" -}}
{{- printf "%s-%s" (include "inspacy.name" .) .Values.api.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "inspacy.fullname" -}}
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

{{- define "inspacy.ui.fullname" -}}
{{- printf "%s-%s" (include "inspacy.fullname" .) .Values.ui.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{- define "inspacy.api.fullname" -}}
{{- printf "%s-%s" (include "inspacy.fullname" .) .Values.api.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "inspacy.chart" -}}
{{- printf "inspacy" -}}
{{- end -}}

{{- define "inspacy.api.chart" -}}
{{- printf "inspacy-api" -}}
{{- end -}}

{{- define "inspacy.ui.chart" -}}
{{- printf "inspacy-ui" -}}
{{- end -}}


{{/*Common labels*/}}

{{- define "inspacy.labels" -}}
helm.sh/chart: {{ include "inspacy.chart" . }}
{{ include "inspacy.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "inspacy.api.labels" -}}
helm.sh/chart: {{ include "inspacy.api.chart" . }}
{{ include "inspacy.api.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "inspacy.ui.labels" -}}
helm.sh/chart: {{ include "inspacy.ui.chart" . }}
{{ include "inspacy.ui.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*Selector labels*/}}
{{- define "inspacy.selectorLabels" -}}
app.kubernetes.io/name: {{ include "inspacy.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}


{{- define "inspacy.api.selectorLabels" -}}
app.kubernetes.io/name: {{ include "inspacy.api.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "inspacy.ui.selectorLabels" -}}
app.kubernetes.io/name: {{ include "inspacy.ui.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*Create the name of the service account to use*/}}

{{- define "inspacy.api.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "inspacy.api.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{- define "inspacy.ui.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "inspacy.ui.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}
