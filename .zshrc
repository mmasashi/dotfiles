# Export
export LANG=en_US.UTF-8
export PATH=/usr/local/sbin:/usr/local/bin:$PATH
export EDITOR=vim

# Bindkey
# - Enable vim operations on terminal
bindkey -v
# - Enable ^R search on vim mode
bindkey '^R' history-incremental-search-backward

# History
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
# - Don't show duplicate commands in history
setopt histignorealldups
# - Share history with other terminals
setopt share_history
# - Remove unnecessary blands in history
setopt hist_reduce_blanks
# - Append command to history immediately
setopt inc_append_history
# - Add datetime to history
alias h='fc -lt '%F %T' 1'

# Autoload
# - Autoload completion
autoload -Uz compinit; compinit
# - Enable colors
autoload -Uz colors; colors

# Prompt
# - Expand variables in PROMPT
setopt prompt_subst
# - Show lines not having new line code
unsetopt promptcr
case ${UID} in
0)
  PROMPT="[%{${fg[blue]}%}%n@%m%{${reset_color}%}] %{${fg[blue]}%}#%{${reset_color}%} "
  PROMPT2="%B%{${fg[blue]}%}%_#%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[blue]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  #RPROMPT="%{${fg[blue]}%}[%/]%{${reset_color}%}"
  ;;
*)
  PROMPT='[%n@%m] '
  #PROMPT='[%n@%m]($(_git_branch_name)) '
  PROMPT2="%B%{${fg[blue]}%}%_#%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[blue]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  #RPROMPT="%{${fg[blue]}%}[%/]%{${reset_color}%}"
  ;;
esac

# Other options
limit coredumpsize 102400
setopt auto_cd
setopt auto_list
setopt auto_menu
setopt auto_param_keys
setopt auto_param_slash
setopt auto_resume
setopt autopushd
setopt complete_aliases
setopt correct
setopt equals
setopt extended_glob
# - Do not exit with Ctrl+D
setopt ignore_eof
setopt list_packed
setopt long_list_jobs
setopt magic_equal_subst
setopt noautoremoveslash
setopt nobeep
setopt no_flow_control
setopt pushd_ignore_dups

zstyle ':completion:*:default' menu select=1
export LSCOLORS=ExFxCxdxBxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Turn off screen lock shortcut(ctrl+s)
stty stop undef
stty start undef

# Text browser
export TEXT_BROWSER=w3m
function _space2plus
{
    echo $@ | sed -e "s/ /+/g"
}
function google
{
    ${TEXT_BROWSER} "http://www.google.com/search?q="`_space2plus $@`
}

# go
export GOPATH=$HOME/.go

# rbenv
if type rbenv >/dev/null 2>&1; then
  eval "$(rbenv init - zsh)"
fi

# pyenv
if type pyenv >/dev/null 2>&1; then
  eval "$(pyenv init - zsh)"
fi

# rvm
RVM_SCRIPT_PATH="$HOME/.rvm/scripts/rvm"
if [ -f "${RVM_SCRIPT_PATH}" ]; then
  source $RVM_SCRIPT_PATH
  PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
fi

# git
git config --global color.ui auto
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.br branch
git config --global alias.hist 'log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short'
alias g=git

# bazaar
alias b=bzr

# ssh-settings
sshrc_path="$HOME/.sshrc"
if [ -f "$sshrc_path" ]; then
  source $sshrc_path
fi

# OS dependencies
## Mac OSX (Darwin)
if [ "$(uname)" = "Darwin" ]; then
  # ls color
  alias ls='ls -G'

  # java for mac
  #export JAVA_HOME=$(dirname $(readlink $(which java)))/../../CurrentJDK/Home
  #export JAVA_HOME=$(/usr/libexec/java_home)

  # postgresql
  alias pg_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
  alias pg_stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"
  alias psql_login="psql postgres"

  # apache2 for mac
  alias a2_start="sudo apachectl start"
  alias a2_restart="sudo apachectl restart"
  alias a2_stop="sudo apachectl stop"

  # redis
  alias redis_start="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.redis.plist"
  alias redis_stop="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.redis.plist"

  # Nginx
  # start:    sudo nginx
  # stop:     sudo nginx -s stop
  # editconf: sudo vi /usr/local/etc/nginx/nginx.conf

  # Homebrew
  export HOMEBREW_NO_ANALYTICS=1

## Linux
else
  # ls color
  alias ls='ls --color'
fi

# Ohter aliases
alias c='clear'
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias pyclear='find . | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs rm -rf'

# sdkman (Java)
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/mmasashi/.sdkman"
[[ -s "/Users/mmasashi/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/mmasashi/.sdkman/bin/sdkman-init.sh"
