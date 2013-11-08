# export 
#export LANG=ja_JP.UTF-8
export LANG=en_US.UTF-8
export PATH=/usr/local/bin:$PATH
#export PATH=$PATH:/opt/local/bin:/opt/local/sbin
#export MANPATH=$MANPATH:/opt/local/man
export EDITOR=vim
bindkey -v
bindkey '^R' history-incremental-search-backward

# history 
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# autoload
autoload -U compinit
compinit
autoload colors
colors

case ${UID} in
0)
  PROMPT="[%{${fg[blue]}%}%n@%m%{${reset_color}%}] %{${fg[blue]}%}#%{${reset_color}%} "
  PROMPT2="%B%{${fg[blue]}%}%_#%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[blue]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  #RPROMPT="%{${fg[blue]}%}[%/]%{${reset_color}%}"
  ;;
*)
  PROMPT="[%n@%m] "
  PROMPT2="%B%{${fg[blue]}%}%_#%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[blue]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  #RPROMPT="%{${fg[blue]}%}[%/]%{${reset_color}%}"
  ;;
esac

limit coredumpsize 102400
unsetopt promptcr
# use color
setopt prompt_subst
setopt nobeep
setopt long_list_jobs
setopt auto_resume
setopt auto_list
setopt list_packed
setopt hist_ignore_dups
setopt autopushd
setopt pushd_ignore_dups
setopt extended_glob
setopt auto_menu
setopt equals
setopt magic_equal_subst

zstyle ':completion:*:default' menu select=1
export LSCOLORS=ExFxCxdxBxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

setopt auto_cd
setopt auto_param_keys
setopt auto_param_slash
setopt correct
setopt complete_aliases
setopt noautoremoveslash
export TEXT_BROWSER=w3m

# turn off screen lock shortcut(ctrl+s)
stty stop undef
stty start undef

# rbenv
eval "$(rbenv init -)"

# bundle (ruby)
alias be="bundle exe"

# java for mac
export JAVA_HOME=$(dirname $(readlink $(which java)))/../../CurrentJDK/Home/

# git
git config --global color.ui auto
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.br branch
git config --global alias.hist 'log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short'
alias gsb="git st -sb"
alias g=git

# ssh-settings
#eval `ssh-agent`
#ssh-add ~/.ssh/hapyrus-rsa

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# postgresql
alias pg_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pg_stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"

# apache2 for mac
alias a2_start="sudo apachectl start"
alias a2_restart="sudo apachectl restart"
alias a2_stop="sudo apachectl stop"
