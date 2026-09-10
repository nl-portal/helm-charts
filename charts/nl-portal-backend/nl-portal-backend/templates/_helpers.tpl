{{/*
Expand the name of the chart.
*/}}
{{- define "nl-portal-backend.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "nl-portal-backend.fullname" -}}
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
{{- define "nl-portal-backend.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "nl-portal-backend.labels" -}}
helm.sh/chart: {{ include "nl-portal-backend.chart" . }}
{{ include "nl-portal-backend.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "nl-portal-backend.selectorLabels" -}}
app.kubernetes.io/name: {{ include "nl-portal-backend.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "nl-portal-backend.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "nl-portal-backend.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Fails when an enabled module misses a module it depends on.
NL Portal keeps such a module inactive without an error, so the deployment would come up healthy with the feature missing.
*/}}
{{- define "nl-portal-backend.validateModuleDependencies" -}}
{{- $services := .Values.settings.services | default dict -}}
{{- $enabled := dict
    "objectenapi" (dig "objectenapi" "enabled" false $services)
    "catalogiapi" (dig "catalogiapi" "enabled" false $services)
    "documentenapis" (dig "documentenapis" "enabled" false $services)
    "besluitenapi" (dig "besluitenapi" "enabled" false $services)
    "zakenapi" (dig "zakenapi" "enabled" false $services)
    "taak" (dig "taak" "enabled" false $services)
    "berichten" (dig "berichten" "enabled" false $services)
    "openproduct" (dig "openproduct" "enabled" false $services)
    "product" (dig "product" "enabled" false $services)
    "payment.ogone" (dig "payment" "ogone" "enabled" false $services)
    "payment.direct" (dig "payment" "direct" "enabled" false $services)
-}}
{{- $requirements := dict
    "taak" (list "objectenapi")
    "berichten" (list "objectenapi" "documentenapis")
    "zakenapi" (list "objectenapi" "catalogiapi" "documentenapis" "besluitenapi")
    "openproduct" (list "objectenapi" "catalogiapi" "documentenapis" "besluitenapi" "zakenapi" "taak")
    "product" (list "objectenapi" "catalogiapi" "documentenapis" "besluitenapi" "zakenapi" "taak")
    "payment.ogone" (list "objectenapi")
    "payment.direct" (list "objectenapi")
-}}
{{- range $module, $required := $requirements -}}
{{- if get $enabled $module -}}
{{- $missing := list -}}
{{- range $dependency := $required -}}
{{- if not (get $enabled $dependency) -}}
{{- $missing = append $missing (printf "settings.services.%s.enabled" $dependency) -}}
{{- end -}}
{{- end -}}
{{- if $missing -}}
{{- fail (printf "settings.services.%s.enabled is true, but the %s module also requires %s. Enable the missing modules, or disable %s." $module $module (join ", " $missing) $module) -}}
{{- end -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/* vim: set filetype=mustache: */}}
{{/*
Renders a value that contains template.
Usage:
{{ include "nl-portal-backend.tplvalues.render" ( dict "value" .Values.path.to.the.Value "context" $) }}
*/}}
{{- define "nl-portal-backend.tplvalues.render" -}}
    {{- if typeIs "string" .value }}
        {{- tpl .value .context }}
    {{- else }}
        {{- tpl (.value | toYaml) .context }}
    {{- end }}
{{- end -}}
