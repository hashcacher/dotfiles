#!/bin/bash
cd $(dirname $0)

BASHRC="$(pwd)/.bashrc"
VIM="$(pwd)/.vimrc"
BASHALIASES="$(pwd)/.bash_aliases"

ln -s $BASHRC "$HOME/.bashrc"
ln -s $VIM "$HOME/.vimrc"
ln -s $BASHALIASES "$HOME/.bash_aliases"
