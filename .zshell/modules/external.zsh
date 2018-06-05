# Zshell completions installed with homebrew
fpath=(
  /usr/local/share/zsh-completions(N)
  $fpath
)

# Syntax highlighting
if [ -d /usr/local/share/zsh-syntax-highlighting ]; then
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor root)
fi

# History substring search
if [ -d /usr/local/opt/zsh-history-substring-search ]; then
  source /usr/local/opt/zsh-history-substring-search/zsh-history-substring-search.zsh

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
if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh

  export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!.git/*"'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi
