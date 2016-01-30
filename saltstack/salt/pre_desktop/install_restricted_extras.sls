{% from "pre_desktop/map.jinja" import pre_desktop with context %}

install_ms_web_fonts:
  debconf.set:
    - name: ttf-mscorefonts-installer
    - data: { 'msttcorefonts/accepted-mscorefonts-eula': { 'type': 'boolean', 'value': True } }
  pkg.installed:
    - pkgs:
      - ttf-mscorefonts-installer
    - requires:
      - debconf: ttf-mscorefonts-installer

{% for package in pre_desktop.get('restricted_extras_packages') %}
{{ package }}:
  pkg.installed
{% endfor %}
