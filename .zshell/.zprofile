#
# Run for login shells before .zshrc
#

#
# Added when installing go
#
export GOPATH=~/Projects/go

# Additional path entries
#
# The (N) glob qualifier only adds those elements to the path if they exist
#
typeset -U path
path=(
  $HOME/.local/bin(N)
  $GOPATH/bin(N)
  $HOME/.rbenv/bin
  $HOME/.cabal/bin(N)
  /usr/local/opt/go/libexec/bin(N)
  $path
)

export PATH

