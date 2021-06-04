{{/*
Image Pull Secrets
*/}}
{{- define "emqx.image.pullSecrets" -}}
{{- $pullSecrets := list -}}

{{- if .Values.global.imagePullSecrets -}}
  {{- range .Values.global.imagePullSecrets -}}
    {{- $pullSecrets = append $pullSecrets . -}}
  {{- end -}}
{{- end -}}

{{- range .Values.imagePullSecrets -}}
  {{- $pullSecrets = append $pullSecrets . -}}
{{- end -}}

{{- if (not (empty $pullSecrets)) -}}
imagePullSecrets:
  {{- range $pullSecrets }}
  - name: {{ . }}
  {{- end }}
{{- end }}
{{- end -}}
