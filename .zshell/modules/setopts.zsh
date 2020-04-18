#
# Changing directory options
#

setopt AUTO_CD              # Auto changes to a directory without typing cd.
setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_MINUS          # Swap meaning of cd +1 and cd -1
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
setopt PUSHD_TO_HOME        # Push to home directory when no argument is given.
unsetopt CDABLE_VARS        # Change directory to a path stored in a variable.

#
# Completion options
#

setopt ALWAYS_TO_END        # Move cursor to the end of a completed word.
setopt AUTO_LIST            # Automatically list coices on ambiguous completion. <D>
setopt AUTO_MENU            # Show completion menu on a succesive tab press. <D>
setopt AUTO_NAME_DIRS       # Auto add variable-stored paths to ~ list.
setopt AUTO_PARAM_SLASH     # On directory completion, add a trailing slash. <D>
setopt COMPLETE_IN_WORD     # Complete from both ends of a word.
unsetopt MENU_COMPLETE      # Do not autoselect the first completion entry

#
# Expansion and globbing options
#

setopt BRACE_CCL            # Expressions between braces to a list.
unsetopt CASE_GLOB          # Make globbing insensitive to case
setopt EXTENDED_GLOB        # Use extended globbing syntax
setopt GLOB_DOTS            # Don't require leading dots to be matched explicitly.

#
# History options
#

setopt BANG_HIST            # Use the '!' character to access the history.
setopt EXTENDED_HISTORY     # Add :start:elapsed; to the history.
setopt INC_APPEND_HISTORY   # Write to the history file immediately.
setopt HIST_ALLOW_CLOBBER   # History gets rewritten to allow clobbering.
setopt HIST_EXPIRE_DUPS_FIRST # Expire a duplicate event first when trimming.
setopt HIST_FIND_NO_DUPS    # Don't display events cycled through already again.
setopt HIST_IGNORE_ALL_DUPS # Delete old duplicate events.
setopt HIST_IGNORE_DUPS     # Do not record an event that was just recorded.
setopt HIST_IGNORE_SPACE    # Don't record events starting with a space
setopt HIST_SAVE_NO_DUPS    # Ignore older duplicate events when writing out.
setopt HIST_VERIFY          # Don't execute immediately.
setopt HIST_REDUCE_BLANKS   # Reduce blanks when adding events to history.
setopt SHARE_HISTORY        # Share history between all sessions.

#
# Input and output
#

setopt CORRECT              # Correction for commands
setopt NO_CLOBBER           # Don't overwrite existing files with > and >>
                            # Use >! and >>! or history to bypass.
setopt PATH_DIRS            # Perform path search for commands with slash in them.

#
# Job control
#

setopt AUTO_RESUME          # Allow resuming job with name of command
setopt CHECK_JOBS           # Report on jobs when shell exits.
setopt LONG_LIST_JOBS       # Use the long format for jobs by default.
setopt NOTIFY               # Immediately report status of background tasks.

#
# Prompting
#

setopt PROMPT_PERCENT       # Treat %-chars specially in the prompt.
setopt PROMPT_SUBST         # Perform substitutions in prompt
setopt TRANSIENT_RPROMPT    # Only show the rprompt on the current prompt.

#
# Scripts and Functions
#

setopt MULTIOS              # Write to multiple descriptors.

#
# Zle
#

unsetopt BEEP              # Turn of beeping on errors
setopt COMBINING_CHARS     # Combine zero-length punctuation characters (accents).
