#/bin/bash

echo "Installing nvim with Doom configuration"
brew install fd ctags node code-minimap neovim
brew install --cask font-hack-nerd-font
git clone --depth 1 https://github.com/NTBBloodbath/doom-nvim.git ${XDG_CONFIG_HOME:-$HOME/.config}/nvim

echo "Installing Python LSP"
python3 pip install neovim

