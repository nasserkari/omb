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

# Colors
if [ -x /usr/bin/dircolors ]; then
    if [ -r ~/.dircolors ]; then
        eval "$(dircolors -b ~/.dircolors)"
    else
        eval "$(dircolors -b)"
    fi
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# Aliases
alias ll='ls -l'
alias la='ls -a'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Prompt
PS1='\[\e[38;2;80;250;123m\]➜\[\e[0m\]  \[\e[38;2;139;233;253m\]\W\[\e[0m\] '

echo -ne "\e]11;#1e1e2e\a" # background
echo -ne "\e]10;#cdd6f4\a" # foreground
echo -ne "\e]12;#cdd6f4\a" # cursor

case "$TERM" in
xterm* | rxvt*) PS1="\[\e]0;\u@\h: \w\a\]$PS1" ;;
esac

# Environments
