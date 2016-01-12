{% from "pre-desktop/map.jinja" import pre_desktop with context %}
{% set locale = pre_desktop.get('locale') %}
{% set extra_locales = pre_desktop.get('extra-locales') %}

default locale present:
  locale.present:
    - name: {{ locale }}.UTF-8

default locale system:
  locale.system:
    - name: {{ locale }}.UTF-8

{% for extra_locale in extra_locales %}
{{ extra_locale }} locale present:
  locale.present:
    - name: {{ extra_locale }}.UTF-8
{% endfor %}
