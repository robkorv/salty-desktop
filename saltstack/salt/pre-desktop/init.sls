{% from "pre-desktop/map.jinja" import pre_desktop with context %}
{% set install_restricted_extras = pre_desktop.get('install-restricted-extras') %}

include:
  - pre-desktop.install-language
  - pre-desktop.set-locale
  - pre-desktop.install-desktop
{% if install_restricted_extras %}
  - pre-desktop.install-restricted-extras
{% endif %}

