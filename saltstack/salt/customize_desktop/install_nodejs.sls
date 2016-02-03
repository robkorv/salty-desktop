# https://github.com/nodesource/distributions#debmanual
install_nodejs:
  pkgrepo.managed:
    - name: deb https://deb.nodesource.com/node_4.x trusty main
    - file: /etc/apt/sources.list.d/nodejs.list
    - key_url: https://deb.nodesource.com/gpgkey/nodesource.gpg.key
    - require_in:
      - pkg: nodejs
nodejs:
  pkg.installed
