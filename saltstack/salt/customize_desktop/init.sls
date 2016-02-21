{% from "customize_desktop/map.jinja" import customize_desktop with context %}
{% set user = salt.pillar.get('user') %}
{% set desktop_available = salt.file.directory_exists('/home/%s/.config' % user) %}

{% if desktop_available %}
include:
{% if 'google-chrome' in customize_desktop.get('third_party_applications') %}
  - customize_desktop.install_google_chrome
{% endif %}
{% if 'spotify' in customize_desktop.get('third_party_applications') %}
  - customize_desktop.install_spotify
{% endif %}
{% if 'sublime-text' in customize_desktop.get('third_party_applications') %}
  - customize_desktop.install_sublime_text
{% endif %}
{% if 'virtualbox' in customize_desktop.get('third_party_applications') %}
  - customize_desktop.install_virtualbox
{% endif %}
{% if 'vagrant' in customize_desktop.get('third_party_applications') %}
  - customize_desktop.install_vagrant
{% endif %}
{% if 'nodejs' in customize_desktop.get('third_party_applications') %}
  - customize_desktop.install_nodejs
{% endif %}
{% if 'dropbox' in customize_desktop.get('third_party_applications') %}
  - customize_desktop.install_dropbox
{% endif %}
{% if 'smplayer' in customize_desktop.get('third_party_applications') %}
  - customize_desktop.install_smplayer
{% endif %}
  - customize_desktop.unity_launcher
{% if customize_desktop.get('configure_git') %}
  - customize_desktop.configure_git
{% endif %}
{% if customize_desktop.get('generate_ssh_keys') %}
  - customize_desktop.generate_ssh_keys
{% endif %}
{% endif %}

