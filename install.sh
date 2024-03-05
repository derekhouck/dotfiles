#!/bin/bash

declare -r GITHUB_REPOSITORY="derekhouck/dotfiles"
dotfiles="$HOME/dotfiles"

# Configure "git up" alias
git config --global alias.up '!git remote update -p; git merge --ff-only @{u}'

echo "Hi! I'm going to install tooling and tweak your system settings. Here I go..."

# Make sure the repo is up-to-date
echo "Updating dotfiles\n"
cd $dotfiles && git checkout master && git up
git submodule init
git submodule update

# Create symlinks
echo "Symlinking dotfiles"
cd $HOME
ln -s "$dotfiles/profile" .profile
ln -s "$dotfiles/bashrc" .bashrc
ln -s "$dotfiles/bash_profile" .bash_profile
ln -s "$dotfiles/zprofile" .zprofile
ln -s "$dotfiles/zshrc" .zshrc
ln -s "$dotfiles/gitconfig" .gitconfig
ln -s "$dotfiles/irbrc" .irbrc
ln -s "$dotfiles/gemrc" .gemrc

cd $dotfiles

source ./lib/utils

# Figure out what platform we're on and react accordingly
if ( is_mac ); then
    echo "You're on a Mac"

    # Install Homebrew
    source $dotfiles/brew.sh

    brew doctor
    brew update
    brew upgrade

    # Fonts
    echo "Installing fonts"
    brew tap homebrew/cask-fonts
    brew install --cask font-fira-code

    # Git
    echo "Installing Git"
    brew install git

    # MacVim
    echo "Installing MacVim"
    brew install macvim

	# fzf
	echo "Installing fzf"
	brew install fzf

    # VSCode
    echo "Installing Visual Studio Code"
    brew install --cask visual-studio-code

    # rbenv
    echo "Installing rbenv"
    brew install rbenv
    rbenv init

    # The Fuck
    echo "Install The Fuck"
    brew install thefuck
elif ( is_linux ); then
    echo "This is a Linux system"
fi;


