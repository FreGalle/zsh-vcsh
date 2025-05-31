# Set to the directory you typically clone your git repos
CODE_DIR=$HOME/src

# Completion for repo
_repo_comp() {
  reply=(`ls $CODE_DIR`);
}

function repo() {
  if [ ! -d "$CODE_DIR/$1" ]; then
    echo Repo missing: $1
    cd $CODE_DIR

	for org in $(gh org list); do
		git clone "git@${GH_HOST}:${org}/$1.git" && break
	done
  fi

  if [ "$TERM" = "xterm-kitty" ]; then
	  kitten @ set-tab-title $1
  fi

  cd $CODE_DIR/$1
}

compctl -M 'm:{a-z}={A-Z}' -K _repo_comp repo
