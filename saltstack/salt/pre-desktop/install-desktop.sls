{% from "pre-desktop/map.jinja" import pre_desktop with context %}

{% for package in pre_desktop.get('packages') %}
{{ package }}:
  pkg.installed
{% endfor %}

{% for package in pre_desktop.get('extra-packages') %}
{{ package }}:
  pkg.installed
{% endfor %}
