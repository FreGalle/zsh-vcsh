# Zshell completions installed with homebrew
typeset -U fpath
fpath=(
  /opt/homebrew/share/zsh-completions(N)
  $fpath
)

# Auto suggestions
if [ -d /opt/homebrew/share/zsh-autosuggestions ]; then
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# History substring search
#
# Alternative for prefix-only context-sensitive search: https://unix.stackexchange.com/a/97844
if [ -d /opt/homebrew/share/zsh-history-substring-search ]; then
  source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh

  # bind keys
  zmodload zsh/terminfo
  bindkey "$terminfo[kcuu1]" history-substring-search-up
  bindkey "$terminfo[kcud1]" history-substring-search-down
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
  bindkey -M emacs '^P' history-substring-search-up
  bindkey -M emacs '^N' history-substring-search-down
  bindkey -M vicmd 'k' history-substring-search-up
  bindkey -M vicmd 'j' history-substring-search-down

  # set colors
  export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='underline,fg=green,bold'
  export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='underline,fg=red,bold'
  export HISTORY_SUBSTRING_SEARCH_GLOBBING_FLAGS='i'
fi

# FZF support

if (( $+commands[fzf] )); then
  # Set up fzf key bindings and fuzzy completion
  source <(fzf --zsh)
  export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!.git/*"'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

# Base Git branch reviews off of master by default
if (( $+commands[git] )); then
	export REVIEW_BASE=master
fi

# Added by Nix installer
if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then 
	source ~/.nix-profile/etc/profile.d/nix.sh; 
fi

# NVM support

if [ -d /opt/homebrew/opt/nvm ]; then
	export NVM_DIR="$HOME/.nvm"
	source /opt/homebrew/opt/nvm/nvm.sh
	source /opt/homebrew/opt/nvm/etc/bash_completion.d/nvm
fi

# Mac Terminal.app directory reporting
update_terminal_cwd() {
  printf '\e]7;%s\a' "file://$HOSTNAME$PWD"
}

chpwd_functions=(update_terminal_cwd)
update_terminal_cwd
