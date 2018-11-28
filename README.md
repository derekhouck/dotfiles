# Installation #
```
curl https://raw.github.com/derekhouck/dotfiles/master/install.sh -L -o - | sh
```
## What this does ##

1. Checks if the dotfiles git repository exists on this machine. If not, it clones it. If it does, it updates it.
2. Creates symlinks.
3. Checks which platform we're on.
4. If Mac...
    1. Checks if XCode is installed
    2. Installs Homebrew if not already installed then runs `brew doctor` and `brew update`
    3. Installs MacVim
5. If Linux...
