{{/*
Redis Auth/ACL plugin
{{- include "emqx.auth.redis.configmap" .Values.auth.redis }}
*/}}
{{- define "emqx.auth.redis.configmap" -}}
EMQX_AUTH__REDIS__TYPE: {{ .type }}
EMQX_AUTH__REDIS__SERVER: {{ .server }}
{{- if eq .type "sentinel" }}
EMQX_AUTH__REDIS__SENTINEL: {{ .sentinel }}
{{- end }}
EMQX_AUTH__REDIS__POOL: {{ .pool | quote }}
EMQX_AUTH__REDIS__DATABASE: {{ .database | quote }}
EMQX_AUTH__REDIS__QUERY_TIMEOUT: {{ .queryTimeout }}
EMQX_AUTH__REDIS__AUTH_CMD: {{ .authCmd }}
EMQX_AUTH__REDIS__PASSWORD_HASH: {{ .passwordHash }}
EMQX_AUTH__REDIS__SUPER_CMD: {{ .superCmd }}
EMQX_AUTH__REDIS__ACL_CMD: {{ .aclCmd }}
{{- end }}

{{/*
Redis Auth/ACL plugin (password only)
{{ include "emqx.auth.redis.secret" .Values.auth.redis }}
*/}}
{{- define "emqx.auth.redis.secret" -}}
{{- if .password }}
EMQX_AUTH__REDIS__PASSWORD: {{ .password | b64enc }}
{{- end }}
{{- end }}
