#
# Run for login shells before .zshrc
#

export GOPATH=~/go

# Additional path entries
#
# The (N) glob qualifier only adds those elements to the path if they exist
#
typeset -Ux path
path=(
  $HOME/.local/bin(N)
  $GOPATH/bin(N)
  $HOME/.rbenv/bin
  $HOME/.cabal/bin(N)
  $HOME/.rd/bin(N)
  `python3 -m site --user-base`/bin(N)
  /usr/local/opt/go/libexec/bin(N)
  $HOME/src/sync-toolbelt(N)
  $path
)

typeset -Ux cdpath
cdpath=(
	$HOME/src(N)
)
