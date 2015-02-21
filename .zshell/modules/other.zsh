#
# Smart URLs when typing them without surrounding quotes
#

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

#
# Powerful advanced version of mv
#

autoload -U zmv
