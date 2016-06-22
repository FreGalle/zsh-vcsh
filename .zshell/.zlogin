#
# Executes commands for login shells after .zshrc
#

# Added when installing rbenv
if (( $+commands[rbenv] )); then
  eval "$(rbenv init -)"
fi
