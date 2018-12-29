# Installation #
```
git clone https://github.com/derekhouck/dotfiles.git && cd dotfiles && source install.sh
```
## What this does ##

1. Pulls the latest dotfiles git repository.
2. Creates symlinks.
3. Checks which platform we're on.
4. If Mac...
    1. Checks if XCode is installed
    2. Installs Homebrew if not already installed then runs `brew doctor` and `brew update`
    3. Installs MacVim
    4. Installs rbenv
    5. Installs The Fuck
5. If Linux...

## Sync VSCode settings ##
```
ln -s ~/dotfiles/VSCode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s ~/dotfiles/VSCode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
```
