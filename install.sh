#!/bin/bash

declare -r GITHUB_REPOSITORY="derekhouck/dotfiles"

echo "Hi! I'm going to install tooling and tweak your system settings. Here I go..."

echo "First, I need the admin password."
sudo -v

echo "Updating all existing software"
sudo softwareupdate --install --all

##############################################################################################################
### XCode Command Line Tools
#      thx https://github.com/alrra/dotfiles/blob/ff123ca9b9b/os/os_x/installs/install_xcode.sh

echo "Now, we're going to make sure that xcode is installed"

if ! xcode-select --print-path &> /dev/null; then

    # Prompt user to install the XCode Command Line Tools
    xcode-select --install &> /dev/null

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Wait until the XCode Command Line Tools are installed
    until xcode-select --print-path &> /dev/null; do
        sleep 5
    done

    print_result $? 'Install XCode Command Line Tools'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Point the `xcode-select` developer directory to
    # the appropriate directory from within `Xcode.app`
    # https://github.com/alrra/dotfiles/issues/13

    sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
    print_result $? 'Make "xcode-select" developer directory point to Xcode'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Prompt user to agree to the terms of the Xcode license
    # https://github.com/alrra/dotfiles/issues/10

    sudo xcodebuild -license
    print_result $? 'Agree with the XCode Command Line Tools licence'

fi
###
##############################################################################################################

dotfiles="$HOME/dotfiles"
if [ ! -e $dotfiles/.git ]; then
	echo "Cloning dotfiles\n"
	git clone --depth=1 https://github.com/$GITHUB_REPOSITORY.git $dotfiles
	ln -s "$HOME/dotfiles/.bash_profile" .bash_profile
else
	echo "Updating dotfiles\n"
	cd $dotfiles && git pull
fi

echo "Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
brew update

echo "Installing MacVim"
brew install macvim