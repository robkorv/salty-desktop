# https://wiki.ubuntu.com/LightDM#Setting_an_Automatic_Login
/etc/lightdm/lightdm.conf:
  file.managed:
    - source: salt://post_desktop/files/lightdm.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 0644
