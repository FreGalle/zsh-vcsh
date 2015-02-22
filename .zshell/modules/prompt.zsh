function __prompt_precmd {
  # Check for untracked files or updated submodules since vcs_info does not.
  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    branch_format="(${_prompt_colors[1]}%b%f%u%c${_prompt_colors[4]}●%f)"
  else
    branch_format="(${_prompt_steeef_colors[1]}%b%f%u%c)"
  fi

  zstyle ':vcs_info:*:prompt:*' formats "${branch_format}"

  vcs_info 'prompt'
}

function __virtual_env {
  psvar[1]=''
  [ $VIRTUAL_ENV ] && psvar[1]=${VIRTUAL_ENV##*/}
}

function __ssh {
  psvar[2]=''
  [ $SSH_CONNECTION ] && psvar[2]="%n@%m"
}

function __ruby_env {
  psvar[3]=''
  if (( $+commands[rvm-prompt] )); then
    psvar[3]="$(rvm-prompt)"
  elif (( $+commands[rbenv] )); then
    psvar[3]="$(rbenv version-name)"
  else
    psvar[3]=''
  fi
}

function __prompt_setup {
  # Load required functions.
  autoload -Uz vcs_info

  # Add hook for calling vcs_info before each command.
  autoload -Uz add-zsh-hook
  add-zsh-hook precmd __prompt_precmd
  add-zsh-hook precmd __virtual_env
  add-zsh-hook precmd __ssh
  add-zsh-hook precmd __ruby_env

  # Use extended color pallete if available.
  if [[ $TERM = *256color* || $TERM = *rxvt* ]]; then
    _prompt_colors=(
      "%F{81}"  # Turquoise
      "%F{166}" # Orange
      "%F{135}" # Purple
      "%F{161}" # Hotpink
      "%F{118}" # Limegreen
    )
  else
    _prompt_colors=(
      "%F{cyan}"
      "%F{yellow}"
      "%F{magenta}"
      "%F{red}"
      "%F{green}"
    )
  fi

  # Formats:
  #   %b - branchname
  #   %u - unstagedstr (see below)
  #   %c - stagedstr (see below)
  #   %a - action (e.g. rebase-i)
  #   %R - repository path
  #   %S - path in the repository
  local branch_format="(${_prompt_colors[1]}%b%f%u%c)"
  local action_format="(${_prompt_colors[5]}%a%f)"
  local unstaged_format="${_prompt_colors[2]}●%f"
  local staged_format="${_prompt_colors[5]}●%f"

  # Set vcs_info parameters.
  zstyle ':vcs_info:*' enable git hg svn
  zstyle ':vcs_info:*:prompt:*' check-for-changes true
  zstyle ':vcs_info:*:prompt:*' unstagedstr "${unstaged_format}"
  zstyle ':vcs_info:*:prompt:*' stagedstr "${staged_format}"
  zstyle ':vcs_info:*:prompt:*' actionformats "${branch_format}${action_format}"
  zstyle ':vcs_info:*:prompt:*' formats "${branch_format}"
  zstyle ':vcs_info:*:prompt:*' nvcsformats   ""

  # Define prompts.
  # The %(xV...) construction tests psvar[x] and applies .true.false
  local returnval="%(?.%{%F{green}%}➜ .%{%F{red}%}➜ )"
  local virtual_env="%(1V.(%1v).)"
  local ssh="%(2V.%{%F{red}%}%wv.)"
  local ruby="%(3V.(%3v).)"

  PROMPT="${returnval} ${ssh}%{%F{blue}%}%~%f %# "
  RPROMPT='${vcs_info_msg_0_}'"${virtual_env}${ruby}"
  SPROMPT="Correct %F{red}%R%f to %F{green}%r%f [(y)es (n)o (a)bort (e)dit]? "
}

__prompt_setup "$@"
