#!/bin/sh
HISTSIZE=1000000
SAVEHIST=1000000

export PATH="$HOME/.local/bin:$PATH"
export PATH="/var/lib/snapd/snap/bin:$PATH"

export AWS_DEFAULT_PROFILE="lexbeelen"

[[ -n $TMUX ]] && export TERM="xterm-256color"
