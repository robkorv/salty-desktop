{% set install_packages = salt.pillar.get('install_packages', []) %}

{% if install_packages %}
install_packages:
  pkg.installed:
    - pkgs: {{ install_packages }}
{% endif %}
