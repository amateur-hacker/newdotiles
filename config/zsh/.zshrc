#
# ███████╗███████╗██╗  ██╗
# ╚══███╔╝██╔════╝██║  ██║
#   ███╔╝ ███████╗███████║
#  ███╔╝  ╚════██║██╔══██║
# ███████╗███████║██║  ██║
# ╚══════╝╚══════╝╚═╝  ╚═╝

# My zsh config. Not much to see here; just some pretty standard stuff.

# options
unsetopt menu_complete
unsetopt flowcontrol
unsetopt BEEP

setopt prompt_subst
setopt always_to_end
setopt append_history
setopt auto_menu
setopt complete_in_word
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history
setopt no_list_ambiguous

bindkey -v

autoload -U compinit
compinit

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.config/zsh/zsh_history


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

# Changing "cat" to "bat"
alias cat="bat"

# pacman and yay
alias parsua='paru -Sua --noconfirm'             # update only AUR pkgs (paru)
alias parsyu='paru -Syu --noconfirm'             # update standard pkgs and AUR pkgs (paru)
alias unlock='sudo rm /var/lib/pacman/db.lck'    # remove pacman lock
alias cleanup='sudo pacman -Rns (pacman -Qtdq)' # remove orphaned packages
alias upd='sudo pacman -Syyu'                     # To update the system
# alias grubup="update-grub"                      # To update the grub files
alias hw='hwinfo --short'                          # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl"     # Sort installed packages according to size in MB
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l' # List amount of -git packages
alias tarnow='tar -acf '
alias untar='tar -xvf '
alias wget='wget -c '
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"  # Recent installed pkgs
alias dir='dir --color=auto'    # colorize dir
alias vdir='vdir --color=auto'  # colorize vdir

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
alias rm='trash-put'
alias tr='trash-restore'
alias tl='trash-list'
alias tempty='trash-empty'

# adding flags
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB

# ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'

# get error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# switch between shells
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

# Distrobox
alias dbox='/usr/bin/distrobox-enter -T -n System_Hacked -- '
alias kali='distrobox enter System_Hacked'

# Mysql
alias mysql='mariadb'

# bun (Node package manager)
alias npm='bun'
alias npx='bun x'
alias bunx='bun x'

# icat (image viewer)
alias icat="kitty +kitten icat --align=left"

# mkdir
alias mkdir="mkdir -p"

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# history substring search options
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


sfc() {
    find ~/.config/* ~/.local/bin/* -type f | grep -E 'cava|dunst|fish/config.fish|hypr|kitty|lf|mpv|qt5ct|rofi|swaylock|waybar|wlogout|starship.toml|zathura|.local/bin' | fzf | xargs -r /usr/bin/nvim
}

sff() {
    command ls -a -p | grep -v / 2>/dev/null | fzf | xargs -r -I % $EDITOR %
}

sfd() {
    selected_dir=$(find . -maxdepth 1 -type d | sed 's/.\///' | fzf --prompt='Select a directory: ')

    if [ -n "$selected_dir" ]; then
        if [ -d "$selected_dir" ]; then
            cd "$selected_dir"
        fi
    fi
}

searchfzf() {
    echo "1. Search config file"
    echo "2. Open file from current directory"
    echo "3. Change directory"
    read -sk1 "option?Choose an option: "
    echo
    case $option in
        1) sfc;;
        2) sff;;
        3) sfd;;
        *) echo "Invalid option";;
    esac
}

# autoload sfd; zle -N sfd
# Bind Ctrl + f to the function
bindkey -s '^f' "searchfzf \n"

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
source $HOME/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.config/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
# source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
