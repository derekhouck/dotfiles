source ~/.profile
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'
alias flatten="find 2016/ -mindepth 2 -type f -exec mv -i '{}' 2016/ ';'";
alias trash="rmtrash"
alias themes="cd vagrant-local/www/wordpress-default/wp-content/themes/"
export PATH="/usr/local/bin:$PATH"
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
eval "$(rbenv init -)"
