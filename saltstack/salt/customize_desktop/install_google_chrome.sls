# http://www.ubuntuupdates.org/ppa/google_chrome?dist=stable
# https://www.google.com/linuxrepositories/
install_google_chrome_amd64:
  pkgrepo.managed:
    - name: deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main
    - file: /etc/apt/sources.list.d/google-chrome.list
    - key_url: https://dl.google.com/linux/linux_signing_key.pub
    - require_in:
      - pkg: google-chrome-stable
absent_google_chrome_32bit:
  pkgrepo.absent:
    - name: deb http://dl.google.com/linux/chrome/deb/ stable main
    - file: /etc/apt/sources.list.d/google-chrome.list
    - require_in:
      - pkg: google-chrome-stable

google-chrome-stable:
  pkg.installed
