#!/bin/bash

echo 'Installing vim'
brew install vim

echo 'Creating required folders'
mkdir $HOME/vim
mkdir $HOME/vim/undo $HOME/vim/swap $HOME/vim/undo

