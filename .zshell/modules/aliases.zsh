#
# File information
#

if (( $+commands[lsd] )); then
  alias ls='lsd --group-directories-first --hyperlink=auto'
fi

alias la='ls -a'
alias ll='ls -l'
alias lr='ls -R'
alias lt='ls --tree'
alias lla='ll -a'
alias llr='ll -R'

if (( $+commands[bat] )); then
  alias cat=bat
fi

#
# Directory movement
#

alias dirs='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

#
# Global aliases
#

alias -g   L="|& less"
alias -g   G="| grep -a --line-buffered"
alias -g JQL="| jq -C '.' | less -R"
alias -g   S="| sed -l 's/^[^{]*//'"
alias -g   T="| tail"
alias -g   H="| head"

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
  alias glg="git log --graph --pretty=format:'%Cred%h%Creset - %s %Cgreen(%cr)%Creset%C(auto)%d%Creset %C(dim white)%an%Creset'"
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
  alias d='docker'
  alias drm='docker rm -v $(docker ps -aq -f status=exited)'

  alias dc='docker compose'
fi

if [ "$TERM" = 'xterm-kitty' ]; then
  alias ssh="kitty +kitten ssh"
fi

if (( $+commands[ngrep] )); then
    alias ng='ngrep -tqW byline -d any'
fi

if (( $+commands[gron] )); then
	alias ungron="gron --ungron"
fi

if (( $+commands[osascript] ));then
	alias -g ding="osascript -e 'display notification \"Done!\" sound name \"glass\"' || osascript -e 'display notification \"Error!\" sound name \"basso\"'"
fi
