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
source ~/.oh-my-zsh/plugins/command-not-found/command-not-found.plugin.zsh

# prompt
autoload -U promptinit
promptinit
autoload -U colors && colors
PROMPT="%{$fg[red]%}%n%{$reset_color%}@%M:%{$fg[green]%}%*%{$reset_color%}:%{$fg[cyan]%}%~%{$reset_color%}$ "
