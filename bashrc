# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# Colorprompt
if [ $UID = 0 ]; then
	PS1='\[\e[0;31m\]\u\[\e[m\]@\[\e[0;34m\]\h\[\e[m\] \[\e[0;33m\]\w\[\e[m\] \[\e[0;31m\]\$\[\e[m\] \[\e[0;37m\]'
else
	PS1='\[\e[0;31m\]\u\[\e[m\]@\[\e[0;34m\]\h\[\e[m\] \[\e[0;33m\]\w\[\e[m\] \[\e[0;31m\]\$\[\e[m\] \[\e[0;37m\]'
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -lahF --color=auto'
alias ls='ls --color=auto'
alias du='du -h --max-depth=1'
alias grep='grep --color=auto'
test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# EDITOR
export VISUAL=vim
export EDITOR="$VISUAL"
export TERM=rxvt

# bépo layout on typematrix keybord
#setxkbmap -layout fr -variant bepo -device 12
