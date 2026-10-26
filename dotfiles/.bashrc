# ~/.bashrc

# Interactive only
case $- in
*i*) ;;
*) return ;;
esac

# History
HISTSIZE=100000
HISTFILESIZE=100000
HISTCONTROL=ignoreboth
shopt -s histappend
shopt -s checkwinsize

# Friendlier less for non-text files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Enable color support and useful aliases
if [ -x /usr/bin/dircolors ]; then
    if [ -r "$HOME/.dircolors" ]; then
        eval "$(dircolors -b "$HOME/.dircolors")"
    else
        eval "$(dircolors -b)"
    fi

    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Aliases
alias l='ls -CF'
alias ll='ls -l'
alias la='ls -A'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Programmable completion
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# Prompt
PS1='\[\e[38;2;80;250;123m\]➜\[\e[0m\]  \[\e[38;2;139;233;253m\]\W\[\e[0m\] '

case "$TERM" in
xterm* | rxvt*) PS1="\[\e]0;\u@\h: \w\a\]$PS1" ;;
esac

# Terminal colors
echo -ne "\e]11;#1e1e2e\a" # background
echo -ne "\e]10;#cdd6f4\a" # foreground
echo -ne "\e]12;#cdd6f4\a" # cursor

# Environments
