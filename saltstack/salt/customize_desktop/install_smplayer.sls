# http://www.smplayer.eu/en/downloads
install_smplayer:
  pkgrepo.managed:
    - ppa: rvm/smplayer
    - require:
      - pkg: python-software-properties
    - require_in:
      - pkg: smplayer

python-software-properties:
  pkg.installed

smplayer:
  pkg.installed
