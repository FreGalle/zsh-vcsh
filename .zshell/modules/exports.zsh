export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Added when installing virtualenv
#

if (( $+commands[virtualenv] )); then
  export VIRTUAL_ENV_DISABLE_PROMPT=1 # Don't display prompt
fi


#
# Enable some coloring
#

export GREP_COLOR='37;45'
export GREP_OPTIONS='--color=auto'

export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'

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
# Prettify ri-output. Terminal should support ansi-escaped chars
#

export RI="--format ansi --width 80"

#
# Treat these characters as part of a word
#

export WORDCHARS='*?_-.[]~&;!#$%^(){}<>'
