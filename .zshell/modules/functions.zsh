#
# Open man-page in Dash
#

function _mand {
  if (( $# > 0 )); then
    open "dash://manpages:$1" 2>/dev/null
    if (( $? != 0 )); then
      print "$0: Dash is not installed" >&2
      break
    fi
  else
    print 'What manual page do you want?' >&2
  fi
}

#
# Makes a directory and changes to it.
#

function mcd {
  [[ -n "$1" ]] && mkdir -p "$1" && builtin cd "$1"
}

#
# Easily create a named directory
#
function namedir {
  eval "$1"="$PWD"; : $1
}

#
# Display a neatly formatted path
#

path() {
  echo $PATH | tr ":" "\n" | \
    awk "{ sub(\"/usr\",   \"$fg_no_bold[green]/usr$reset_color\"); \
           sub(\"/bin\",   \"$fg_no_bold[blue]/bin$reset_color\"); \
           sub(\"/opt\",   \"$fg_no_bold[cyan]/opt$reset_color\"); \
           sub(\"/sbin\",  \"$fg_no_bold[magenta]/sbin$reset_color\"); \
           sub(\"/local\", \"$fg_no_bold[yellow]/local$reset_color\"); \
           print }"
}
