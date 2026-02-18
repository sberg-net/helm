{{- define "app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "app.fullname" }}
    {{- $name := default .Chart.Name .Values.name -}}
    {{- printf "%s" $name -}}
{{ end -}}

{{/*
Create secret to access docker registry
*/}}
{{- define "imagePullSecret" }}
{{- printf "{\"auths\": {\"%s\": {\"auth\": \"%s\"}}}" .Values.privateRegistry.name (printf "%s:%s" .Values.privateRegistry.imagePullSecret.username .Values.privateRegistry.imagePullSecret.token | b64enc) | b64enc -}}
{{ end -}}

{{/*
Create image name that is used in the deployment
*/}}
{{- define "app.image" }}
{{- if .Values.app.image.repository }}
{{- printf "%s:%s" .Values.app.image.repository .Values.app.image.version -}}
{{ end -}}
{{ end -}}


{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "app.chart" }}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{ end -}}
