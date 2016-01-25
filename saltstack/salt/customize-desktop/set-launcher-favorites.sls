{% from "customize-desktop/map.jinja" import customize_desktop with context %}
{% set user = salt.pillar.get('user', customize_desktop.get('user')) %}
{% set favorites_default =  customize_desktop.get('launcher-favorites-defaults') %}
{% set favorites_applications =  customize_desktop.get('launcher-favorites-applications') %}
{% set favorites =  favorites_applications + favorites_default %}
{% set favorites_current =  salt.cmd.run('gsettings get com.canonical.Unity.Launcher favorites', runas=user)|load_yaml %}


set Unity Launcher favorites:
  cmd.run:
    - name: gsettings set com.canonical.Unity.Launcher favorites "{{ favorites }}"
    - user: {{ user }}
    - env:
      - DISPLAY: :0
