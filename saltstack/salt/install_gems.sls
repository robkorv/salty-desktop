{% set install_gems = salt.pillar.get('install_gems', []) %}

{% for gem in install_gems %}
{{ gem }}:
  gem.installed:
    - require:
      - pkg: ruby
      - pkg: ruby-dev
{% endfor %}

{% if install_gems %}
ruby:
  pkg.installed
ruby-dev:
  pkg.installed
{% endif %}
