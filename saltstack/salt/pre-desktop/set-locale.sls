{% from "pre-desktop/map.jinja" import pre_desktop with context %}
{% set locale_system = pre_desktop.get('locale-system') %}
{% set locales_present = pre_desktop.get('locales-present') %}

locale system present:
  locale.present:
    - name: {{ locale_system }}.UTF-8

set locale system:
  locale.system:
    - name: {{ locale_system }}.UTF-8

{% for locale_present in locales_present %}
{{ locale_present }} locale present:
  locale.present:
    - name: {{ locale_present }}.UTF-8
{% endfor %}
