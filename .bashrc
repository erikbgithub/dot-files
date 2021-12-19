# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Source Bash completion if it doesn't work yet
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

function settitle {
if [ -z "$VIRTUAL_ENV" ]; then
    LOCATION="###"
else
    LOCATION=$(basename $VIRTUAL_ENV)
fi
echo -ne "\033]0;${LOCATION} (${USER}@${HOSTNAME})\007"
}

# History optimization
shopt -s histappend
shopt -s cmdhist
HISTFILESIZE=1000000
HISTSIZE=1000000
HISTCONTROL=ignoreboth
HISTIGNORE='ls:bg:fg:history'
HISTTIMEFORMAT='%F %T'

PROMPT_COMMAND='history -a; settitle'
PS1='\[\033[01;32m\]\t\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\[\033[01;33m\]🍔\[\033[00m\]  '
export LANG=en_US.UTF-8 #this way screen will also start wtih utf8
export EDITOR=vi

source ~/.bash_aliases

# shortcut for github repository cloning (GitHub Clone)
# credit goes to chepner for this optimization:
# http://stackoverflow.com/a/15361490/131120
#
# :param repo: a string containing the end of the github url
ghc () { git clone git@github.com:"${@?need to set param: <dev>/<proj>}"; }


# builds a complete tex file with all the indexes, libraries and so on.
#
# :param filename: which file should be compiled
ertex() {
    if [ -z "$1" ]; then
        echo "need to set param: <filename>"
    else
        pdflatex $1.tex -interaction=nonstopmode
        bibtex $1.aux
        pdflatex $1.tex -interaction=nonstopmode
        pdflatex $1.tex -interaction=nonstopmode
    fi
}

deactivate-touchpad() {
    touchpadid=`xinput | awk -F= '/Synaptics TouchPad/ { print $2; }' | awk '{print $1}'`
    if [[ $touchpadid =~ [[:digit:]] ]] ; then
        echo "touchpad is $touchpadid, deactivate it"
        xinput set-prop "$touchpadid" "Device Enabled" 0
    fi
}

export GOPATH="/Users/ebernoth/go"
export PATH="$HOME/.config/itch/apps/butler/:$HOME/.npm/bin/:$PATH:$GOPATH/bin:/Users/ebernoth/Downloads/node_modules/.bin:/Users/ebernoth/.wine"
export GOROOT="/usr/local/Cellar/go/1.10.2/libexec"
