#!/bin/sh
# Colorize grep output
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# a quick way to start laygit
alias g='lazygit'

# Lunarvim as default vim
alias vim='lvim'

# Confirm before overwriting something
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# a quick way to source zshrc
alias s='source ~/.zshrc'

## get rid of command not found ##
alias cd..='cd ..'
 
## a quick way to get out of current directory ##
alias ..='cd ..'

# a quick way to clear the terminal
alias c='clear'

# Debian
alias apt-get='sudo apt-get'

# mkdir command is used to create a directory:
alias mkdir='mkdir -pv'

# List with exa
if command -v exa &> /dev/null; then
  alias ls="exa --icons --group-directories-first"
  alias tree="exa --icons --group-directories-first --tree --level=2"
fi

if [[ $TERM == "xterm-kitty" ]]; then
  alias ssh="kitty +kitten ssh"
fi
