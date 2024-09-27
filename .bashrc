#!/usr/bin/env bash

# ██████╗  █████╗ ███████╗██╗  ██╗
# ██╔══██╗██╔══██╗██╔════╝██║  ██║
# ██████╔╝███████║███████╗███████║
# ██╔══██╗██╔══██║╚════██║██╔══██║
# ██████╔╝██║  ██║███████║██║  ██║
# ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝

# My bash config. Not much to see here; just some pretty standard stuff.

### EXPORT
export TERM="xterm-256color"
export HISTCONTROL=ignoredups:erasedups
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="brave"
# export PATH="$PATH:$HOME/.local/bin:$HOME/.local/bin/my-scripts:$HOME/.bun/bin"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"
# vf() { fzf | xargs -r -I % EDITOR %; }

### SET MANPAGER
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

### SET VI MODE ###
# Comment this line out to enable default emacs-like bindings
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Define an array of directories to add to PATH
directories=(
  "$HOME/.local/bin"
  "$HOME/.local/bin/my-scripts"
  "$HOME/.bun/bin"
)

# Iterate over the array and add each directory to PATH if it exists
for dir in "${directories[@]}"; do
  if [ -d "$dir" ]; then
    PATH="$PATH:$dir"
  fi
done

# Export the modified PATH
export PATH

### SHOPT
shopt -s autocd  # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend     # do not overwrite history
shopt -s expand_aliases # expand aliases
shopt -s checkwinsize   # checks term size when bash regains control

#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

### ARCHIVE EXTRACTION
# usage: ex <file>
ex() {
  if [ -f "$1" ]; then
    case "$1" in
    *.tar.bz2) tar xjf "$1" ;;
    *.tar.gz) tar xzf "$1" ;;
    *.bz2) bunzip2 "$1" ;;
    *.rar) unrar x "$1" ;;
    *.gz) gunzip "$1" ;;
    *.tar) tar xf "$1" ;;
    *.tbz2) tar xjf "$1" ;;
    *.tgz) tar xzf "$1" ;;
    *.zip) unzip "$1" ;;
    *.Z) uncompress "$1" ;;
    *.7z) 7z x "$1" ;;
    *.deb) ar x "$1" ;;
    *.tar.xz) tar xf "$1" ;;
    *.tar.zst) unzstd "$1" ;;
    *) echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# changing cd to zoxide
alias cd='z'

# navigation
alias ..='z ..'
alias ...='z ../..'
alias .3='z ../../..'
alias .4='z ../../../..'
alias .5='z ../../../../..'

# vim and emacs
alias v='nvim'

# Changing "ls" to "exa"
alias ls='exa -al --icons --color=always --group-directories-first' # my preferred listing
alias lt='exa -aT --color=always --group-directories-first'         # tree listing
alias l.='exa -a | grep -E "^\."'

# Changing "cat" to "bat"
alias cat="bat"

# pacman and yay
alias parsua='paru -Sua --noconfirm'            # update only AUR pkgs (paru)
alias parsyu='paru -Syu --noconfirm'            # update standard pkgs and AUR pkgs (paru)
alias unlock='sudo rm /var/lib/pacman/db.lck'   # remove pacman lock
alias cleanup='sudo pacman -Rns (pacman -Qtdq)' # remove orphaned packages
alias upd='sudo pacman -Syyu'                   # To update the system
# alias grubup="update-grub"                      # To update the grub files
alias hw='hwinfo --short'                          # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl"     # Sort installed packages according to size in MB
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l' # List amount of -git packages
alias tarnow='tar -acf '
alias untar='tar -xvf '
alias wget='wget -c '
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl" # Recent installed pkgs
alias dir='dir --color=auto'                                                  # colorize dir
alias vdir='vdir --color=auto'                                                # colorize vdir

# get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='grep -E --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='trash-put -v'
alias trestore='trash-restore'
alias tlist='trash-list'
alias tempty='trash-empty -v'

# adding flags
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB

# ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"
# alias pscpu='ps auxf | sort -nr -k 3'

# get error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# switch between shells
alias tobash="sudo chsh \$USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh \$USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh \$USER -s /bin/fish && echo 'Now log out.'"

# Distrobox
alias dbox="/usr/bin/distrobox-enter -T -n System_Hacked -- "
alias kali="distrobox enter System_Hacked"

# Mysql
alias mysql="mariadb"

# bun (Node package manager)
alias npm="bun"
alias npx="bunx"

# icat (image viewer)
alias icat="kitty +kitten icat --align=left"

# mkdir
alias mkdir="mkdir -p"

# source bash config file
alias sourcebash="source ~/.bashrc"

# show the date
# %Z
# alias date='date "+%Y-%m-%d %A %T"'

# copy path
alias copypath="pwd | wl-copy"

# open
alias open="xdg-open"

# gpg encryption
# verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
# receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

### RANDOM COLOR SCRIPT ###
# Get this script from my GitLab: gitlab.com/dwt1/shell-color-scripts
# Or install it from the Arch User Repository: shell-color-scripts
# colorscript random

# source /etc/bash.bashrc
# source /etc/bash.command-not-found
# source /etc/bash.bash_logout

### BASH INSULTER ###
# if [ -f /etc/bash.command-not-found ]; then
#     . /etc/bash.command-not-found
# fi

### SETTING THE STARSHIP PROMPT ###
eval "$(starship init bash)"
eval "$(zoxide init bash)"
