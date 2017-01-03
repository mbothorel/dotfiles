# Enable bash completion
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
			. /usr/share/bash-completion/bash_completion

# Set history lenght
# number of line per session
export HISTSIZE=10000
# number of line in the log
export HISTFILESIZE=200000

# Aliases
alias ll='ls -lahF --color=auto'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias du='du -h'
alias df='df -h'
alias frequency='history | cut -c8- | sort | uniq -c | sort -rn | head -20'

# LESS
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS="-FSRXI"

PS1='[\[\e[0;31m\]\u\[\e[m\]@\[\e[0;34m\]\h \[\e[0;33m\]\W\e[m\]]\$ '

# goto directory
shopt -s autocd
