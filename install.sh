#!/bin/sh

git clone --depth=1 https://tainitam@bitbucket.org/tainitam/dotfiles.git "$HOME/dotfiles"
ln -s "$HOME/dotfiles/.bash_profile" .bash_profile

