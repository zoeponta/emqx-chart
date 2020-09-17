{{/*
List of loaded plugins
*/}}
{{- define "emqx.plugin.list" -}}
emqx_management,emqx_recon,emqx_retainer
{{- if .Values.dashboard.enabled -}}
,emqx_dashboard
{{- end }}
{{- if .Values.metrics.enabled -}}
,emqx_prometheus
{{- end }}
{{- if .Values.auth.redis.enabled -}}
,emqx_auth_redis
{{- end }}
{{- if .Values.auth.username.enabled -}}
,emqx_auth_username
{{- end }}
{{- end }}

{{/*
Plugin configurations for ConfigMap
*/}}
{{- define "emqx.plugin.config" -}}
{{- if .Values.auth.redis.enabled }}
{{- include "emqx.auth.redis" .Values.auth.redis }}
{{- end }}
{{- end }}

{{/*
Plugin configurations for Secret
*/}}
{{- define "emqx.plugin.secret" -}}
{{- if .Values.dashboard.enabled }}
EMQX_DASHBOARD__DEFAULT_USER__LOGIN: {{ .Values.dashboard.defaultUsername | b64enc }}
EMQX_DASHBOARD__DEFAULT_USER__PASSWORD: {{ .Values.dashboard.defaultPassword | b64enc }}
{{- end }}
{{- if .Values.auth.username.enabled }}
{{- include "emqx.auth.username" .Values.auth.username }}
{{- end }}
{{- if .Values.auth.redis.enabled }}
{{- include "emqx.auth.redis-password" .Values.auth.redis }}
{{- end }}
{{- end }}
