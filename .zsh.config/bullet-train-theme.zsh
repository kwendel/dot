# Bullet train - custom zsh theme
#ZSH_THEME="bullet-train"
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
