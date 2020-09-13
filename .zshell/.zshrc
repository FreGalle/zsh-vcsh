#
# Executes commands at the start of an interactive session
#
# Note that it is important that external is loaded last,
# otherwise the syntax highlighting doesn't work correctly.
#

source ${ZDOTDIR:-$HOME}/modules/setopts.zsh
source ${ZDOTDIR:-$HOME}/modules/exports.zsh
source ${ZDOTDIR:-$HOME}/modules/prompt.zsh
source ${ZDOTDIR:-$HOME}/modules/completion.zsh
source ${ZDOTDIR:-$HOME}/modules/aliases.zsh
source ${ZDOTDIR:-$HOME}/modules/bindkeys.zsh
source ${ZDOTDIR:-$HOME}/modules/functions.zsh
source ${ZDOTDIR:-$HOME}/modules/history.zsh
source ${ZDOTDIR:-$HOME}/modules/other.zsh
source ${ZDOTDIR:-$HOME}/modules/external.zsh

if [ -d ${ZDOTDIR:-$HOME}/commands ];then
	for f in ${ZDOTDIR:-$HOME}/commands/*.zsh; do
		source $f
	done
fi
