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
# The (N) glob qualifier only adds those elements to the path if they exist
#

typeset -U path
path=(
  $path
  $HOME/.local/bin(N)
  $HOME/.rvm/bin(N)
  $HOME/.cabal/bin(N)
  $HOME/Library/Android/sdk/platform-tools(N)
)
