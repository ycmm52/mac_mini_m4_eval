#################
###   Alias   ###
#################
alias ss="source $HOME/.zshrc"
alias ls="lsd"
alias ll='ls -la'
alias lt='ls -ltra'
alias cd='z'
alias b='cd ../'
alias bb='cd ../../'
alias bbb='cd ../../../'
alias bbbb='cd ../../../../'
alias gv='gvim'
alias v='vim'
alias df='duf'
alias du='dust'
alias top='htop'
alias cat='bat'
alias where='which -a'
alias lnf="ln -fs"
alias g="lazygit"
alias gdu="gdu-go"
alias t="tre -e"
alias ps="procs"
alias h="history"

###############
###   ENV   ###
###############
export PATH="/opt/homebrew/bin:$PATH"

###################
###   Options   ###
###################
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}'
# zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'

####################
###   Packages   ###
####################
eval "$(starship init zsh)"
eval $(thefuck --alias)
eval $(thefuck --alias fuck)
eval "$(zoxide init zsh)"
