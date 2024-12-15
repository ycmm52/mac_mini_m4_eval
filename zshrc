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
alias ta="tmux attach"
alias tk="tmux kill-server"

###############
###   ENV   ###
###############
export PATH="/opt/homebrew/bin:$PATH:/bin"

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
# fzf
eval "$(fzf --zsh)"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

_fzf_compgen_path() {
    fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
    fd --type=d --hidden --exclude .git . "$1"
}

eval "$(starship init zsh)"
eval $(thefuck --alias)
eval $(thefuck --alias fuck)
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"

. "$HOME/.atuin/bin/env"
