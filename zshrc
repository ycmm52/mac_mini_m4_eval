#################
###   Alias   ###
#################
alias ss="source $HOME/.zshrc"
alias ll="ls -l"
alias lt="ll -tr"
alias lnf="ln -fns"

###############
###   ENV   ###
###############
export PATH="/opt/homebrew/bin:$PATH"

###################
###   Options   ###
###################
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
