[[ -s "$HOME/.shell" ]] && source "$HOME/.shell"

# zsh # # # # # # # # # # # # # # # # #

[ -f "$HOME/.git-completion.zsh" ] && source "$HOME/.git-completion.zsh"

fpath=(~/.zsh $fpath)

# original zshrc  # # # # # # # # # # #

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME='agnoster'

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git osx docker docker-compose heroku npm nvm postgres python)

source $ZSH/oh-my-zsh.sh

# TODO tmp
# source $CODE/\&c/shell/zsh-git-prompt/zshrc.sh
# PROMPT='%B%m%~%b$(git_super_status) %# '
# PS1=$PROMPT

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

unsetopt share_history

# source $HOME/.bash_aliases
# source $HOME/.bash_profile

# export PIPENV_SHELL_COMPAT=1
# export PIPENV_MAX_DEPTH=6
# source $(pew shell_config)

# prompt_context() {
#   if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
#     # prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
#   fi
# }
