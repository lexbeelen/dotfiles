#!/bin/sh
HISTSIZE=1000000
SAVEHIST=1000000

export EDITOR='lvim'
export TERMINAL='kitty'

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

[[ -n $TMUX ]] && export TERM="xterm-256color"
