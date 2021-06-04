
{{/*
Environment of Mnesia Auth plugin for Secret
{{- include "emqx.auth.mnesia.secret" .Values.auth.mnesia }}
*/}}
{{- define "emqx.auth.mnesia.secret" -}}
{{- range $i, $v := .users }}
{{ printf "EMQX_AUTH__MNESIA__%d__LOGIN" $i }}: {{ $v.username | b64enc }}
{{ printf "EMQX_AUTH__MNESIA__%d__PASSWORD" $i }}: {{ $v.password | b64enc }}
{{- if $v.superuser -}}
{{ printf "EMQX_AUTH__MNESIA__%d__IS_SUPERUSER" $i }}: {{ "true" | b64enc }}
{{- else }}
{{ printf "EMQX_AUTH__MNESIA__%d__IS_SUPERUSER" $i }}: {{ "false" | b64enc }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Environment of Mnesia Auth plugin for ConfigMap
{{- include "emqx.auth.mnesia.configmap" .Values.auth.mnesia }}
*/}}
{{- define "emqx.auth.mnesia.configmap" -}}
EMQX_AUTH__MNESIA__AS: {{ .as }}
EMQX_AUTH__MNESIA__PASSWORD_HASH: {{ .passwordHash }}
{{- end }}
