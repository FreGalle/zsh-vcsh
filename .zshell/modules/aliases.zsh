#
# Directory movement
#

alias ls='ls -G'
alias ll='ls -lFh'
alias lr='ll -R'
alias lh='ls -d .*'
alias llh='ls -lh -d .*'

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

hash -d P=~/Projects

#
# Global aliases
#

alias -g L="|less"

#
# Resource Usage
#

alias df='df -kh'
alias du='du -kh'

#
# Git aliases
# For more see ~/.gitconfig
#

if (( $+commands[git] )); then
  alias g='git'
fi

#
# Homebrew aliases
#

if (( $+commands[brew] )); then
  alias brewcl='brew cleanup --force -s'
  alias brewup='brew update && brew upgrade'
  alias brewrm='brew remove'
  alias brewls='brew list'
  alias brewnf='brew info'
fi

#
# OSX specific
#

alias mand='_mand'    # Open man-pages in Dash

#
# Rsync aliases
#

if (( $+commands[rsync] )); then
  _rsync_cmd='rsync --verbose --progress --human-readable --compress --archive --hard-links --one-file-system'

  alias rsync-copy="${_rsync_cmd}"
  alias rsync-move="${_rsync_cmd} --remove-source-files"
  alias rsync-update="${_rsync_cmd} --update"
  alias rsync-synchronize="${_rsync_cmd} --update --delete"

  unset _rsync_cmd
fi

#
# Curl aliases
#

if (( $+commands[curl] )); then
  alias get='curl --continue-at - --location --progress-bar --remote-name --remote-time'
fi

#
# Docker aliases
#

if (( $+commands[docker] )); then
  alias dockrm='docker rm -v $(docker ps -aq -f status=exited)'
fi

