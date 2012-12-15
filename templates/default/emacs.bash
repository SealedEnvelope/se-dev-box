if [ -n "$INSIDE_EMACS" ]; then
  export PAGER=cat
  [ -f $BASH_IT/custom/emacs_shell_prompt.sh ] && source $BASH_IT/custom/emacs_shell_prompt.sh
fi
