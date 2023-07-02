# List of used config files
export ZSH_CONFIG="$HOME/.zsh.config"
files=(
    # "$ZSH_CONFIG/debug.zsh"       # Enable for profiling zsh start-up
    "$ZSH_CONFIG/start.zsh"         # ZSH options
    "$ZSH_CONFIG/oh-my-zsh.zsh"     # Init oh-my-zsh
    "$ZSH_CONFIG/p10k.zsh"          # powerlevel10k theme
    "$ZSH_CONFIG/aliases.zsh"       # aliases
    "$ZSH_CONFIG/plugins.zsh"       # shell plugins
    "$ZSH_CONFIG/functions.zsh"     # custom functions
    "$ZSH_CONFIG/iterm2_shell_integration.zsh"
    # TODO: seperate file for exports?
    # "$ZSH_CONFIG/exports.zsh"
    # TODO: cdk autocomplete is terrible slow: 
    # "$ZSH_CONFIG/autocomplete.zsh"
)

# Set oh-my-zsh options before sourcing oh-my-zsh.zsh 
DEFAULT_USER=$(whoami)
ZSH_THEME="powerlevel10k/powerlevel10k"

# Source config files if available
for file in $files; do
    if [[ -a "$file" ]]; then
        source "$file"
    fi
done

unset file
unset files 

# export MANPATH="/usr/local/man:$MANPATH"
# export LANG=en_US.UTF-8   # You may need to manually set your language environment
