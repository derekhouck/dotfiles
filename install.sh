#!/bin/bash

declare -r GITHUB_REPOSITORY="derekhouck/dotfiles"
dotfiles="$HOME/dotfiles"

# Configure "git up" alias
git config --global alias.up '!git remote update -p; git merge --ff-only @{u}'

echo "Hi! I'm going to install tooling and tweak your system settings. Here I go..."

# If missing, download and extract the dotfiles repository
if [ ! -e $dotfiles/.git ]; then
	echo "Cloning dotfiles\n"
	git clone --depth=1 https://github.com/$GITHUB_REPOSITORY.git $dotfiles
	ln -s "$HOME/dotfiles/.bash_profile" .bash_profile
else
	echo "Updating dotfiles\n"
	cd $dotfiles && git checkout master && git up
fi

cd $dotfiles

source ./lib/utils

# Figure out what platform we're on and react accordingly
if ( is_mac ); then
    echo "You're on a Mac"

    # Before relying on Homebrew, check that packages can be compiled
    echo "First, we're going to make sure that XCode is installed"
    if ! type_exists 'gcc'; then
        e_error "The XCode Command Line Tools must be installed first."
        printf "  Download them from: https://developer.apple.com/downloads\n"
        printf "  Then run: bash ~/.dotfiles/bin/dotfiles\n"
        exit 1
    fi

    echo "
    ########################
    ###     HOMEBREW     ###
    ########################
    "

    if [ ! -f "$(which brew)" ]; then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
        echo -e "Homebrew already installed"
    fi

    brew doctor
    brew update
    brew upgrade

    echo "Installing MacVim"
    brew install macvim
elif ( is_linux ); then
    echo "This is a Linux system"
fi;


