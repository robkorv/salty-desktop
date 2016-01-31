# https://www.virtualbox.org/wiki/Linux_Downloads#Debian-basedLinuxdistributions
install_virtualbox:
  pkgrepo.managed:
    - name: deb http://download.virtualbox.org/virtualbox/debian trusty contrib
    - file: /etc/apt/sources.list.d/virtualbox.list
    - key_url: https://www.virtualbox.org/download/oracle_vbox.asc
    - require_in:
      - pkg: virtualbox-5.0
virtualbox-5.0:
  pkg.installed
