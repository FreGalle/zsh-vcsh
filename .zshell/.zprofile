#
# Run for login shells before .zshrc
#

# Additional path entries
#
# The (N) glob qualifier only adds those elements to the path if they exist
#
typeset -U path
path=(
  $HOME/.local/bin(N)
  $HOME/.rvm/bin(N)
  $HOME/.cabal/bin(N)
  $HOME/.homebrew/opt/go/libexec/bin(N)
  $HOME/.homebrew/bin(N)
  $path
)
export PATH

