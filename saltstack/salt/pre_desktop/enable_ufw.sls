sudo ufw allow OpenSSH:
  cmd.run:
    - onlyif: sudo ufw app info OpenSSH

sudo ufw --force enable:
  cmd.run
