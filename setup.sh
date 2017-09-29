#!/bin/bash
cd $(dirname $0)

BASHRC="$(pwd)/.bashrc"
VIM="$(pwd)/.vimrc"
BASHALIASES="$(pwd)/.bash_aliases"
I3="$(pwd)/.i3config"
I3STATUS="$(pwd)/i3status.conf"

ln -sf $BASHRC "$HOME/.bashrc"
ln -sf $VIM "$HOME/.vimrc"
ln -sf $BASHALIASES "$HOME/.bash_aliases"
mkdir $HOME/.config/i3
mkdir $HOME/.config/i3/i3status
ln -sf $I3 "$HOME/.config/i3/config"
ln -sf $I3STATUS "$HOME/.config/i3/i3status/config"

