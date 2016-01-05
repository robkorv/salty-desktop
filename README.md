# salty-desktop

A desktop salted with SaltStack


## Requirements

* [VirtualBox (5.0.x)](https://www.virtualbox.org/wiki/Downloads)
* [Vagrant (1.8.x)](https://www.vagrantup.com/downloads.html)


## Inner workings

All source code is editable from outside the box but run from inside the box.
This means that every script is expecting to be run from `~/salty-desktop`
inside a secure shell with the box.

> * `script/bootstrap` is used solely for fulfilling dependencies of the project.
> * `script/update` is used to update the project after a fresh pull.
> * `script/test` is used to run the test suite of the application.
>
> -- [github - scripts-to-rule-them-all](https://github.com/github/scripts-to-rule-them-all/blob/master/README.md#the-scripts)


## Inspired by

* https://github.com/github/scripts-to-rule-them-all
* https://docs.saltstack.com/en/2015.5/
* https://docs.saltstack.com/en/2015.5/topics/best_practices.html
* https://docs.saltstack.com/en/2015.5/topics/development/conventions/formulas.html#conventions-formula
* https://docs.saltstack.com/en/2015.5/ref/states/all/index.html
* https://docs.saltstack.com/en/2015.5/topics/yaml/index.html
