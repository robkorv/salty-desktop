# https://wiki.ubuntu.com/LightDM#Setting_an_Automatic_Login
set_lightdm_conf:
  file.managed:
    - name: /etc/lightdm/lightdm.conf
    - source: salt://post_desktop/files/lightdm.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 0644
