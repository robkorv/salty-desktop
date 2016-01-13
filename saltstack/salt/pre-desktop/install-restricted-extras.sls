{% from "pre-desktop/map.jinja" import pre_desktop with context %}

Microsoft Core fonts for the Web:
  debconf.set:
    - name: ttf-mscorefonts-installer
    - data: { 'msttcorefonts/accepted-mscorefonts-eula': { 'type': 'boolean', 'value': True } }
  pkg.installed:
    - pkgs:
      - ttf-mscorefonts-installer
    - requires:
      - debconf: ttf-mscorefonts-installer

{% for package in pre_desktop.get('restricted-extras-packages') %}
{{ package }}:
  pkg.installed
{% endfor %}
