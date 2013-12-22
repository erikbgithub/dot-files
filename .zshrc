# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory
setopt HIST_IGNORE_DUPS
unsetopt beep notify

# vi mode
bindkey -v
bindkey '^R' history-incremental-search-backward

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/erikb85/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# command-not-found activation
if [[ -s '/etc/zsh_command_not_found' ]]; then
    source /etc/zsh_command_not_found
fi

# prompt
autoload -U promptinit
promptinit
autoload -U colors && colors
PROMPT="%{$fg[red]%}%n%{$reset_color%}@%M:%{$fg[green]%}%*%{$reset_color%}:%{$fg[cyan]%}%~%{$reset_color%}$ "
# keys
source ~/.default_key

#virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
source /etc/bash_completion.d/virtualenvwrapper

##############
#
# from .bashrc
#
##############

export LANG=en_US.UTF-8 #this way screen will also start wtih utf8
export EDITOR=vim

source ~/.bash_aliases

# shortcut for github repository cloning (GitHub Clone)
# credit goes to chepner for this optimization:
# http://stackoverflow.com/a/15361490/131120
#
# :param repo: a string containing the end of the github url
ghc () { git clone git@github.com:"${@?need to set param: <dev>/<proj>}"; }


# a HidaV shortcut to the dev shell
#
# :param recipe: the name of the recipe that should be edited
devshell() {
    if [ -z "$1" ]; then
        echo "need to set param: <recipe-name>"
    else
        cd ~/coding/HidaV
        . ./hidav-init.sh .
        bitbake -c devshell $1
    fi
}

# a HidaV shortcut to building sd cards for HidaV devices
#
# :param usb: the path to the sd card, optional
sdcard() {
    [-z $1] && 1=/dev/sdc
    cd ~/coding/Hidav
    . ./hidav-init.sh .
    cd ./tmp-eglibc/deploy/images/hidav-ti81xx
    ./ti814x-bootable-sdcard.sh $1
}
