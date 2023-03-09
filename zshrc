if [ -f ${HOME}/.zplug/init.zsh ]; then
    source ${HOME}/.zplug/init.zsh
fi

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug 'zsh-users/zsh-history-substring-search'
zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
zplug "woefe/git-prompt.zsh"

# install any uninstalled plugins
zplug check || zplug install

zplug load

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# exports
export EDITOR=nvim
export VISUAL=nvim
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

# aliasas
alias :q="exit"
alias :q!="exit"
alias vim="nvim"
alias vi="nvim"
alias gvim="nvim"
alias sudo="sudo -E"
alias ls="ls --color=auto"
alias grep="grep --color=auto"

# options
setopt auto_resume
setopt no_beep
setopt brace_ccl
setopt correct
setopt equals
setopt no_flow_control
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt extended_history
setopt hist_expand
setopt long_list_jobs
setopt magic_equal_subst
setopt mark_dirs
setopt nomenucomplete
setopt nolistambiguous
setopt list_rows_first
setopt glob_complete
setopt multios
setopt print_exit_value
setopt pushd_ignore_dups
setopt pushd_silent
setopt short_loops
setopt hist_no_store
setopt hash_cmds
setopt numeric_glob_sort
setopt interactive_comments
setopt rm_star_wait
setopt extended_glob
setopt always_last_prompt
setopt auto_list
setopt auto_param_slash
setopt auto_param_keys
setopt list_types
setopt list_packed
setopt autonamedirs
setopt auto_cd
setopt auto_pushd
setopt pushd_minus
setopt pushd_ignore_dups
setopt complete_aliases
setopt prompt_subst
unsetopt hist_verify

# bindings
bindkey -v

bindkey "$terminfo[kLFT5]" backward-word
bindkey "$terminfo[kRIT5]" forward-word

# history
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

_history-incremental-search-backward() {
  zle .history-incremental-search-backward $BUFFER
}

zle -N history-incremental-search-backward _history-incremental-search-backward
bindkey '^R' history-incremental-search-backward


autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
# bindkey "$terminfo[kcuu1]" up-line-or-beginning-search
# bindkey "$terminfo[kcud1]" down-line-or-beginning-search
# bindkey "^[[A" up-line-or-beginning-search
# bindkey "^[[B" down-line-or-beginning-search
bindkey "$key[Up]" up-line-or-beginning-search
bindkey "$key[Down]" down-line-or-beginning-search

# completion
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# colours
autoload -U colors && colors

# prompt
RPROMPT='$(gitprompt)'

PROMPT='%{$fg[yellow]%}%~%{$fg_bold[white]%}> %{$reset_color%}'
