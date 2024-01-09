
PROMPT="%n@%M %~ %# "

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/oliver/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

# change default editor
export EDITOR=nvim

# aliases
alias ll="ls -la --color=auto"

# change default terminal
export TERMINAL=st

# detach zathura from terminal
alias zathura='zathura --fork'

# add scripts to PATH
export PATH="$PATH:$HOME/scripts:/usr/avr/include"

export JAVA_HOME=/opt/jdk-21.0.1+12
export PATH=$PATH:$JAVA_HOME/bin
