# Sample .bashrc for SUSE Linux
# Copyright (c) SUSE Software Solutions Germany GmbH

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.
neofetch
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
test -s ~/.alias && . ~/.alias || true
alias sshdisc="ssh -i LightsailDefaultKey-us-west-2.pem admin@34.209.54.143"
alias updisc="scp -i LightsailDefaultKey-us-west-2.pem  /home/isaac/discbot/disc.js admin@34.209.54.143:/home/admin/discbot"
alias herb="vim /home/isaac/.config/herbstluftwm/autostart"
