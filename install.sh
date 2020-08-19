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
ln -s "$dotfiles/gitconfig" .gitconfig
ln -s "$dotfiles/irbrc" .irbrc
ln -s "$dotfiles/gemrc" .gemrc

cd $dotfiles

source ./lib/utils

# Figure out what platform we're on and react accordingly
if ( is_mac ); then
    echo "You're on a Mac"

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

    #Git
    echo "Installing Git"
    brew install git

    # MacVim
    echo "Installing MacVim"
    brew install macvim

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


