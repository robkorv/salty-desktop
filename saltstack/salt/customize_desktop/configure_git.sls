{% from "customize_desktop/map.jinja" import customize_desktop with context %}
{% set user = salt.pillar.get('user') %}
{% set git_user = customize_desktop.configure_git.get('user') %}
{% set git_core = customize_desktop.configure_git.get('core') %}
{% set git_merge = customize_desktop.configure_git.get('merge') %}

{% if git_user.get('name') %}
user.name:
  git.config:
    - value: {{ customize_desktop.configure_git.user.name }}
    - user: {{ user }}
    - is_global: true
    - require:
      - pkg: git
{% endif %}

{% if git_user.get('email') %}
user.email:
  git.config:
    - value: {{ customize_desktop.configure_git.user.email }}
    - user: {{ user }}
    - is_global: true
    - require:
      - pkg: git
{% endif %}

{% if git_core.get('editor') %}
core.editor:
  git.config:
    - value: {{ customize_desktop.configure_git.core.editor }}
    - user: {{ user }}
    - is_global: true
    - require:
      - pkg: git
{% endif %}

{% if git_merge.get('tool') %}
merge.tool:
  git.config:
    - value: {{ customize_desktop.configure_git.merge.tool }}
    - user: {{ user }}
    - is_global: true
    - require:
      - pkg: git
{% endif %}

git:
  pkg.installed
