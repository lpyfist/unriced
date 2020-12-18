export BROWSER="/bin/firefox"
export EDITOR="/bin/nvim"
export PASTEL_COLOR_MODE=8bit
export PERL_DESTRUCT_LEVEL=2
export HISTSIZE=1000
export GPG_TTY=$(tty)

# open man pages in nvim
export MANPAGER='nvim +Man!'
export MANWIDTH=999

PS1="\n\[$(tput setaf 8)\][\w]\[$(tput sgr0)\] "

cdl() {
    cd "$@" && ls --color=auto
}

shopt -s \
    autocd \
    cdspell \
    expand_aliases \
    globstar \
    dotglob \
    checkwinsize \
    histappend

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind 'set colored-stats On'
bind 'set completion-ignore-case On'
bind 'set completion-prefix-display-length 3'
bind 'set mark-symlinked-directories On'
bind 'set show-all-if-ambiguous On'
bind 'set show-all-if-unmodified On'
bind 'set visible-stats On'

export PF_INFO="title os wm pkgs shell kernel memory "
export PF_SEP=" "
export PF_COL1=7
export PF_COL2=7
export PF_COL3=2

[ -f /home/lpy/.aliases ] && . /home/lpy/.aliases
[ -f /home/lpy/.profile ] && . /home/lpy/.profile
