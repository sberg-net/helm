Create secret to access docker registry
*/}}
{{- define "imagePullSecret" }}
{{- printf "{\"auths\": {\"%s\": {\"auth\": \"%s\"}}}" .Values.privateRegistry.name (printf "%s:%s" .Values.privateRegistry.imagePullSecret.username .Values.privateRegistry.imagePullSecret.token | b64enc) | b64enc }}
{{- end }}

