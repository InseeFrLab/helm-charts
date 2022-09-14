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

{{- define "census-maweb.configMapName" -}}
{{- printf "%s-cm-%s" (include "census.fullname" .) .Values.maweb.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "census-maweb.pvc" -}}
{{- printf "%s-pvc-%s" (include "census.fullname" .) .Values.maweb.name | trunc 63 | trimSuffix "-" -}}
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
{{- if .Values.maweb.serviceAccount.create }}
{{- default (include "census-maweb.fullname" .) .Values.maweb.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.maweb.serviceAccount.name }}
{{- end }}
{{- end }}


{{/* Pour nsi-ws */}}


{{- define "census-nsiws.name" -}}
{{- printf "%s-%s" (include "census.name" .) .Values.nsiws.name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "census-nsiws.fullname" -}}
{{- printf "%s-%s" (include "census.fullname" .) .Values.nsiws.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "census-nsiws.configMapName" -}}
{{- printf "%s-cm-%s" (include "census.fullname" .) .Values.nsiws.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "census-nsiws.pvc" -}}
{{- printf "%s-pvc-%s" (include "census.fullname" .) .Values.nsiws.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "census-nsiws.chart" -}}
{{- printf "census-nsiws" -}}
{{- end }}

{{- define "census-nsiws.labels" -}}
helm.sh/chart: {{ include "census-nsiws.chart" . }}
{{ include "census-nsiws.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}


{{- define "census-nsiws.selectorLabels" -}}
app.kubernetes.io/name: {{ include "census-nsiws.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}


{{/*
Create the name of the service account to use
*/}}
{{- define "census-nsiws.serviceAccountName" -}}
{{- if .Values.nsiws.serviceAccount.create }}
{{- default (include "census-nsiws.fullname" .) .Values.nsiws.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.nsiws.serviceAccount.name }}
{{- end }}
{{- end }}
