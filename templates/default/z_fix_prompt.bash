# reload the theme after history_settings.bash stomps it
if [[ $BASH_IT_THEME ]]; then
    source "$BASH_IT/themes/$BASH_IT_THEME/$BASH_IT_THEME.theme.bash"
fi
