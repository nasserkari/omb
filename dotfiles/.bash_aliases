# ~/.bash_aliases

# System (Debian/Ubuntu)
alias update='sudo apt update'
alias upgrade='sudo apt upgrade -y'

# APT maintenance
alias apt-li='apt list'
alias apt-clean='sudo apt autoremove -y && sudo apt autoclean'

# History
alias hh='history 30'
alias hc='history -c && history -w'
alias hcx='history -c && history -w && exit'

# Quick utilities
alias cls='clear'
alias reload='source ~/.bashrc'

# Functions

# Make a folder (with parents) and enter it
mkcd() {
    if [ $# -ne 1 ]; then
        echo "Usage: mkcd <directory>" >&2
        return 1
    fi

    if ! mkdir -p -- "$1"; then
        echo "mkcd: could not create '$1'" >&2
        return 1
    fi

    if ! cd -- "$1"; then
        echo "mkcd: could not enter '$1'" >&2
        return 1
    fi
}
