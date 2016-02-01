# https://help.github.com/articles/generating-ssh-keys/#step-2-generate-a-new-ssh-key
# http://linux.die.net/man/1/ssh-keygen

{% from "customize_desktop/map.jinja" import customize_desktop with context %}
{% set user = salt.pillar.get('user') %}

/home/{{ user }}/.ssh:
  file.directory:
    - user: {{ user }}
    - group: {{ user }}
    - mode: 0700

{% for generate_ssh_key in customize_desktop.get('generate_ssh_keys') %}
ssh-keygen -t rsa -b 4096 -C "{{ generate_ssh_key.get('comment') }}" -f "/home/{{ user }}/.ssh/{{ generate_ssh_key.get('identifier') }}_rsa" -P "":
  cmd.run:
    - user: {{ user }}
    - creates: /home/{{ user }}/.ssh/{{ generate_ssh_key.get('identifier') }}_rsa
    - require:
      - file: /home/{{ user }}/.ssh
{% endfor %}
