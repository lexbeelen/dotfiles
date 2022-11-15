#!/bin/sh
# Colorize grep output
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Lazygit
alias g='lazygit'

# Lunarvim as default
alias vim='lvim'

# Confirm before overwriting something
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Source
alias s='source ~/.zshrc'

# Others
alias c='clear'


# List with exa
if command -v exa &> /dev/null; then
  alias ls="exa --icons --group-directories-first"
  alias tree="exa --icons --group-directories-first --tree --level=2"
fi

if [[ $TERM == "xterm-kitty" ]]; then
  alias ssh="kitty +kitten ssh"
fi
