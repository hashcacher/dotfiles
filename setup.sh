#!/bin/bash
cd $(dirname $0)

BASHRC="$(pwd)/.bashrc"
VIM="$(pwd)/.vimrc"
BASHALIASES="$(pwd)/.bash_aliases"
I3STATUS="$(pwd)/i3status.conf"

ln -s $BASHRC "$HOME/.bashrc"
ln -s $VIM "$HOME/.vimrc"
ln -s $BASHALIASES "$HOME/.bash_aliases"
mkdir $HOME/.config/i3
mkdir $HOME/.config/i3/i3status
ln -s $I3STATUS "$HOME/.config/i3/i3status/config"

