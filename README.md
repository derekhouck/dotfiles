# Installation

## For Macs

Before you can run the below code, install _XCode_.

```shell
xcode-select --install
```

## For Every Platform

```
git clone https://github.com/derekhouck/dotfiles.git && cd dotfiles && source install.sh
```

## What this does

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

## Change Terminal theme

See [Dracula -- A dark theme for Terminal.app](https://draculatheme.com/terminal/) for full instructions

1. Go to Terminal's Preferences
1. Click Profiles
1. Click the icon next to + and -
1. Click Import...
1. Select the Dracula.terminal file in the `terminal-app` folder.
1. Click Default

## Sync VSCode settings

Go to VSCode settings window and turn on Settings Sync. Plugin no longer needed.
