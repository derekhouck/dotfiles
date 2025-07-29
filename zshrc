# Aliases
alias ls='ls -GFh'
alias trash='rmtrash'
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

## Docker aliases
alias dcb='docker-compose build'
alias dcu='docker-compose up'

## Rust aliases
alias cra='cargo run --target=x86_64-apple-darwin'

# Key bindings
## Enable vi mode
bindkey -v

## Binds up and down to a history search
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# Set pager
## Use the `-S` option so it truncates long lines for scrolling instead of wrapping them
export PAGER='less -S'

# PATH updates
export PATH=~/.cargo/bin:$PATH
export PATH=~/.npm-global/bin:$PATH
export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.2.2/bin:$PATH"
export PATH=~/.local/bin:$PATH
export PATH=/opt/homebrew/opt/go@1.20/bin:$PATH
export PATH=~/.n/bin:$PATH
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export PATH="$PATH:/path/to/elixir/bin"

# Set and unset options
setopt AUTO_CD
setopt CORRECT
setopt NO_CASE_GLOB
unsetopt nomatch
unsetopt correct_all

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

# Fuzzy Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# n global env
export N_PREFIX=~/.n
