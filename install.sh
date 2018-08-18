#!/bin/bash

declare -r GITHUB_REPOSITORY="derekhouck/dotfiles"

echo "Hi! I'm going to install tooling and tweak your system settings. Here I go..."

echo "First, I need the admin password."
sudo -v

echo "Updating all existing software"
sudo softwareupdate --install --all

echo "Now, we're going to make sure that xcode is installed"
xcode-select --install

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