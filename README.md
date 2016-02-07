# salty-desktop

A desktop salted with SaltStack

## about

This is [ubuntu-post-install-todo](https://github.com/robkorv/ubuntu-post-install-todo) automated with [SaltStack](https://github.com/saltstack/salt).

It follows the [sane defaults and overrides by Pillar](https://docs.saltstack.com/en/2015.5/topics/development/conventions/formulas.html#sane-defaults)
conventions as mentioned in SaltStack's [docs](https://docs.saltstack.com/en/2015.5/). This means it's highly configurable
and easy to expand with your own wishes.

## OS support

Ubuntu 14.04 LTS is supported and thoroughly tested, because that is the OS on which this is used.

However SaltStack supports [use cases with OS filtering](https://docs.saltstack.com/en/2015.5/topics/development/conventions/formulas.html#abstracting-static-defaults-into-a-lookup-table), so you are welcome to add support for other distributions or Ubuntu versions.

## Get going

This is a repository that uses a SaltStack [masterless minion](https://docs.saltstack.com/en/2015.5/topics/tutorials/quickstart.html), also called [standalone minion](https://docs.saltstack.com/en/2015.5/topics/tutorials/standalone_minion.html) in SaltStack's [docs](https://docs.saltstack.com/en/2015.5/).

It has not been tested in a master/minion setup, you are welcome to test and improve it for that use case.

[Scripts-to-rule-them-all](https://github.com/github/scripts-to-rule-them-all) is used to install needed dependencies and
to start the provisioning with SaltStack. Take note that the script asks for sudo rights and doesn't function without it.

Before firing it up you need to setup your [Pillar](https://docs.saltstack.com/en/2015.5/topics/pillar/index.html) data.
Read on for instructions.

### Start

* clone this repository
* cd into it
```bash
# adds SaltStack, installs salt-minion and configures the minion, will ask for sudo
./script/bootstrap
```

### Configure

* Create `saltstack/pillar/top.sls` with the following content:
```yaml
base:
  '*':
    - data
```

* Create `saltstack/pillar/data.sls`
* In data.sls set your preferences, `user` is required, the following is an example:
```yaml
user: vagrant
pre_desktop:
  disable_quiet_graphical_boot: true
  locale_system: nl_NL
  timezone: Europe/Amsterdam
  accept_mscorefonts_eula: true
  install_restricted_extras: true
post_desktop:
  autologin: true
customize_desktop:
  third_party_applications:
    - google-chrome
    - spotify
    - sublime-text
    - virtualbox
    - vagrant
    - nodejs
    - dropbox
  launcher_favorites_applications:
    - firefox
    - spotify
    - sublime_text
  configure_git:
    user:
      name: John Doe
      email: john@example.org
    core:
      editor: vim
    merge:
      tool: kdiff3
  generate_ssh_keys:
    - comment: john@example.org
      identifier: github
    - comment: john@example.org
      identifier: gitlab
install_gems:
  - rubocop
  - git-up
install_packages:
  - shellcheck
  - vim
  - git
  - gdebi-core
  - byobu
  - kdiff3-qt
install_pips:
  - flake8
  - pep257
update_pips: true
```

The options are kind of self explanatory, open an issue when you have a question.

### Lift off

Run `./script/update` to start the provisioning with SaltStack, it will ask for sudo.
There are 3 phases that all need a reboot from the terminal, if you do a reboot from the
unity gui it will overwrite setting like the `launcher_favorites_applications`.

When the system is rebooted run `./script/update` to get to the next phase.

1. `pre_desktop`, will always run.
2. `post_desktop`, will only run when `pre_desktop` has run.
3. `customize_desktop`, will only run after `post_desktop` has run and the `user` that you specified has logged in to Unity at least once.

## Try it out with Vagrant and Virtualbox

* Be sure to set `user: vagrant` in your pillar files.
* run `vagrant plugin install vagrant-cachier` to activate local caching.
* the first `vagrant up` will run the bootstrap script, followed by the update script.
* `vagrant reload` will reboot the machine for you and run the update script to go to the next phase.
