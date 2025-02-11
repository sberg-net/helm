{{/*
Create secret to access docker registry
*/}}
{{- define "imagePullSecret" }}
{{- printf "{\"auths\": {\"%s\": {\"auth\": \"%s\"}}}" .Values.privateRegistry.name (printf "%s:%s" .Values.privateRegistry.imagePullSecret.username .Values.privateRegistry.imagePullSecret.token | b64enc) | b64enc }}
{{- end }}


{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "eldix.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

