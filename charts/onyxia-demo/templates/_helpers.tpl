{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "onyxia.ingress.hostname" -}}
{{- printf "%s-%s" "toto" .values.baseDomain }}
{{- end }}