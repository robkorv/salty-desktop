{% set install_pips = salt.pillar.get('install_pips', []) %}
{% set upgrade_pips = salt.pillar.get('upgrade_pips', false) %}

{% if install_pips %}
python:
  pkg.installed
python-dev:
  pkg.installed
python-pip:
  pkg.installed
{% endif %}

{% for pip in install_pips %}
{{ pip }}:
  pip.installed:
    - upgrade: {{ upgrade_pips }}
    - require:
      - pkg: python
      - pkg: python-dev
      - pkg: python-pip
{% endfor %}

