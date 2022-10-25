# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Export path
export PATH="$HOME/bin:/usr/local/bin:$PATH"

# Only reload zcompdump each day
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# Expand alias with tab
bindkey "^Xa" _expand_alias
zstyle ':completion:*' completer _expand_alias _complete _ignored
zstyle ':completion:*' regular true


# Auto-update behavior
# zstyle ':omz:update' mode disabled  	# disable automatic updates
# zstyle ':omz:update' mode auto      	# update automatically without asking
zstyle ':omz:update' mode reminder  	# just remind me to update when it's time
zstyle ':omz:update' frequency 30 	# how often to auto-update (in days).
