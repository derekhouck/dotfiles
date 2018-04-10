#!/bin/sh

echo "Hi! I'm going to install tooling and tweak your system settings. Here I go..."

dotfiles="$HOME/dotfiles"
if [ ! -e $dotfiles/.git ]; then
	echo "Cloning dotfiles\n"
	git clone --depth=1 https://github.com/derekhouck/dotfiles.git $dotfiles
	ln -s "$HOME/dotfiles/.bash_profile" .bash_profile
else
	echo "Updating dotfiles\n"
	cd $dotfiles && git pull
fi
