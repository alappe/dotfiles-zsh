# make HOME and END working
bindkey '\eOH' beginning-of-line
bindkey '\eOF' end-of-line

bindkey '^R' history-incremental-search-backward

watch=(all)
WATCHFMT='%n %a at %t %w.'

# turn on full featured completion (minimal needs: zsh3.1)
autoload -U compinit
compinit 

# for the mac problem with mail...
unsetopt mailwarning

alias top="top -o cpu"
alias ctags="/usr/local/bin/ctags"
# Some git aliases…
alias gl="git log --graph --pretty=format':%C(yellow)%h%d%Creset %s %C(white) %an, %ar%Creset' --color "
alias gs="git status --short "
alias gca="git commit -a "
#
alias -s tex=vim
alias -s latex=vim

# set VIMODE according to the current mode (default “[i]”)
VIMODE=' '
function zle-keymap-select {
 	VIMODE="${${KEYMAP/vicmd/!}/(main|viins)/ }"
	precmd
 	zle reset-prompt
}
zle -N zle-keymap-select

# z (https://github.com/rupa/z)
. `brew --prefix`/etc/profile.d/z.sh

# React on the previous exit code…
function precmd {
    if [ $? -eq '0' ]; then
        PROMPT="[%B%n%b@%B%m%b]${VIMODE}[%d]%B%#%b "
    else
        PROMPT="[%B$?%b--%d]${VIMODE}%B%#%b "
    fi

    z --add "$(pwd -P)"
}

# Righthand time
RPROMPT="[%B%T%b]"

# Load RVM function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
