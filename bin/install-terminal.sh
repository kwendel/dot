#/bin/bash

echo "Installing iterm2"
brew install --cask iterm2
git clone git@github.com:mbadolato/iTerm2-Color-Schemes.git $HOME/dot-resources/iTerm2-Color-Schemes
brew tap homebrew/cask-fonts 
brew install --cask font-jetbrains-mono

echo "Installing oh-my-zsh"
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Downloading extra plugins + themes" 
brew install fzf
$(brew --prefix)/opt/fzf/install
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone git@gist.github.com:d7c4a595679dfb0c4cbae14e21f45454.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/vi-mode-agnoster
git clone https://github.com/mroth/evalcache ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/evalcache

echo "TODO: set iterm2 colorscheme (Preferences > Profile > Colors) and font (Preferences > Profile > Text)"
echo "TODO: change vi-mode-agnoster"
