# TODO: use this variable during  sourcing
export ZSH_CONFIG="~/.zsh.config"

# Enable for debugging zsh start-up
# source ~/.zsh.config/debug.zsh

# Set zsh options
source ~/.zsh.config/start.zsh

# Oh-my-zsh plugins and theme
DEFAULT_USER=$(whoami)
ZSH_THEME="powerlevel10k/powerlevel10k"
source ~/.zsh.config/oh-my-zsh.zsh
source ~/.zsh.config/p10k.zsh

# TODO: source ~/.zsh.config/exports.zsh
# TODO: cdk autocomplete is terrible slow: source ~/.zsh.config/autocomplete.zsh
source ~/.zsh.config/aliases.zsh
source ~/.zsh.config/plugins.zsh
source ~/.zsh.config/functions.zsh

# export MANPATH="/usr/local/man:$MANPATH"
# export LANG=en_US.UTF-8   # You may need to manually set your language environment
