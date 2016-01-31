{% from "pre_desktop/map.jinja" import pre_desktop with context %}
{% set install_restricted_extras = pre_desktop.get('install_restricted_extras') %}

include:
{% if pre_desktop.get('enable_ufw') %}
  - pre_desktop.enable_ufw
{% endif %}
{% if pre_desktop.get('disable_quiet_graphical_boot') %}
  - pre_desktop.disable_quiet_graphical_boot
{% endif %}
  - pre_desktop.install_language
  - pre_desktop.set_locale
  - pre_desktop.set_timezone
  - pre_desktop.install_desktop
{% if install_restricted_extras %}
  - pre_desktop.install_restricted_extras
{% endif %}

