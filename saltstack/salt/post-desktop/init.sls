{% from "post-desktop/map.jinja" import post_desktop with context %}
{% set desktop_installed = 'ubuntu-desktop' in salt.pkg.get_selections('ubuntu-desktop').get('install', []) %}
{% set autologin = post_desktop.get('autologin') %}

{% if desktop_installed and autologin %}
include:
  - post-desktop.autologin
{% endif %}

