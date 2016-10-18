export EDITOR=nvim
export VISUAL=nvim

# key bindings
# bindkey "\e[1~" beginning-of-line
# bindkey "\e[4~" end-of-line
# bindkey "\e[5~" beginning-of-history
# bindkey "\e[6~" end-of-history
# bindkey "\e[3~" delete-char
# bindkey "\e[2~" quoted-insert
# bindkey "\e[5C" forward-word
# bindkey "\eOc" emacs-forward-word
# bindkey "\e[5D" backward-word
# bindkey "\eOd" emacs-backward-word
# bindkey "\ee[C" forward-word
# bindkey "\ee[D" backward-word
# bindkey "^H" backward-delete-word
# for rxvt
# bindkey "\e[8~" end-of-line
# bindkey "\e[7~" beginning-of-line

# bindkey "^R" history-incremental-search-backward

alias :q="exit"
alias :qa="exit"

alias vi="nvim"
alias vim="nvim"

alias sudo="sudo -E"

# Load dnvm
[ -s "~/.dnx/dnvm/dnvm.sh" ] && . "~/.dnx/dnvm/dnvm.sh"
