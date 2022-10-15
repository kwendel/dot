export PATH="$HOME/bin:/usr/local/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"

# zsh profiling
# zmodload zsh/zprof

# Only reload zcompdump each day
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="agnoster"
DEFAULT_USER=$(whoami)

# Bullet train - custom zsh theme
ZSH_THEME="bullet-train"
BULLETTRAIN_CONTEXT_DEFAULT_USER=$(whoami)
BULLETTRAIN_PROMPT_ADD_NEWLINE=false
BULLETTRAIN_DIR_EXTENDED=0
BULLETTRAIN_VIRTUALENV_BG=black
BULLETTRAIN_VIRTUALENV_FG=white
BULLETTRAIN_DIR_BG=blue
BULLETTRAIN_DIR_FG=white
BULLETTRAIN_TIME_BG=black
BULLETTRAIN_TIME_FG=white
BULLETTRAIN_PROMPT_ORDER=(
    time
    status
    # context
    screen
    aws
    dir
    git
    virtualenv
    # perl
    # ruby
    # nvm
    # go
    # rust
    # elixir
    # hg
    cmd_exec_time
    custom
)


# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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

# Auto-update behavior
# zstyle ':omz:update' mode disabled  	# disable automatic updates
# zstyle ':omz:update' mode auto      	# update automatically without asking
zstyle ':omz:update' mode reminder  	# just remind me to update when it's time
zstyle ':omz:update' frequency 30 	# how often to auto-update (in days).

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/

# Plugins config 
export NVM_COMPLETION=true
export NVM_LAZY_LOAD=true

# Plugins enabled
plugins=(
    # Git
    git	
    gitignore
    gitfast
    # envs
    dotenv
    zsh-nvm
    pyenv
    autoswitch_virtualenv
    # others
    macos
    vi-mode
    colored-man-pages
    # zsh shell 
    evalcache
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-history-substring-search
)
source $ZSH/oh-my-zsh.sh

# ZSH Custom plugins settings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
# export LANG=en_US.UTF-8   # You may need to manually set your language environment

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
alias vim=$EDITOR
alias nvim=$EDITOR

# Aliases
alias zshconfig="$EDITOR ~/.zshrc && source ~/.zshrc"
alias reload="source ~/.zshrc"

# Brew
export HOMEBREW_NO_AUTO_UPDATE=1
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'

# evalcache to cache eval ($"...") statements
export ZSH_EVALCACHE_DIR=$HOME/.config/zsh/evalcache

# Pyenv shims setup
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# Python thefuck plugin
_evalcache thefuck --alias     

# Enable fzf fuzzy search on command search (ctrl+r) or file search (ctrl+t)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# AWS aliases
function mfa(){
    # request temporary credentials with global python version
    $PYENV_ROOT/versions/3.9.11/bin/aws-mfa --duration 129600 --profile $1
   
    # set aws environment if aws-mfa was successfull (exit 0)
    if [[ $? = 0 ]]; then
        export AWS_PROFILE=$1
        return 0
    fi
    return 1
}

# startup time of zsh 
function timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

# analyse startup time per plugin
function timeplugins() {
    for plugin ($plugins); do
        timer=$(($(gdate +%s%N)/1000000))
        if [ -f $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh ]; then
            source $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh
        elif [ -f $ZSH/plugins/$plugin/$plugin.plugin.zsh ]; then
            source $ZSH/plugins/$plugin/$plugin.plugin.zsh
        fi
        now=$(($(gdate +%s%N)/1000000))
        elapsed=$(($now-$timer))
        echo $elapsed":" $plugin
    done
}

# Dot files
alias dt="/usr/bin/git --git-dir=$HOME/.dot/ --work-tree=$HOME"
