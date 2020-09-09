{{/*
Auth/ACL Plugins
*/}}
{{- define "emqx.auth" -}}
{{- if .Values.auth.redis.enabled }}
{{- include "emqx.auth.redis" . }}
{{- end }}
{{- end }}

{{/*
Redis Auth/ACL plugin
*/}}
{{- define "emqx.auth.redis" -}}
EMQX_AUTH__REDIS__TYPE: {{ .Values.auth.redis.type }}
EMQX_AUTH__REDIS__SERVER: {{ .Values.auth.redis.server }}
{{- if eq .Values.auth.redis.type "sentinel" }}
EMQX_AUTH__REDIS__SENTINEL: {{ .Values.auth.redis.sentinel }}
{{- end }}
EMQX_AUTH__REDIS__POOL: {{ .Values.auth.redis.pool | quote }}
EMQX_AUTH__REDIS__DATABASE: {{ .Values.auth.redis.database | quote }}
{{- if .Values.auth.redis.password }}
EMQX_AUTH__REDIS__PASSWORD: {{ .Values.auth.redis.password }}
{{- end }}
EMQX_AUTH__REDIS__QUERY_TIMEOUT: {{ .Values.auth.redis.queryTimeout }}
EMQX_AUTH__REDIS__AUTH_CMD: {{ .Values.auth.redis.authCmd }}
EMQX_AUTH__REDIS__PASSWORD_HASH: {{ .Values.auth.redis.passwordHash }}
EMQX_AUTH__REDIS__SUPER_CMD: {{ .Values.auth.redis.superCmd }}
EMQX_AUTH__REDIS__ACL_CMD: {{ .Values.auth.redis.aclCmd }}
{{- end }}
