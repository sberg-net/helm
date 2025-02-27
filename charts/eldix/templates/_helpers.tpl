{{- define "eldix.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "eldix.fullname" -}}
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

{{- define "eldix.env" }}
- name: TZ
  value: {{ default "Europe/Berlin" .Values.eldix.settings.tz | quote }}
- name: ERROR_MAIL_SENDER_ADDRESS
  value: {{ default "eldix@sberg.net" .Values.eldix.settings.error_mail_address | quote }}
- name: LOG_MAX_HIST
  value: {{ default "50" .Values.eldix.settings.log_max_host | quote }}
- name: LOG_MAX_FILE_SIZE
  value: {{ default "10MB" .Values.eldix.settings.log_max_file_size | quote }}
- name: LOG_LEVEL
  value: {{ default "info" .Values.eldix.settings.log_level | quote }}
- name: APP_PROFILES
  value: {{ default "default" .Values.eldix.settings.app_profile | quote }}
- name: FLYWAY_CHECKSUM_REPAIR
  value: {{ default "false" .Values.eldix.settings.flyway_checksum_repair | quote }}
{{- if and ( .Values.mariadb.enabled ) (not .Values.externalDatabase.enabled )}}
- name: DB_HOST
  value: {{ template "mariadb.primary.fullname" .Subcharts.mariadb }}
- name: DB_PORT
  value: {{ default "3306" .Values.mariadb.primary.service.ports.mysql | quote }}
- name: DB_NAME
  value: {{ required "mariadb.auth.database is required" .Values.mariadb.auth.database | quote }}
- name: DB_USER
  value: {{ required "mariadb.auth.username is required"  .Values.mariadb.auth.username | quote }}
- name: DB_PASSWORD
  value: {{ required "mariadb.auth.password is required"  .Values.mariadb.auth.password | quote }}
{{- if .Values.mariadb.auth.rootPassword }}
- name: DB_FLYWAY_USER
  value: "root"
- name: DB_FLYWAY_PASSWORD
  value: {{ .Values.mariadb.auth.rootPassword | quote }}
{{- end }}
{{- else }}
- name: DB_HOST
  value: {{ required "externalDatabase.hostname is required" .Values.externalDatabase.hostname | quote }}
- name: DB_PORT
  value: {{ default "3306" .Values.externalDatabase.port | quote }}
- name: DB_NAME
  value: {{ required "externalDatabase.database is required" .Values.externalDatabase.database | quote }}
- name: DB_USER
  value: {{ required "externalDatabase.username is required" .Values.externalDatabase.username | quote }}
- name: DB_PASSWORD
  value: {{ required "externalDatabase.password is required" .Values.externalDatabase.password | quote }}
{{- if .Values.externalDatabase.rootPassword }}
- name: DB_FLYWAY_USER
  value: root
- name: DB_FLYWAY_PASSWORD
  value: {{ .Values.externalDatabase.rootPassword | quote }}
{{- end }}
{{- end }}
{{- end }}
