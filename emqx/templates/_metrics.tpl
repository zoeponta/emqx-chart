{{/*
URL to scrap metrics from prometheus
*/}}
{{- define "emqx.metrics.url" -}}
http://${EMQX_MANAGEMENT__DEFAULT_APPLICATION__ID}:${EMQX_MANAGEMENT__DEFAULT_APPLICATION__SECRET}@localhost:8081/api/v4/emqx_prometheus?type=prometheus
{{- end }}
