# http://www.ubuntuupdates.org/ppa/google_chrome?dist=stable
# https://www.google.com/linuxrepositories/
install_google_chrome:
  pkgrepo.managed:
    - name: deb http://dl.google.com/linux/chrome/deb/ stable main
    - file: /etc/apt/sources.list.d/google-chrome.list
    - key_url: https://dl.google.com/linux/linux_signing_key.pub
    - require_in:
      - pkg: google-chrome-stable

google-chrome-stable:
  pkg.installed
