{{/*
Expand the name of the chart.
*/}}
{{- define "nl-portal-frontend.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "nl-portal-frontend.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "nl-portal-frontend.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "nl-portal-frontend.labels" -}}
helm.sh/chart: {{ include "nl-portal-frontend.chart" . }}
{{ include "nl-portal-frontend.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "nl-portal-frontend.selectorLabels" -}}
app.kubernetes.io/name: {{ include "nl-portal-frontend.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "nl-portal-frontend.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "nl-portal-frontend.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Fails when values are set that this chart no longer supports, naming what replaces them.
*/}}
{{- define "nl-portal-frontend.validateRemovedValues" -}}
{{- $removed := list
    (list (list "settings" "features") "settings.features" "frontend features moved to the nl-portal-backend chart under settings.frontend.toggles")
    (list (list "settings" "themeClass") "settings.themeClass" "moved to the nl-portal-backend chart as settings.frontend.properties.themeClass")
    (list (list "settings" "overview") "settings.overview" "moved to the nl-portal-backend chart under settings.frontend.toggles and settings.frontend.properties")
    (list (list "settings" "account") "settings.account" "removed from NL Portal without replacement")
    (list (list "settings" "brpUrls") "settings.brpUrls" "moved to the nl-portal-backend chart as settings.frontend.properties.my*Url")
-}}
{{- $hits := list -}}
{{- range $entry := $removed -}}
{{- $node := $.Values -}}
{{- $found := true -}}
{{- range $key := index $entry 0 -}}
{{- if and $found (kindIs "map" $node) (hasKey $node $key) -}}
{{- $node = index $node $key -}}
{{- else -}}
{{- $found = false -}}
{{- end -}}
{{- end -}}
{{- if $found -}}
{{- $hits = append $hits $entry -}}
{{- end -}}
{{- end -}}
{{- $guide := "See the 4.0.0 migration guide at https://github.com/nl-portal/helm-charts/blob/main/release-notes/4.0.0/migration.md" -}}
{{- if eq (len $hits) 1 -}}
{{- $hit := first $hits -}}
{{- fail (printf "%s is no longer supported as of chart 4.0.0 (NL Portal 4.0.0): %s. %s" (index $hit 1) (index $hit 2) $guide) -}}
{{- else if $hits -}}
{{- $lines := list -}}
{{- range $hit := $hits -}}
{{- $lines = append $lines (printf "- %s: %s" (index $hit 1) (index $hit 2)) -}}
{{- end -}}
{{- fail (printf "%d values are no longer supported as of chart 4.0.0 (NL Portal 4.0.0):\n%s\n%s" (len $hits) (join "\n" $lines) $guide) -}}
{{- end -}}
{{- end -}}

{{/*
Warning text for NOTES.txt when image.repository still names the archived NL Portal 3.x image.
*/}}
{{- define "nl-portal-frontend.imageNotice" -}}
{{- $repository := .Values.image.repository | default "" | toString -}}
{{- if regexMatch `(^|/)nl-portal-app-frontend$` $repository -}}
WARNING: image.repository is {{ $repository }}.
The nl-portal-app-frontend image has been archived. NL Portal 4.0.0 and newer are published as ghcr.io/nl-portal/nl-portal-frontend.
See the 4.0.0 migration guide at https://github.com/nl-portal/helm-charts/blob/main/release-notes/4.0.0/migration.md
{{- end -}}
{{- end -}}

{{/* vim: set filetype=mustache: */}}
{{/*
Renders a value that contains template.
Usage:
{{ include "nl-portal-frontend.tplvalues.render" ( dict "value" .Values.path.to.the.Value "context" $) }}
*/}}
{{- define "nl-portal-frontend.tplvalues.render" -}}
    {{- if typeIs "string" .value }}
        {{- tpl .value .context }}
    {{- else }}
        {{- tpl (.value | toYaml) .context }}
    {{- end }}
{{- end -}}
