{{- define "mychart.systemlabels" }}
  labels:
    drive: ssd
    machine: frontdrive
    rack: 4c
    vcard: 8g
{{- end }}
{{- define "mychart.version" }}
app_name: {{ .Chart.Name }}
app_version: "{{ .Chart.Version }}"
{{- end }}