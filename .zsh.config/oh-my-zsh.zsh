# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.oh-my-zsh.custom"

# CASE_SENSITIVE="true" 		# case-sensitive completion.
HYPHEN_INSENSITIVE="true" 		# hyphen-insensitive completion. Case-sensitive completion must be off. _ and - will be interchangeable.
# DISABLE_MAGIC_FUNCTIONS="true" 	# if pasting URLs and other text is messed up.
# DISABLE_LS_COLORS="true" 		# disable colors in ls.
# DISABLE_AUTO_TITLE="true" 		# disable auto-setting terminal title.
# ENABLE_CORRECTION="true" 		# enable command auto-correction.
# COMPLETION_WAITING_DOTS="true" 	# display red dots whilst waiting for completion. You can also set it to another string to have that shown instead of the default red dots. # e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# DISABLE_UNTRACKED_FILES_DIRTY="true" 	# if you want to disable marking untracked files under VCS as dirty.
# HIST_STAMPS="yyyy/mm/dd" 		# You can set one of the optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# ZSH_CUSTOM=/path/to/new-custom-folder # Would you like to use another custom folder than $ZSH/custom?
ZSH_TIME="24"

# Set oh-my-zsh options before sourcing oh-my-zsh.zsh 
DEFAULT_USER=$(whoami)
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins config 
export NVM_COMPLETION=true
export NVM_LAZY_LOAD=true

# Plugins enabled
plugins=(
    # python dev tools
    python
    pyenv
    poetry # custom completions
    # tools
    git	
    gitignore
    gitfast
    docker
    docker-compose
    jsontools
    # envs
    direnv
    zsh-nvm
    # others
    macos
    colored-man-pages
    copyfile
    copypath
    # zsh shell 
    evalcache
    safe-paste
    sudo
    zsh-autosuggestions
    zsh-history-substring-search
    zsh-syntax-highlighting

)
source $ZSH/oh-my-zsh.sh

# ZSH Custom plugins settings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Enable vim commands manually instead of vi-mode since that breaks p10k 
# transiet mode. see https://github.com/romkatv/powerlevel10k/issues/1952#issuecomment-1603722745
bindkey -v

# allow vv to edit the command line (standard behaviour)
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'vv' edit-command-line
