{{/*
Loaded Plugins
*/}}
{{- define "emqx.loadedPlugins" -}}
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
{{- end }}

{{/*
URL to scrap metrics from prometheus
*/}}
{{- define "emqx.metrics.url" -}}
http://${EMQX_MANAGEMENT__DEFAULT_APPLICATION__ID}:${EMQX_MANAGEMENT__DEFAULT_APPLICATION__SECRET}@localhost:8081/api/v4/emqx_prometheus?type=prometheus
{{- end }}
