{% from "pre-desktop/map.jinja" import pre_desktop with context %}
{% set locale_system = pre_desktop.get('locale-system') %}
{% set locales_present = pre_desktop.get('locales-present') %}
{% set system_language_packs = salt.cmd.run('check-language-support -l %s' % locale_system).split() %}

{% if system_language_packs %}
system language packs:
  pkg.installed:
    - pkgs: {{ system_language_packs }}
{% endif %}

{% for locale_present in locales_present %}
{% set locale_language_packs = salt.cmd.run('check-language-support -l %s' % locale_present).split() %}
{% if locale_language_packs %}
{{ locale_present }} language packs:
  pkg.installed:
    - pkgs: {{ locale_language_packs }}
{% endif %}
{% endfor %}
