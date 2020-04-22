#
# Smart URLs when typing them without surrounding quotes
#

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

#
# Powerful advanced version of mv
#

autoload -U zmv

#
# Edit command line
#

autoload -Uz edit-command-line
zle -N edit-command-line

bindkey -M emacs '^XE' edit-command-line
bindkey -M emacs '^X^E' edit-command-line
bindkey -M vicmd 'v' edit-command-line

#
# Enable 'help' for builtin commands (like Bash)
#

unalias run-help
autoload -Uz run-help
alias help=run-help
