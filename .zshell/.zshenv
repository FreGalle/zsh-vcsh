#
# Run for every zsh
#
# Use this to define environment variables
#

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Path
#
# Note that when using homebrew /usr/local/bin should be in the path,
# I've added this to /etc/paths though to enable it systemwide
#

typeset -U path
path=(
  $path
  $HOME/.rvm/bin(N)
  $HOME/.cabal/bin
)
