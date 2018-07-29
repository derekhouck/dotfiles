source ~/.bashrc
source ~/.profile
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'
alias trash="rmtrash"
export PATH="/usr/local/bin:$PATH"
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
eval "$(rbenv init -)"

# Make Terminal Better

cd() { builtin cd "$@"; ls; }   # Always list directory contents upon 'cd'
