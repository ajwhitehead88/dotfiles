# check if zplug is installed
[[ -d ~/.zplug  ]] || {
    curl -fLo ~/.zplug/zplug --create-dirs https://git.io/zplug
    source ~/.zplug/zplug && zplug update --self
}

source ~/.zplug/zplug

zplug "b4b4r07/zplug"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", nice:10

# install any uninstalled plugins
zplug check || zplug install

zplug load

# variables
export EDITOR=vim
export LANG=en_GB.UTF-8
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

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
setopt menu_complete
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
setopt auto_cd
setopt auto_pushd
setopt pushd_minus
setopt pushd_ignore_dups
setopt complete_aliases
unsetopt hist_verify

# bindings
bindkey -v

# history
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

# completion
autoload -U compinit
compinit

# colours
autoload -U colors
colors

# prompt
PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg_no_bold[yellow]%}%1~ %{$reset_color%}%# "
RPROMPT="[%{$fg_no_bold[yellow]%}%?%{$reset_color%}]"
