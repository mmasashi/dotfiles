# -----------------------------
# Basics
# -----------------------------
export EDITOR=vim
export VISUAL=vim
if command -v nvim >/dev/null 2>&1; then
  export EDITOR=nvim
  export VISUAL=nvim
fi
export PAGER="less -FR"
export LANG=en_US.UTF-8
export PATH=/usr/local/sbin:/usr/local/bin:$PATH

# Homebrew (Apple Silicon Mac)
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# -----------------------------
# History
# -----------------------------
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
# - Add datetime to history
alias h='fc -lt '%F %T' 1'


# -----------------------------
# Other options
# -----------------------------
setopt AUTO_CD
setopt INTERACTIVE_COMMENTS
setopt NO_BEEP
setopt CORRECT

# safer file overwrite behavior
setopt NO_CLOBBER

# nice globbing
setopt EXTENDED_GLOB

limit coredumpsize 102400
setopt AUTO_LIST
setopt AUTO_MENU
setopt AUTO_PARAM_KEYS
setopt AUTO_PARAM_SLASH
setopt AUTO_RESUME
setopt AUTOPUSHD
setopt COMPLETE_ALIASES
setopt EQUALS
# - Do not exit with Ctrl+D
setopt IGNORE_EOF
setopt LIST_PACKED
setopt LONG_LIST_JOBS
setopt MAGIC_EQUAL_SUBST
setopt NOAUTOREMOVESLASH
setopt NO_FLOW_CONTROL
setopt PUSHD_IGNORE_DUPS

# Turn off screen lock shortcut(ctrl+s) in TTY
stty stop undef
stty start undef

# -----------------------------
# Completion
# -----------------------------
# - Autoload completion
autoload -Uz compinit; compinit
zmodload zsh/complist
# - Enable colors
autoload -Uz colors; colors

# Completion styles
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' rehash true

# -----------------------------
# Key bindings
# -----------------------------
# - Enable vim operations on terminal
bindkey -v
# - Enable ^R search on vim mode
bindkey '^R' history-incremental-search-backward

# history substring search-like behavior with arrows
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

# -----------------------------
# Aliases
# -----------------------------
alias ll='ls -lah'
alias la='ls -A'
alias ..='cd ..'
alias ...='cd ../..'
alias g=git
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'

# -----------------------------
# Git
# -----------------------------
git config --global color.ui auto
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.br branch
git config --global alias.hist 'log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short'

# -----------------------------
# Prompt
# -----------------------------
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

zstyle ':completion:*:default' menu select=1
export LSCOLORS=ExFxCxdxBxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}


# OS dependencies
## Mac OSX (Darwin)
if [ "$(uname)" = "Darwin" ]; then
  # ls color
  alias ls='ls -G'

  # Homebrew
  export HOMEBREW_NO_ANALYTICS=1

## Linux
else
  # ls color
  alias ls='ls --color'
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
