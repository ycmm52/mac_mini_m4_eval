#!/bin/env bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# color theme
brew install starship
# brew install bash-completion
# brew install bash-completion@2
# top
brew install htop
brew install btop
brew install gotop
brew install glances
brew install bottom
brew install neofetch
brew install cpufetch
# fetch git repo info
brew install onefetch
# terminal manager
brew install tmux
# find
brew install fd
# ls
brew install lsd
brew install eza
brew install exa
brew tap pls-rs/pls
brew install pls
# file manager
brew install nnn
# file manager, vim like in python
brew install ranger
# another file manager in rust
brew install yazi
# midnight commander file manager
brew install mc
# seems a good file manager
brew install superfile
# file manager in rust
brew install joshuto
#grep
brew install ack
# du
brew install duf
# disk usage
brew install ncdu
brew install gdu
# fuzzy find
brew install fzf
# like cat but with syntax highlighting
brew install bat
# markdown cat
brew install mdcat
# for diff
brew install delta
# diff
brew install difftastic
# for fuck
brew install thefuck
# man pages
brew install tldr
# cheatsheet manager
brew install navi
# text mode git
brew install tig
# du
brew install dust
# command monitor
brew install progress
# history
brew install atuin
# render markdown
brew install glow
# download youtube videos
brew install yt-dlp
# reconver overwritten data, in python
brew install recoverpy
# automatically run cmd when file change
brew install entr
# dot file manager
brew install chezmoi
# git ui
brew install lazygit
# docker ui
brew install lazydocker
# markdown gui viewer
brew tap textualize/homebrew/frogmouth
# brew install frogmouth
# db visualization
brew install danvergara/tools/dblab
# find duplicate and empty files
brew install rmlint
# sync tool
brew install rsync
# useful automate guidelines
brew install howdoi
# backup, encrypt, snpashot, repo management
brew install restic
# sync files
brew install rsync
# sync files
brew install syncthing
# rsync for cloud
brew install rclone
# docker
brew install dive
# sed
brew install sd
# python package management, project-based
brew install uv
# process manager, ps
brew install peco
# process manager, ps
brew install procs
# github CLI, use gh auth login to get access to github on CLI
brew install gh
# tree
brew install tre-command
# visualization ping
brew install gping
# generate regexp
brew install grex
# netword speedtest
brew install speedtest-cli
# markdown viewer in terminal
brew install glow
# fast and effective compression
brew install zstd
# nettracing
brew install nettrace


###########################
###   Python Packages   ###
###########################
mkenv DEFAULT
python3 -m pip install loguru
python3 -m pip install rich
python3 -m pip install pikepdf
# for regexp test
# python3 -m pip install rexi
# SQL IDE
# python3 -m pip install harlequin

################
###   curl   ###
################
# x.cmd manual
eval "$(curl https://get.x-cmd.com)"

################
###   font   ###
################
# Use NerdFonts JetBrainsMono
# Windows terminal have to install it via Windows

###############
###   apt   ###
###############

sudo apt install zip
sudo apt install iotop
sudo apt install tcl
sudo apt install tcllib
# file manager
# bash -c "$(curl -sLo- https://superfile.netlify.app/install.sh)"

#####################
###   ssh-setup   ###
#####################
# 1. ssh-keygen -t ed25519 -C "mcy124129@gmail.com" : generate a ssh public-private key
# 2. set the ssh folder at Linux home, not Windows to better control the permission
# 3. add passphrase for better security
# 4. eval "$(ssh-agent -s)" : to start an agent (add to .bashrc?)
# 5. ssh-add ~/.ssh/id_ed25519 to add key to ssh agent

########################
###   windows apps   ###
########################
#######################
###   open source   ###
#######################
# more windows apps
    # power toys
    # rubick
# manage windows clipboard
    # copyQ
# activate windows and office for free
    # Microsoft-Activation-Scripts
# fastest search
    # everything
# remote desktop
    # rustdesk
