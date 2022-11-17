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
zsh_add_source_file "p10k.zsh"

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
