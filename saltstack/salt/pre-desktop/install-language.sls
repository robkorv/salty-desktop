{% from "pre-desktop/map.jinja" import pre_desktop with context %}
{% set locale = pre_desktop.get('locale') %}
{% set extra_locales = pre_desktop.get('extra-locales') %}
{% set default_language_packs = salt.cmd.run_stdout('check-language-support -l %s' % locale).split() %}

{% if default_language_packs %}
default missing language packs:
  pkg.installed:
    - pkgs: {{ default_language_packs }}
{% endif %}

{% for extra_locale in extra_locales %}
{% set extra_language_packs = salt.cmd.run_stdout('check-language-support -l %s' % extra_locale).split() %}
{% if extra_language_packs %}
{{ extra_locale }} missing language packs:
  pkg.installed:
    - pkgs: {{ extra_language_packs }}
{% endif %}
{% endfor %}
