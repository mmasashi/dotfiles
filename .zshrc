# export 
#export LANG=ja_JP.UTF-8
export LANG=en_US.UTF-8
#export NLS_LANG=en_US.AL32UTF8
export PATH=/usr/local/bin:$PATH
#export PATH=$PATH:/opt/local/bin:/opt/local/sbin
#export MANPATH=$MANPATH:/opt/local/man
export EDITOR=vim
bindkey -v
bindkey '^R' history-incremental-search-backward

# history 
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

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

# go
export GOPATH=$HOME/.go

# rbenv
if type rbenv >/dev/null 2>&1; then
  eval "$(rbenv init - zsh)"
fi

# rvm
RVM_SCRIPT_PATH="$HOME/.rvm/scripts/rvm"
if [ -f "${RVM_SCRIPT_PATH}" ]; then
  source $RVM_SCRIPT_PATH
  PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
fi

# bundle (ruby)
alias be="bundle exe"

# git
git config --global color.ui auto
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.br branch
git config --global alias.hist 'log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short'
alias g=git
alias gsb="git st -sb"
# Show feature branches merged into develop branch
alias gml="g log|grep \"    Merge\"|awk '{if(\$2==\"pull\" && \$3==\"request\"){gsub(/hapyrus\\//, \"\", \$6); print \$6}; if(\$2==\"branch\" && \$3!=\"\\47develop\\47\" && \$7==\"develop\"){gsub(/\\047/, \"\", \$3); print \$3}; if(\$2==\"branch\" && \$5==\"develop\") {gsub(/\\047/, \"\", \$3); print \$3} }'|head -n 15"
# g log|grep "    Merge"|grep "into develop"

# bazaar
alias b=bzr

# ssh-settings
sshrc_path="$HOME/.sshrc"
if [ -f "$sshrc_path" ]; then
  source $sshrc_path
fi

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# OS dependencies
## Mac OSX (Darwin)
if [ "$(uname)" = "Darwin" ]; then
  # clear
  alias c='clear'

  # ls color
  alias ls='ls -G'

  # java for mac
  #export JAVA_HOME=$(dirname $(readlink $(which java)))/../../CurrentJDK/Home
  #export JAVA_HOME=$(/usr/libexec/java_home)

  # postgresql
  alias pg_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
  alias pg_stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"
  alias psql_login="psql postgres"

  # python2.x
  # export PYTHONPATH=`brew --prefix`/lib/python2.7/site-packages:$PYTHONPATH

  # python3
  unset PYTHONPATH
  #alias python=python3
  alias pip3='python3 -m pip'

  # apache2 for mac
  alias a2_start="sudo apachectl start"
  alias a2_restart="sudo apachectl restart"
  alias a2_stop="sudo apachectl stop"

  # redis
  alias redis_start="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.redis.plist"
  alias redis_stop="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.redis.plist"

  # Docker
  #export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2376
  #export DOCKER_CERT_PATH=$HOME/.boot2docker/certs/boot2docker-vm
  #export DOCKER_TLS_VERIFY=1

  # Nginx
  # start:    sudo nginx
  # stop:     sudo nginx -s stop
  # editconf: sudo vi /usr/local/etc/nginx/nginx.conf

  # Homebrew
  export HOMEBREW_NO_ANALYTICS=1

  # Oracle
  #source /usr/local/share/instantclient/instantclient.sh
## Linux
else
  # ls color
  alias ls='ls --color'
fi

# Ohter aliases
alias ll="ls -al"
