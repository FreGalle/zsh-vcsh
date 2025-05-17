export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

if (( $+commands[nvim] )); then
  export EDITOR='nvim'
  export VISUAL='nvim'
fi

if (( $+commands[brew] )); then
  eval "$(brew shellenv)"
  export HOMEBREW_AUTO_UPDATE_SECS=$(( 60*60*24 ))
fi

export KEYTIMEOUT=1

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# added when installing virtualenv
#

if (( $+commands[virtualenv] )); then
  export virtual_env_disable_prompt=1 # don't display prompt
fi

#
# Enable some coloring
#

export GREP_COLOR='37;45'
export GREP_OPTIONS='--color=auto'
# export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'

#
# Enable coloring for less and man
#

export LESS_TERMCAP_mb=$'\E[01;31m'    # Begins blinking
export LESS_TERMCAP_md=$'\E[01;31m'    # Begins bold
export LESS_TERMCAP_me=$'\E[0m'        # Ends mode
export LESS_TERMCAP_se=$'\E[0m'        # Ends standout-mode
export LESS_TERMCAP_so=$'\E[00;47;30m' # Begins standout-mode
export LESS_TERMCAP_ue=$'\E[0m'        # Ends underline
export LESS_TERMCAP_us=$'\E[01;32m'    # Begins underline

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'
export LESSHISTFILE=/dev/null

#
# Treat these characters as part of a word
#

export WORDCHARS='*?_-.[]~&;!#$%^(){}<>'

#
# Standard cache/config/data locations used by some programs
#

export XDG_CACHE_HOME="$HOME/Library/Caches"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
