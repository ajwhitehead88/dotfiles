if [ "$TMUX" = "" ]; then exec tmux attach; fi

export HISTSIZE=10000
export SAVEHIST=10000
export EDITOR="vim"

# eval `dircolors -b ~/.dircolours`

setopt notify globdots correct pushdtohome autolist
setopt correctall autocd recexact longlistjobs
setopt autoresume histignoredups pushdsilent
setopt autopushd pushdminus extendedglob rcquotes mailwarning
setopt noflowcontrol completeinword
unsetopt bgnice autoparamslash

bindkey -v

autoload -U colors && colors
autoload -Uz compinit && compinit
autoload -U promptinit && promptinit

alias sudo="nocorrect sudo -E"
alias ls="ls --color=auto -hF"
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias l="ls -CF"
alias mv="mv -v --backup=existing"
alias cp="cp -v --backup=existing"
alias rm="rm -v"
alias :q="exit"
alias :qa="exit"
alias vi="vim"
alias dfh="df -h"
alias duh="du -h"
alias grep="grep -n --color=auto"
alias screen="cd && screen -RAD"
alias tmux="tmux -2"
alias atmux="cd && (tmux attach || tmux new)"
alias chmodrd="find . -type d -exec chmod 755 {} \;"
alias chmodrf="find . -type f -exec chmod 644 {} \;"
alias chmodsf="find . -type f -exec chmod 664 {} \;"
alias chmodsd="find . -type d -exec chmod 775 {} \;"
alias lgrep="ls -1 | grep -i"

# allow approximate
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# tab completion for PID
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always

# cd not select parent dir.
zstyle ':completion:*:cd:*' ignore-parents parent pwd

zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion::complete:*' use-cache 1

bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

bindkey "^[[3~" delete-char
bindkey "^[[2~" end-of-history

bindkey '^[[5~' up-line-or-history
bindkey '^[[6~' down-line-or-history
bindkey "^r" history-incremental-search-backward
bindkey ' ' magic-space    # also do history expansion on space
bindkey '^I' complete-word # complete on tab, leave expansion to _expand

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

prompt walters
