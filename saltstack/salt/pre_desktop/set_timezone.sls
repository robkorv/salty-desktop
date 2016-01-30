{% from "pre_desktop/map.jinja" import pre_desktop with context %}
{% set timezone = pre_desktop.get('timezone') %}

{{ timezone }}:
  timezone.system
