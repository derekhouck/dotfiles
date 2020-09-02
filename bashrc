# Set alias for fuck
eval $(thefuck --alias)

# heroku autocomplete setup
HEROKU_AC_BASH_SETUP_PATH=/Users/derekhouck/Library/Caches/heroku/autocomplete/bash_setup && test -f $HEROKU_AC_BASH_SETUP_PATH && source $HEROKU_AC_BASH_SETUP_PATH;

# added by travis gem
[ -f /Users/derekhouck/.travis/travis.sh ] && source /Users/derekhouck/.travis/travis.sh

# Fuzzy finder
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Default editor
export EDITOR='code'
