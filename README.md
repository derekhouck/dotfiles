# Installation #
```
curl https://raw.github.com/derekhouck/dotfiles/master/install.sh -L -o - | sh
```
## What this does ##

1. Checks which platform we're on.
2. If Mac...
    1. Checks if XCode is installed
    2. Installs Homebrew if not already installed then runs `brew doctor` and `brew update`
    3. Installs MacVim
3. If Linux...
