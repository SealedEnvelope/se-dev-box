if [ -n "$INSIDE_EMACS" ]; then
  export PAGER=cat
  [ -f $BASH_IT/custom/emacs_shell_prompt.sh ] && source $BASH_IT/custom/emacs_shell_prompt.sh
  export NODE_NO_READLINE=1
fi

export EDITOR=emacsclient
