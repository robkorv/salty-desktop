{% from "pre_desktop/map.jinja" import pre_desktop with context %}
{% set install_restricted_extras = pre_desktop.get('install_restricted_extras') %}

include:
  - pre_desktop.install_language
  - pre_desktop.set_locale
  - pre_desktop.set_timezone
  - pre_desktop.install_desktop
{% if install_restricted_extras %}
  - pre_desktop.install_restricted_extras
{% endif %}

