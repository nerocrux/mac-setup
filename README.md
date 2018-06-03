Mac OS X Setup Automation
==============

> This is created for replace nerocrux/dotfiles

## This will remotely & parallelly do the following for mac machines

### Provisioning new machines by defined types (home, work, etc..)

* brew (cask) tap / install 
* git clone
* pip / npm / go / gem install
* make

### Make maintenance easier for provisioned machines

* install additional packages, updates, etc...
* execute shell scripts


## How to use

### On remote jenkins machines

* Update system

```bash
$ sudo softwareupdate --install --recommended
```

* Install Xcode updates

```bash
$ xcode-select --install
``` 

* Install [homebrew](http://brew.sh/)

```bash
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

* Setup ssh agent

```bash
$ mkdir ~/.ssh && cp xxx/id_rsa ~/.ssh/id_rsa
$ eval "$(ssh-agent -s)" && ssh-add
```

* Install some softwares

```bash
$ brew install pyenv gcc
$ cat >>~/.bash_profile <<'EOT'
export PYENV_ROOT="$HOME/.pyenv"
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$PYENV_ROOT/shims:$RBENV_ROOT/shims:$PATH"
export LANG="ja_JP.UTF-8"
eval "$(pyenv init -)"
EOT
$ source ~/.bash_profile
$ pyenv install 3.6.0 (2.7.14 for hockey-build)
$ pyenv global 3.6.0 (2.7.14 for hockey-build)
$ pip install ansible httplib2 pexpect
```

### On local machine

* Run [Ansible](https://github.com/ansible/ansible) from local machine

```bash
$ ansible-playbook playbooks/<playbook_to_execute> -vvvv --ask-pass --ask-become-pass
```

> This repository is forked from https://github.com/knakayama/mac-os-x-setup
