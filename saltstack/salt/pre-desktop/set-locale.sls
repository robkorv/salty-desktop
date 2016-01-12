{% from "pre-desktop/map.jinja" import pre_desktop with context %}
{% set locale = pre_desktop.get('locale') %}
{% set extra_locales = pre_desktop.get('extra-locales') %}
{% set language_packs = salt.cmd.run_stdout('check-language-support').split() %}

{% if language_packs %}
missing language packs:
  pkg.installed:
    - pkgs: {{ language_packs }}
{% endif %}

default locale present:
  locale.present:
    - name: {{ locale }}.UTF-8

default locale system:
  locale.system:
    - name: {{ locale }}.UTF-8

{% for extra_locale in extra_locales %}
{{ extra_locale }} locale present:
  locale.present:
    - name: {{ extra_locale }}.UTF-8
{% set language_packs = salt.cmd.run_stdout('check-language-support -l %s' % extra_locale).split() %}
{% if language_packs %}
{{ extra_locale }} missing language packs:
  pkg.installed:
    - pkgs: {{ language_packs }}
{% endif %}
{% endfor %}
