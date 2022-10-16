# Dot files
alias dot="lazygit --git-dir=$HOME/.dot/ --work-tree=$HOME"
alias dotg="/usr/bin/git --git-dir=$HOME/.dot/ --work-tree=$HOME"
alias dots="dt status"
alias dotp="dt push"

# Shortcuts
alias doc="~/Documents/"
alias dl="~/Downloads/"
alias p="~/Projects/"

# Work projects
alias nba="~/Projects/postnl-ccb-nba-model/" 
alias ccb="~/Projects/postnl-ccb-application/" 
alias pen="~/Projects/postnl-ccb-personalization-component/"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
alias vim=$EDITOR
alias nvim=$EDITOR

# Config editing
alias zshconfig="$EDITOR ~/.zshrc && exec zsh"
alias reload="exec zsh"

# Link brew to global python
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
export HOMEBREW_NO_AUTO_UPDATE=1

# Shortcut for lazygit and lazydocker
alias lg="lazygit"
alias ld="lazydocker"

# Use exa as ls - https://github.com/ogham/exa
alias ls='exa' # just replace ls by exa and allow all other exa arguments
alias l='ls -lbF' #   list, size, type
alias la='ls -la' # long, all
alias lam='ll --sort=modified' # list, long, sort by modification date
alias ll='ls -lbhHigUmuSa' # all list
alias lx='ls -lbhHigUmuSa@' # all list and extended
alias tree='exa --tree' # tree view
alias lS='exa -1' # one column by just names
