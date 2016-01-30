{% from "customize_desktop/map.jinja" import customize_desktop with context %}
{% set user = salt.pillar.get('user', customize_desktop.get('user')) %}
{% set desktop_available = salt.file.directory_exists('/home/%s/.config' % user) %}

{% if desktop_available %}
include:
{% if 'google-chrome' in customize_desktop.get('third_party_applications') %}
  - customize_desktop.install_google_chrome
{% endif %}
{% if 'spotify' in customize_desktop.get('third_party_applications') %}
  - customize_desktop.install_spotify
{% endif %}
  - customize_desktop.unity_launcher
{% endif %}

