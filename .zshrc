# List of used config files
export ZSH_CONFIG="$HOME/.zsh.config"
files=(
    # "$ZSH_CONFIG/debug.zsh"       # Enable for profiling zsh start-up
    "$ZSH_CONFIG/start.zsh"         # ZSH options
    "$ZSH_CONFIG/plugins.zsh"       # Plugins, load before oh-my-zsh
    "$ZSH_CONFIG/oh-my-zsh.zsh"     # Settings for oh-my-zsh
    "$ZSH_CONFIG/p10k.zsh"          # powerlevel10k theme
    "$ZSH_CONFIG/aliases.zsh"       # aliases
    "$ZSH_CONFIG/functions.zsh"     # custom functions
    # External plugins
    "$ZSH_CONFIG/iterm2_shell_integration.zsh"
    "$ZSH_CONFIG/fzf.zsh"
    # TODO: seperate file for exports?
    # "$ZSH_CONFIG/exports.zsh"
    # TODO: cdk autocomplete is terrible slow: 
    # "$ZSH_CONFIG/autocomplete.zsh"
)

# Source config files if available
for file in $files; do
    if [[ -a "$file" ]]; then
        source "$file"
    fi
done

unset file
unset files 

# export MANPATH="/usr/local/man:$MANPATH"
