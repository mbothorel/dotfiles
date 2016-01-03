# /etc/zsh/zshrc: system-wide .zshrc file for zsh(1).
#
# This file is sourced only for interactive shells. It
# should contain commands to set up aliases, functions,
# options, key bindings, etc.
#
# Global Order: zshenv, zprofile, zshrc, zlogin

READNULLCMD=${PAGER:-/usr/bin/pager}

# An array to note missing features to ease diagnosis in case of problems.
typeset -ga debian_missing_features

if [[ -z "$DEBIAN_PREVENT_KEYBOARD_CHANGES" ]] &&
   [[ "$TERM" != 'emacs' ]]
then

    typeset -A key
    key=(
        BackSpace  "${terminfo[kbs]}"
        Home       "${terminfo[khome]}"
        End        "${terminfo[kend]}"
        Insert     "${terminfo[kich1]}"
        Delete     "${terminfo[kdch1]}"
        Up         "${terminfo[kcuu1]}"
        Down       "${terminfo[kcud1]}"
        Left       "${terminfo[kcub1]}"
        Right      "${terminfo[kcuf1]}"
        PageUp     "${terminfo[kpp]}"
        PageDown   "${terminfo[knp]}"
    )

    function bind2maps () {
        local i sequence widget
        local -a maps

        while [[ "$1" != "--" ]]; do
            maps+=( "$1" )
            shift
        done
        shift

        sequence="${key[$1]}"
        widget="$2"

        [[ -z "$sequence" ]] && return 1

        for i in "${maps[@]}"; do
            bindkey -M "$i" "$sequence" "$widget"
        done
    }

    bind2maps emacs             -- BackSpace   backward-delete-char
    bind2maps       viins       -- BackSpace   vi-backward-delete-char
    bind2maps             vicmd -- BackSpace   vi-backward-char
    bind2maps emacs             -- Home        beginning-of-line
    bind2maps       viins vicmd -- Home        vi-beginning-of-line
    bind2maps emacs             -- End         end-of-line
    bind2maps       viins vicmd -- End         vi-end-of-line
    bind2maps emacs viins       -- Insert      overwrite-mode
    bind2maps             vicmd -- Insert      vi-insert
    bind2maps emacs             -- Delete      delete-char
    bind2maps       viins vicmd -- Delete      vi-delete-char
    bind2maps emacs viins vicmd -- Up          up-line-or-history
    bind2maps emacs viins vicmd -- Down        down-line-or-history
    bind2maps emacs             -- Left        backward-char
    bind2maps       viins vicmd -- Left        vi-backward-char
    bind2maps emacs             -- Right       forward-char
    bind2maps       viins vicmd -- Right       vi-forward-char

    # Make sure the terminal is in application mode, when zle is
    # active. Only then are the values from $terminfo valid.
    if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
        function zle-line-init () {
            emulate -L zsh
            printf '%s' ${terminfo[smkx]}
        }
        function zle-line-finish () {
            emulate -L zsh
            printf '%s' ${terminfo[rmkx]}
        }
        zle -N zle-line-init
        zle -N zle-line-finish
    else
        for i in {s,r}mkx; do
            (( ${+terminfo[$i]} )) || debian_missing_features+=($i)
        done
        unset i
    fi

    unfunction bind2maps

fi # [[ -z "$DEBIAN_PREVENT_KEYBOARD_CHANGES" ]] && [[ "$TERM" != 'emacs' ]]

zstyle ':completion:*:sudo:*' command-path /usr/local/sbin \
                                           /usr/local/bin  \
                                           /usr/sbin       \
                                           /usr/bin        \
                                           /sbin           \
                                           /bin            \
                                           /usr/X11R6/bin

(( ${+aliases[run-help]} )) && unalias run-help

autoload -Uz run-help compinit promptinit colors 
compinit
promptinit
prompt elite
colors


# ALias
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias -g G=' | grep '
alias ll='ls -lahF --color=auto'
alias xs='cd'
alias git='LC_ALL=en_US git'
alias sl='sl -F'
alias wpas='wpa_supplicant -B -i wlan0 -c /etc/wpa_supplicant/wpa_supplicant.conf'
alias wpap='wpa_passphrase'
alias wpad='wpa_supplicant -B -i wlan0 -c /etc/wpa_supplicant/wpa_supplicant.conf && dhclient wlan0'

# Ignore duplicate lines in the history
setopt HIST_IGNORE_DUPS

# Prompt :
PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg_no_bold[yellow]%}%~ %{$reset_color%}%# "
RPROMPT="[%{$fg_no_bold[yellow]%}%?%{$reset_color%}]"

export EDITOR=/usr/bin/vi

# History
export HISTSIZE=2000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

## History

#Nombre d'entrées dans l'historique
export HISTORY=1000
export SAVEHIST=1000

# Ajoute l'historique à la fin de l'ancien fichier
setopt append_history

# Chaque ligne est ajoutée dans l'historique à mesure qu'elle est tapée
setopt inc_append_history

# Ne stocke pas une ligne dans l'historique si elle est identique à la
# précédente
setopt hist_ignore_dups

# Supprime les répétitions dans l'historique lorsqu'il est plein, mais
# pas avant
setopt hist_expire_dups_first
#
# La recherche dans l'historique avec l'éditeur de commandes de zsh ne
# montre pas une même ligne plus d'une fois, même si elle a été
# enregistrée
setopt hist_find_no_dups

# Set emacs shortcuts
bindkey -e
