# http://www.sublimetext.com/3
remove_sublime_text_3083:
  pkg.removed:
    - name: sublime-text
    - version: '3083'

install_sublime_text:
  pkg.installed:
    - name: sublime-text
    - sources:
      - sublime-text: https://download.sublimetext.com/sublime-text_build-3103_amd64.deb
