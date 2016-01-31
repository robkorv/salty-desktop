disable_quiet_graphical_boot:
  file.managed:
    - name: /etc/default/grub
    - source: salt://pre_desktop/files/grub
    - user: root
    - group: root
    - mode: 0644
  cmd.wait:
    - name: sudo update-grub
    - watch:
      - file: /etc/default/grub
