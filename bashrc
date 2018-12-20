if type brew 2&>/dev/null; then
  source "$(brew --prefix)/etc/bash_completion"
else
  echo "run: brew install git bash-completion"
fi
eval $(thefuck --alias)
