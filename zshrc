# Set options
setopt AUTO_CD
setopt CORRECT
setopt NO_CASE_GLOB
unsetopt nomatch
unsetopt correct_all

# aliases
alias ls='ls -GFh'
alias trash='rmtrash'
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# PATH updates
export PATH=~/.npm-global/bin:$PATH

# Make Terminal Better
cd() { builtin cd "$@"; ls; }   # Always list directory contents upon 'cd'

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# Initialize zsh completion system
autoload -Uz compinit && compinit

# Prompt customization
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%2~%b %# '

# Git info in right side prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{yellow}%b%f'
zstyle ':vcs_info:*' enable git

# Create alias for `fuck`
eval $(thefuck --alias)

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# rbenv
eval "$(rbenv init - zsh)"

# Enable vi mode
bindkey -v

##########
# EVERFI #
##########

# Start and stop puma-dev easily
alias stop-pd='launchctl unload ~/Library/LaunchAgents/io.puma.dev.plist'
alias start-pd='launchctl load ~/Library/LaunchAgents/io.puma.dev.plist'

# Docker
alias dcb='docker-compose build'
alias dcu='docker-compose up'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
