{{/*
Username Auth plugin
{{- include "emqx.auth.username" .Values.auth.username }}
*/}}
{{- define "emqx.auth.username" -}}
{{- range $i, $v := .users }}
{{ printf "EMQX_AUTH__USER__%d__USERNAME" $i }}: {{ $v.username | b64enc }}
{{ printf "EMQX_AUTH__USER__%d__PASSWORD" $i }}: {{ $v.password | b64enc }}
{{- end }}
{{- end }}

{{/*
Redis Auth/ACL plugin
{{- include "emqx.auth.redis" .Values.auth.redis }}
*/}}
{{- define "emqx.auth.redis" -}}
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
{{ include "emqx.auth.redis-password" .Values.auth.redis }}
*/}}
{{- define "emqx.auth.redis-password" -}}
{{- if .password }}
EMQX_AUTH__REDIS__PASSWORD: {{ .password | b64enc }}
{{- end }}
{{- end }}
