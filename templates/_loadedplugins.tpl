{{/*
Loaded Plugins
*/}}
{{- define "emqx.loadedPlugins" -}}
emqx_management,emqx_recon,emqx_retainer,emqx_dashboard
{{- if .Values.metrics.enabled -}}
,emqx_prometheus
{{- end }}
{{- if .Values.auth.redis.enabled -}}
,emqx_auth_redis
{{- end }}
{{- end }}
