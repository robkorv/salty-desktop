# https://www.vagrantup.com/downloads.html
install_vagrant:
  pkg.installed:
    - name: vagrant
    - sources:
      - vagrant: https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb
