# ghprwt - create a git worktree for a pull request
# Usage: cpr <PR_NUMBER> [<REMOTE>]
function ghprwt() {
  local pr="$1"
  local remote="${2:-origin}"
  if [[ -z "$pr" ]]; then
    pr=$(gh pr list --limit 100 --json number,title,updatedAt,author --template \
      '{{range .}}{{tablerow .number .title .author.name (timeago .updatedAt)}}{{end}}' |
      fzf --height 25% --reverse |
      cut -f1 -d ' ') || return
  fi
  local branch dirname
  branch=$(gh pr view "$pr" --json headRefName -q .headRefName) || return
  dirname="pr-${pr}-${branch//\//_}"

  if [[ -d "../$dirname" ]]; then
    cd "../$dirname" || return
    git fetch "$remote" "$branch" || return
    git switch "$branch" || return
    git merge --ff-only FETCH_HEAD || return
    echo "Switched to existing worktree for PR #$pr: $branch (../$dirname)"
    return
  fi

  git fetch "$remote" "$branch"
  git worktree add "../$dirname" "$branch"
  cd "../$dirname" || return
  echo "Switched to new worktree for PR #$pr: $branch (../$dirname)"
}
