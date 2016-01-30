{% from "customize_desktop/map.jinja" import customize_desktop with context %}
{% set user = salt.pillar.get('user', customize_desktop.get('user')) %}
{% set favorites_default =  customize_desktop.get('launcher_favorites_defaults') %}
{% set favorites_applications = [] %}
{% for application in customize_desktop.get('launcher_favorites_applications') %}
{% do favorites_applications.append('application://%s.desktop' % application) %}
{% endfor %}
{% set favorites =  favorites_applications + favorites_default %}
{% set favorites_current =  salt.cmd.run('gsettings get com.canonical.Unity.Launcher favorites', runas=user)|load_yaml %}


set_unity_launcher_favorites:
  cmd.run:
    - name: gsettings set com.canonical.Unity.Launcher favorites "{{ favorites }}"
    - user: {{ user }}
    - env:
      - DISPLAY: :0
