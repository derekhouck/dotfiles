source ~/.bashrc
source ~/.profile
export PS1="\n\[\033[33;1m\]\w\n\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h\[\033[m\]-> "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'
alias trash="rmtrash"
export PATH="/usr/local/bin:$PATH"
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Git Bash completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Load rbenv automatically
eval "$(rbenv init -)"

# Make Terminal Better

cd() { builtin cd "$@"; ls; }   # Always list directory contents upon 'cd'

# Set environment variable for PGDATA (Postgres)
export PGDATA=/usr/local/var/postgres
export PATH="$HOME/.rbenv/bin:~/.rbenv/shims:$PATH"

export ro_linode_key=cd7833c64e355d1c239aef464d912fa6354dab2097a902fa7efba35b2fe1f8b0
