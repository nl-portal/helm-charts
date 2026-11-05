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
Depending on the module, NL Portal then either keeps it inactive without an error, or fails to start on a missing bean.
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
-}}
{{- $requirements := dict
    "taak" (list "objectenapi")
    "berichten" (list "objectenapi" "documentenapis")
    "besluitenapi" (list "documentenapis" "zakenapi")
    "zakenapi" (list "objectenapi" "catalogiapi" "documentenapis" "besluitenapi")
    "openproduct" (list "objectenapi" "catalogiapi" "documentenapis" "besluitenapi" "zakenapi" "taak")
    "product" (list "objectenapi" "catalogiapi" "documentenapis" "besluitenapi" "zakenapi" "taak")
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

{{/*
Fails when values are set that this chart no longer supports, naming what replaces them.
*/}}
{{- define "nl-portal-backend.validateRemovedValues" -}}
{{- $removed := list
    (list (list "settings" "theme") "settings.theme" "moved to settings.frontend.theme")
    (list (list "settings" "services" "zakenapi" "properties" "zaakDocumentenConfig") "settings.services.zakenapi.properties.zaakDocumentenConfig" "moved to settings.services.documentenapis.properties.vertrouwelijkheidsaanduidingWhitelist and statusWhitelist")
    (list (list "settings" "services" "product" "verbruiksObjectModificationEnabled") "settings.services.product.verbruiksObjectModificationEnabled" "removed together with the updateProductVerbruiksObject mutation; use the openproduct module")
    (list (list "settings" "services" "payment" "ogone") "settings.services.payment.ogone" "the Ogone payment module was removed from NL Portal; use settings.services.payment.direct")
    (list (list "settings" "services" "taak" "properties" "typeUrl") "settings.services.taak.properties.typeUrl" "never reached NL Portal; use settings.services.taak.properties.objectTypeUrl")
    (list (list "settings" "services" "taak" "properties" "typeUrlV2") "settings.services.taak.properties.typeUrlV2" "never reached NL Portal; use settings.services.taak.properties.objectTypeUrl")
    (list (list "settings" "services" "documentenapis" "properties" "configurations" "openzaak" "ssl" "enabled") "settings.services.documentenapis.properties.configurations.openzaak.ssl.enabled" "never reached NL Portal; remove it")
    (list (list "settings" "services" "haalcentraal2" "properties" "ssl" "enabled") "settings.services.haalcentraal2.properties.ssl.enabled" "never reached NL Portal; remove it")
    (list (list "settings" "services" "haalcentraalHr" "properties" "ssl" "enabled") "settings.services.haalcentraalHr.properties.ssl.enabled" "never reached NL Portal; remove it")
    (list (list "settings" "services" "dmn" "properties" "ssl" "enabled") "settings.services.dmn.properties.ssl.enabled" "never reached NL Portal; remove it")
    (list (list "settings" "services" "payment" "direct" "properties" "ssl" "enabled") "settings.services.payment.direct.properties.ssl.enabled" "never reached NL Portal; remove it")
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
{{- define "nl-portal-backend.imageNotice" -}}
{{- $repository := .Values.image.repository | default "" | toString -}}
{{- if regexMatch `(^|/)nl-portal-app-backend$` $repository -}}
WARNING: image.repository is {{ $repository }}.
The nl-portal-app-backend image has been archived. NL Portal 4.0.0 and newer are published as ghcr.io/nl-portal/nl-portal-backend.
See the 4.0.0 migration guide at https://github.com/nl-portal/helm-charts/blob/main/release-notes/4.0.0/migration.md
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
