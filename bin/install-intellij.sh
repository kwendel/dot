#!/bin/bash

echo 'Installing IntelliJ IDEA'
brew install --cask intellij-idea

echo 'Installing Spacemacs keymapping'
git clone https://github.com/MarcoIeni/intellimacs ~/.intellimacs

