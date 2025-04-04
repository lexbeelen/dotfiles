#!/bin/sh

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="powerlevel10k/powerlevel10k"

export ZSH="$HOME/.oh-my-zsh"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export ZCONFIGDOTDIR=$HOME/.config/zsh

function zsh_add_source_file() {
   if [ -f "$ZCONFIGDOTDIR/$1" ]; then
     source "$ZCONFIGDOTDIR/$1"
   else
     print "$ZCONFIGDOTDIR/$1 file not found."
   fi
}


zsh_add_source_file "functions.zsh"
zsh_add_source_file "aliases.zsh"
zsh_add_source_file "exports.zsh"
zsh_add_source_file "bindkeys.zsh"
zsh_add_source_file "p10k.zsh"
zsh_add_source_file "/fzf/completion.zsh"
zsh_add_source_file "/fzf/key-bindings.zsh"

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# bun completions
[ -s "/home/mothership/.bun/_bun" ] && source "/home/mothership/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/mothership/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
