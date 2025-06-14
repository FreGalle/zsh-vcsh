  function ghpr() {
    gh pr list --limit 100 --json number,title,updatedAt,author --template \
      '{{range .}}{{tablerow .number .title .author.name (timeago .updatedAt)}}{{end}}' |
      fzf --height 25% --reverse |
      cut -f1 -d ' ' |
      xargs gh pr checkout
  }
