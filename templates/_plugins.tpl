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
{{- if .Values.auth.mnesia.enabled -}}
,emqx_auth_mnesia
{{- end }}
{{- end }}

{{/*
Plugin configurations for ConfigMap
*/}}
{{- define "emqx.plugin.configmap" -}}
{{- if .Values.auth.mnesia.enabled }}
{{- include "emqx.auth.mnesia.configmap" .Values.auth.mnesia }}
{{- end }}
{{- if .Values.auth.redis.enabled }}
{{- include "emqx.auth.redis.configmap" .Values.auth.redis }}
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
{{- if .Values.auth.mnesia.enabled }}
{{- include "emqx.auth.mnesia.secret" .Values.auth.mnesia }}
{{- end }}
{{- if .Values.auth.redis.enabled }}
{{- include "emqx.auth.redis.secret" .Values.auth.redis }}
{{- end }}
{{- end }}
