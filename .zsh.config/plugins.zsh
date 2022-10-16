# evalcache to cache eval ($"...") statements
export ZSH_EVALCACHE_DIR=$HOME/.config/zsh/evalcache

# Pyenv shims setup
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# Python thefuck plugin
_evalcache thefuck --alias     

# Enable fzf fuzzy search on command search (ctrl+r) or file search (ctrl+t)
source ~/.zsh.config/fzf.zsh

# iterm2 integrations
source ~/.zsh.config/iterm2_shell_integration.zsh
