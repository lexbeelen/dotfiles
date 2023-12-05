#!/bin/sh
HISTSIZE=1000000
SAVEHIST=1000000

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/var/lib/snapd/snap/bin:$PATH"

[[ -n $TMUX ]] && export TERM="xterm-256color"
